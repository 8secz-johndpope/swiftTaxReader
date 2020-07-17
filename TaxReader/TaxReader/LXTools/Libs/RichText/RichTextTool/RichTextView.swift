//
//  RichTextView.swift
//  hxquan-swift
//
//  Created by Tiny on 2018/11/30.
//  Copyright © 2018年 hxq. All rights reserved.
//  加载富文本内容

import UIKit
import WebKit
import MBProgressHUD

let TRPhoneBottomHeight = LXPhoneLHBarHeight + 44

class RichTextView: UIView {

    /// 富文本加载完成后返回高度
    var webHeight: ((_ height: CGFloat)->Void)?
    
    var webViewHeight: CGFloat = 0.0
    
    /// 是否允许图片点击弹出
    var isShowImage: Bool = true
    
    /// webView是否可以滚动 默认可以滚动
    var isScrollEnabled: Bool = true{
        didSet{
            webView.scrollView.isScrollEnabled = isScrollEnabled
        }
    }
    
    /// 富文本内容
    var richText: String? {
        didSet{
            if richText == nil {
                richText = ""
            }
            if !isSuccess {
                loadHtml(richText!)
            }
        }
    }
    
    /// 富文本是否加载成功
    private var isSuccess: Bool = false
    
        private lazy var nextView: UIView = { [unowned self] in
            let view = UIView(frame: .zero)
            view.backgroundColor = UIColor.red
            
//            view.isUserInteractionEnabled = true
//            let tap = UITapGestureRecognizer.init(target: self, action: #selector(nextViewTap(sender:)))
//            tap.delegate = self
//            view.addGestureRecognizer(tap)
            
            return view
        }()
    
    private lazy var lastView: UIView = { [unowned self] in
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.red
        
//        view.isUserInteractionEnabled = true
//        let tap = UITapGestureRecognizer.init(target: self, action: #selector(lastViewTap(sender:)))
//        tap.delegate = self
//        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    private lazy var pageContentView: LXPhoneBottomView = { [unowned self] in
        let view = LXPhoneBottomView(frame: .zero)
        view.buttomButtonClick = {[unowned self](button) in
            self.blockBottomButtonClick(button: button)
        }
        
        return view
    }()
    
    /// wkwebView 用来加载富文本
    private lazy var webView: WKWebView = { [unowned self] in
        let config = WKWebViewConfiguration()
        config.userContentController = WKUserContentController()
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.delegate = self
        
//        // 添加的左右翻页手势
//        webView.isUserInteractionEnabled = true
//        let lefttap = UISwipeGestureRecognizer.init(target: self, action: #selector(swipe(sender:)))
//        lefttap.direction = .left
//        webView.addGestureRecognizer(lefttap)
//
//        let righttap = UISwipeGestureRecognizer.init(target: self, action: #selector(swipe(sender:)))
//        righttap.direction = .right
//        webView.addGestureRecognizer(righttap)
        
        return webView
    }()
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            print("pre")
        }else {
            print("next")
        }
    }
    
    /// 富文本中图片数组
    private var imgesArr = [String]()
    
    /// 图片数字标识
    private lazy var indexLabel: HXQLabel = {
        let label = HXQLabel(color:UIColor.white ,font: UIFont.systemFont(ofSize:16))
        return label
    }()
    
    
    
    /// 保存按钮
    private lazy var saveBtn: HXQButton = {
        let button = HXQButton(title: "保存", color: UIColor.white, font: UIFont.systemFont(ofSize:16)){ [unowned self] btn in
            //点击保存 将图片保存在相册
            if let image = self.browser?.currentImage{
                MBProgressHUD.show()
                image.savedPhotosAlbum(completeBlock: { (success) in
                    MBProgressHUD.hide()
                    if success{
                        MBProgressHUD.showSuccess("保存成功")
                    }else{
                        MBProgressHUD.showError("保存失败")
                    }
                })
            }
        }
        return button
    }()
    
    /// 图片浏览器 这里一定要weak,要不然控制器无法释放
    private weak var browser: GKPhotoBrowser?
    
    /// 图片显示在那个控制器上
    private weak var currentVc: UIViewController?
    
    convenience init(frame: CGRect, fromVC photoBrwoserVc: UIViewController? = nil) {
        self.init(frame: frame)
        currentVc = photoBrwoserVc
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI(){
        
//        //设置约束
//        self.addSubview(webView)
//        webView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//            make.height.equalTo(0)
//        }
        
        self.addSubview(pageContentView)
        pageContentView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(LXPhoneLHBarHeight + 44)
        }
        
        self.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            //make.bottom.equalToSuperview()
            make.bottom.equalTo(self.pageContentView.snp.top)
            make.height.equalTo(0)
        }
    }
    
    private func loadHtml(_ html: String) {
        let htmlContent = """
        <html>
        <head>
        <meta charset='utf-8' name='viewport' content='width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'/>
        <style type=\"text/css\">
        img {
        max-width:100%;
        -webkit-tap-highlight-color:rgba(0,0,0,0);
        }
        </style>
        <script type=\"text/javascript\">
        </script>
        </head>
        <body>
        <div>
        <div id=\"webview_content_wrapper\">\(html)</div>
        </div>
        </body>
        </html>
        """
        webView.loadHTMLString(htmlContent, baseURL: nil)
    }
}

