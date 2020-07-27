//
//  TRArticleReadHTMLViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

enum HTMLTYPE {
    case typeArticleDetail
    case typeInfos
}

class TRArticleReadHTMLViewController: UIViewController {
    
    var htmlType: HTMLTYPE?
    var ArticleID: String?
    var articleRichText: String?
    convenience init(htmlType: HTMLTYPE?, ArticleID: String?, articleRichText: String?) {
        self.init()
        self.htmlType = htmlType
        self.ArticleID = ArticleID
        self.articleRichText = articleRichText
    }
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = (self.htmlType == HTMLTYPE.typeInfos) ? "资讯详情" : "阅读全文"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    var html: String!
    
    var loadingView: LoadingView = {
        let loadingView = LoadingView()
        return loadingView
    }()
    
    lazy var richTextView: RichTextView = {
        let view = RichTextView(frame: .zero, fromVC: self)
        view.webHeight = {[unowned self] height in
            self.loadingView .removeFromSuperview()
        }
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.richTextView)
        self.richTextView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        if self.htmlType == HTMLTYPE.typeInfos{
            NetworkArticleNewsDetail(ArticleID: self.ArticleID)
        }else if self.htmlType == HTMLTYPE.typeArticleDetail {
            self.richTextView.richText = self.articleRichText
        }
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRArticleReadHTMLViewController{
    func NetworkArticleNewsDetail(ArticleID: String?) {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.articleNewsDetailModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.articleNewsDetailModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.articleNewsDetailModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkArticleNewsDetail(ArticleID: ArticleID)
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }

                
                return
            }
            
            self.richTextView.richText = self.networkViewModel.articleNewsDetailModel?.data?.News_Content_HTML
        }
        
        networkViewModel.refreshDataSource_ArticleNewsDetail(NewsID: ArticleID ?? "", Number: "1")
    }
}