extension RichTextView: WKUIDelegate,WKNavigationDelegate{
    
    /// 加载成功
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        /*
        // 可修改字体大小颜色及背景
        webView.evaluateJavaScript("document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#FFF000'", completionHandler: nil)
        webView.evaluateJavaScript("document.body.style.backgroundColor=\"#1E1E1E\"", completionHandler: nil)
        webView.evaluateJavaScript("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '140%'", completionHandler: nil)
         */
        
        /// 获取网页高度
        webView.evaluateJavaScript("document.body.offsetHeight") {[unowned self] (result, _) in
            
            //计算高度
            if let webHeight = result as! CGFloat?{
                self.webView.snp.updateConstraints({ (make) in
                    make.height.equalTo(webHeight)
                })
                self.webHeight?(webHeight)
                self.webViewHeight = webHeight
            }else{
                self.webHeight?(0)
            }
        }
        
        /// 插入JS代码
        if isShowImage {
            insetJsToHtml()
        }
    }
    
    /// 加载失败
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.webHeight?(0)
    }
        
    /// 拦截
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let str = navigationAction.request.url?.absoluteString.removingPercentEncoding {
            if str.hasPrefix("hxqimage-preview"){  // 点击了图片
                
                //加载图片
                if let clickImg = (navigationAction.request.url as NSURL?)?.resourceSpecifier{
                    if isShowImage{
                        handleImageWithName(clickImg) //
                    }
                }
                //禁止跳转
                decisionHandler(.cancel)
                return
            }else if (str.hasPrefix("http")) || (str.hasPrefix("https")) {
                let url:URL? = URL.init(string: str)
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            }
            
        }
        decisionHandler(.allow)
    }
    
    private func insetJsToHtml(){
        webView.evaluateJavaScript("""
          function imageClickAction(){
            var imgs=document.getElementsByTagName('img');
            var length=imgs.length;
            for(var i=0;i<length;i++){
                img=imgs[i];
                img.onclick=function(){
                    window.location ='hxqimage-preview:'+this.src;
                }
            }
        }
        """, completionHandler: nil)
        
        //触发方法 给所有的图片添加onClick方法
        webView.evaluateJavaScript("imageClickAction();", completionHandler: nil)

        
        //拿到所有img标签对应的图片
        handleImgLabel()
    }
    
    private func handleImgLabel(){
        
        //要拿到所有img标签对应的图片的src
        
        //1.拿到img标签的个数
        webView.evaluateJavaScript("document.getElementsByTagName('img').length") { [unowned self](result, error) in
            
            if let length = result as! Int?{
                self.imgesArr.removeAll()
                for i in 0..<length{
                    let jsStr = "document.getElementsByTagName('img')[\(i)].src"
                    self.webView.evaluateJavaScript(jsStr, completionHandler: { (result, error) in
                        if let img = result as! String?{
                            self.imgesArr.append(img)
                        }
                    })
                }
            }
        }
    }
    
    private func handleImageWithName(_ clickImg: String){
        //触发点击事件  -- >拿到是第几个标签被点击了
        //遍历数组，查询查找当前第几个图被点击了
        var selectIndex: Int = 0
        var photos = [GKPhoto]()
        for (i,imgUrl) in imgesArr.enumerated() {
            if imgUrl == clickImg{
                selectIndex = i
            }
            let photo = GKPhoto()
            photo.url = URL(string: imgUrl)
            photos.append(photo)
        }
        
        let url = URL(string: clickImg)
        do {
            let data = try Data(contentsOf: url!)
            guard let image = UIImage(data: data) else { return }
            let resultArr = recognitionQRCode(qrCodeImage: image)
            print("resultArr = \(resultArr ?? [])")
            
            if resultArr?.count ?? 0 > 0 {
                let resultUrl: String = resultArr?.first ?? ""
                let url:URL? = URL.init(string: resultUrl)
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            }else {
                if !photos.isEmpty {
                    let browser = GKPhotoBrowser(photos: photos, currentIndex: selectIndex)
                    browser.showStyle = .none
                    browser.hideStyle = .zoomScale
                    browser.loadStyle = .indeterminateMask
                    browser.isResumePhotoZoom = true
                    browser.isAdaptiveSaveArea = true
                    //            browser.isStatusBarShow = true
                    browser.delegate = self
                    browser.setupCoverViews([self.indexLabel,self.saveBtn]) { [unowned self](photoBrowser, superFrame) in
                        self.resetCover(frame: superFrame, index: photoBrowser.currentIndex)
                    }
                    indexLabel.text = "\(selectIndex+1)/\(imgesArr.count)"
                    guard let currentVc = currentVc else{
                        return
                    }
                    browser.show(fromVC: currentVc)
                    self.browser = browser
                }
            }
            
            
        }catch let error as NSError {
            print(error)
        }
    }
    
    /* *  @param qrCodeImage 二维码的图片
       *  @return 结果的数组 */
    func recognitionQRCode(qrCodeImage: UIImage) -> [String]? {
        //1. 创建过滤器
        let detector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options: nil)
        
        //2. 获取CIImage
        guard let ciImage = CIImage(image: qrCodeImage) else { return nil }
        
        //3. 识别二维码
        guard let features = detector?.features(in: ciImage) else { return nil }
        
        //4. 遍历数组, 获取信息
        var resultArr = [String]()
        for feature in features {
            let featureMessage: CIQRCodeFeature = feature as! CIQRCodeFeature
            resultArr.append(featureMessage.messageString ?? "")
        }
        
        return resultArr
    }
}

extension RichTextView: GKPhotoBrowserDelegate{
    func photoBrowser(_ browser: GKPhotoBrowser, scrollEndedIndex index: Int) {
        resetCover(frame: browser.contentView.bounds, index: index)
        indexLabel.text = "\(index+1)/\(imgesArr.count)"
    }
    
    private func resetCover(frame: CGRect, index: Int){
        //设置保存按钮 和 index标签的位置
        indexLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.bottom.equalTo(-20)
        }
        saveBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(indexLabel)
            make.right.equalTo(-20)
        }
    }
}

extension RichTextView {
    func blockBottomButtonClick(button: UIButton) {
        print("buttonTag = \(button.tag) buttonTitle = \(button.titleLabel?.text ?? "")")
        switch button.tag {
        case 1:
            self.firstButtonClick(button: button)
        case 2:
            self.lastButtonClick(button: button)
        case 3:
            self.nextButtonClick(button: button)
        case 4:
            self.tailButtonClick(button: button)
        default:
            self.firstButtonClick(button: button)
        }
    }
    
    @objc func firstButtonClick(button: UIButton) {
        print("first")
        let scrollViewY = webView.scrollView.contentOffset.y
        if  (scrollViewY > 0) {
            transitionWithTypeLast()
            webView.scrollView.contentOffset.y = 0
        }else {
            MBProgressHUD.showWithText(text: "已经是第一页了", view: self)
        }
    }
        
    @objc func lastButtonClick(button: UIButton) {
        print("last")
        let scrollViewY = webView.scrollView.contentOffset.y
        if  (scrollViewY > 0) {
            transitionWithTypeLast()
            webView.scrollView.contentOffset.y -= (LXScreenHeight  - LXNavBarHeight - TRPhoneBottomHeight)
        }else {
            MBProgressHUD.showWithText(text: "已经是第一页了", view: self)
        }
    }
    
    @objc func nextButtonClick(button: UIButton) {
        print("next")
        let scrollViewY = webView.scrollView.contentOffset.y
        let screenWebViewHeight = (LXScreenHeight  - LXNavBarHeight - TRPhoneBottomHeight)
        if (scrollViewY + screenWebViewHeight) < webViewHeight {
            transitionWithTypeNext()
            webView.scrollView.contentOffset.y += (LXScreenHeight  - LXNavBarHeight - TRPhoneBottomHeight)
        }else {
            MBProgressHUD.showWithText(text: "已经是最后一页了", view: self)
        }
    }
    
    @objc func tailButtonClick(button: UIButton) {
        print("tail")
        let screenWebViewHeight = (LXScreenHeight  - LXNavBarHeight - TRPhoneBottomHeight)
        let scrollViewOffsetY = Int(webViewHeight.truncatingRemainder(dividingBy: screenWebViewHeight)  + 0.5)
        let scrollViewY = webView.scrollView.contentOffset.y
        if (scrollViewY + screenWebViewHeight) < webViewHeight {
            transitionWithTypeNext()
            webView.scrollView.contentOffset.y = CGFloat(webViewHeight - CGFloat(scrollViewOffsetY))
        }else {
            MBProgressHUD.showWithText(text: "已经是最后一页了", view: self)
        }
    }
    
    func transitionWithTypeLast(){
        let animation = CATransition()
        animation.duration = 0.7
        animation.type = CATransitionType(rawValue: "kCATransitionFade")
        animation.subtype = CATransitionSubtype(rawValue: "kCATransitionFromLeft")
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        self.layer.add(animation, forKey: "animation")
    }
    
    func transitionWithTypeNext(){
        let animation = CATransition()
        animation.duration = 0.7
        animation.type = CATransitionType(rawValue: "pageCurl")
        animation.subtype = CATransitionSubtype(rawValue: "kCATransitionFromRight")
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        self.layer.add(animation, forKey: "animation")
    }
}












































extension RichTextView: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        //        let scrollViewY = webView.scrollView.contentOffset.y
        //        let screenWebViewHeight = (LXScreenHeight  - LXNavBarHeight)
        //        if (scrollViewY + screenWebViewHeight) > webViewHeight {
        //            transitionWithTypeLast()
        //            webView.scrollView.contentOffset.y -= (LXScreenHeight  - LXNavBarHeight)
        //        }
                
        //
        //        let hitPoint = sender.location(in: sender.view)
        //
        //        if hitPoint.x < sender.view!.frame.size.width/3 {
        //            let scrollViewY = webView.scrollView.contentOffset.y
        //            let screenWebViewHeight = (LXScreenHeight  - LXNavBarHeight)
        //            if (scrollViewY + screenWebViewHeight) > webViewHeight {
        //                webView.scrollView.contentOffset.y -= (LXScreenHeight  - LXNavBarHeight)
        //            }
        //        }
        //        if hitPoint.x > sender.view!.frame.size.width*2/3 {
        //            let scrollViewY = webView.scrollView.contentOffset.y
        //            let screenWebViewHeight = (LXScreenHeight  - LXNavBarHeight)
        //            if (scrollViewY + screenWebViewHeight) < webViewHeight {
        //                webView.scrollView.contentOffset.y += (LXScreenHeight  - LXNavBarHeight)
        //            }
        //        }
        
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension RichTextView: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentOffset.y)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("开始拖动滑动")
    }
}


