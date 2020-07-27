//
//  TRArticleReadViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/19.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TRArticleReadViewController: TRBaseViewController {
    
    var ArticleID: String?
    convenience init(ArticleID: String?) {
        self.init()
        self.ArticleID = ArticleID
    }
    
    var htmlContent: String?
    var productIssueNumberDataModel: TRProductGetIssueNumberDataModel?
    
    lazy var navView: TRReadNavigationView = {
        let view = TRReadNavigationView.init(frame: .zero)
        view.navBackButtonClick = {[weak self](button, buttonType) in
            switch buttonType {
            case .buttonBack:
                self?.navigationController?.popViewController(animated: true)
            case .buttonFavor:
                self?.blockFavorButtonAction()
            case .buttonBuy:
                self?.blockBuyButtonAction()
            }
        }
        
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: .zero)
        scrollView.backgroundColor = UIColor.white
        scrollView.contentSize = CGSize.init(width: LXScreenWidth, height: LXScreenHeight)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // 单行
    lazy var titleLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var detailView: TRReadTypeDetailView = {
        let view = TRReadTypeDetailView.init(frame: .zero)
        view.backgroundColor = UIColor.orange
        
        return view
    }()
    
    lazy var articleLabel: LXInsetsLabel = {
        let view = LXInsetsLabel(frame: .zero)
        view.backgroundColor = LXTableViewBackgroundColor
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 16.0)
        view.textAlignment = .left
        view.numberOfLines = 0
        
        view.textInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        return view
    }()
    
    lazy var footerButtonView: LXFooterButtonCenterView = {
        let view = LXFooterButtonCenterView.init(frame: .zero)
        view.footerButton.setTitle("阅读全文", for: .normal)
        view.footerButtonClick = {[weak self](button) in
            self?.NetworkArticleGetHtmlContent(ArticleID: self?.ArticleID)
            //self?.richTextView.isHidden = false
        }
        
        return view
    }()
    
//    lazy var richTextView: RichTextView = {
//        let view = RichTextView(frame: .zero, fromVC: self)
//        view.isHidden = true
//
//        return view
//    }()

    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(LXScreenHeight)
        }
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.contentView.addSubview(self.detailView)
        self.detailView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(90)
        }
        
        self.contentView.addSubview(self.articleLabel)
        self.articleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.detailView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.contentView.addSubview(self.footerButtonView)
        self.footerButtonView.snp.makeConstraints { (make) in
            make.top.equalTo(self.articleLabel.snp.bottom).offset(64)
            make.left.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
//        self.contentView.addSubview(self.richTextView)
//        self.richTextView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.articleLabel.snp.bottom)
//            make.left.bottom.right.equalToSuperview()
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        NetworkArticleDetail(ArticleID: ArticleID)
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRArticleReadViewController{
    func NetworkArticleDetail(ArticleID: String?) {
        networkViewModel.articleDetailUpdateBlock = {[unowned self] in
            if self.networkViewModel.articleDetailModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.articleDetailModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.articleDetailModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkArticleDetail(ArticleID: ArticleID)
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }

                
                return
            }
            
            let isFavorite = self.networkViewModel.articleDetailModel?.data?.IsFavorite ?? false
            self.navView.trFavorButton.isSelected = isFavorite ? true : false
            self.titleLabel.text = self.networkViewModel.articleDetailModel?.data?.ArticleTitle
            self.detailView.readTypeDataModel = self.networkViewModel.articleDetailModel?.data
            
            let contentText = "内容简介：\n        \(self.networkViewModel.articleDetailModel?.data?.ArticleAbstract ?? "")"
            let textHeight:CGFloat = self.lxheight(for: contentText)
            self.articleLabel.snp.updateConstraints { (make) in
                make.height.equalTo(textHeight)
            }
            
            //通过富文本来设置行间距
            let paraph = NSMutableParagraphStyle()
            paraph.lineSpacing = 5
            let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),
                              NSAttributedString.Key.paragraphStyle: paraph]
            self.articleLabel.attributedText = NSAttributedString(string: contentText, attributes: attributes)
            
            // 调用订阅下的弹框数据
            let dataModel: TRArticleDetailDataModel? = self.networkViewModel.articleDetailModel?.data
            self.NetworkGetIssueNumber(model: dataModel)
        }
        
        networkViewModel.refreshDataSource_ArticleDetail(ArticleID: ArticleID ?? "")
    }
    
    func NetworkGetIssueNumber(model: TRArticleDetailDataModel?) {
        networkViewModel.getIssueNumberUpdateBlock = {[unowned self] in
            if self.networkViewModel.productGetIssueNumberModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.productGetIssueNumberModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.productGetIssueNumberModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkGetIssueNumber(model: model)
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }

                
                return
            }
            var dataModel: TRProductGetIssueNumberDataModel? = self.networkViewModel.productGetIssueNumberModel?.data
            dataModel?.isHasCurrentPian = true
            dataModel?.ArticleTitle = model?.ArticleTitle
            dataModel?.PubIssueYear = "\(model?.PubIssueYear ?? 0)"
            dataModel?.PubIssueNum = "\(model?.PubIssueNum ?? 0)"
            dataModel?.ArticleIOSPrice = "\(model?.ArticleIOSPrice ?? 0.00)"
            self.productIssueNumberDataModel = dataModel
        }
        
        networkViewModel.refreshDataSource_ProductGetIssueNumber(PubIssueID: "\(model?.PubIssueID ?? 0)",
                                                                 PubID: "\(model?.PubID ?? 0)",
                                                                 Year: "\(model?.PubIssueYear ?? 0)")
    }
    
    func NetworkArticleGetHtmlContent(ArticleID: String?) {
        networkViewModel.articleGetHtmlContentUpdateBlock = {[unowned self] in
            if self.networkViewModel.articleGetHtmlContentModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.articleGetHtmlContentModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.articleGetHtmlContentModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkArticleGetHtmlContent(ArticleID: ArticleID)
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }

                
                return
            }
            
            let richText = self.networkViewModel.articleGetHtmlContentModel?.data
            let nextVc = TRArticleReadHTMLViewController(htmlType: .typeArticleDetail, ArticleID: self.ArticleID, articleRichText: richText)
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        networkViewModel.refreshDataSource_ArticleGetHtmlContent(ArticleID: ArticleID ?? "")
    }
      
    
    /*
    func NetworkArticleNewsDetail(ArticleID: String?) {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.articleNewsDetailModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.articleNewsDetailModel?.msg ?? "", view: self.view)
                return
            }
        }
        
        networkViewModel.refreshDataSource_articleNewsDetail(NewsID: ArticleID ?? "", Number: "1")
    }
     */
}


extension TRArticleReadViewController{
    func blockFavorButtonAction() {
        if self.navView.trFavorButton.isSelected {
            self.networkViewModel.updateBlock = {[unowned self] in
                if self.networkViewModel.favorCancelModel?.ret == false {
                    MBProgressHUD.showWithText(text: self.networkViewModel.favorCancelModel?.msg ?? "", view: self.view)
                    
                    // 3000 authorization参数不能为空
                    if self.networkViewModel.favorCancelModel?.msgCode == NetDataAuthorizationNull {
                        let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                            let popoverView = TRWLoginViewController()
                            popoverView.modalPresentationStyle = .custom
                            popoverView.isTypeShowFromTokenNull = true
                            popoverView.loginReloadBlock = {[unowned self] in
                                self.blockFavorButtonAction()
                            }
                            self.present(popoverView, animated: true, completion: nil)
                        }
                        self.present(alertController, animated: true, completion: nil)
                    }

                    
                    return
                }
                
                self.navView.trFavorButton.isSelected = false
            }
            let articleID = self.networkViewModel.articleDetailModel?.data?.ArticleID
            self.networkViewModel.refreshDataSource_FavorCancel(FavoriteID: "\(articleID ?? 0)", ReadFavoriteType: "30")
        } else {
            self.networkViewModel.updateBlock = {[unowned self] in
                if self.networkViewModel.favorAddModel?.ret == false {
                    MBProgressHUD.showWithText(text: self.networkViewModel.favorAddModel?.msg ?? "", view: self.view)
                    
                    // 3000 authorization参数不能为空
                    if self.networkViewModel.favorAddModel?.msgCode == NetDataAuthorizationNull {
                        let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                            let popoverView = TRWLoginViewController()
                            popoverView.modalPresentationStyle = .custom
                            popoverView.isTypeShowFromTokenNull = true
                            popoverView.loginReloadBlock = {[unowned self] in
                                self.blockFavorButtonAction()
                            }
                            self.present(popoverView, animated: true, completion: nil)
                        }
                        self.present(alertController, animated: true, completion: nil)
                    }

                    
                    return
                }
                
                self.navView.trFavorButton.isSelected = true
            }
            
            let ReadSourceID = self.networkViewModel.articleDetailModel?.data?.ArticleID ?? 0
            let ReadParentID = self.networkViewModel.articleDetailModel?.data?.ReadTypeRootID ?? 0
            self.networkViewModel.refreshDataSource_FavorAdd(ReadSourceID: "\(ReadSourceID)", ReadParentID: "\(ReadParentID)", ReadFavoriteType: "30")
        }
        
    }
    
    func blockBuyButtonAction() {
        guard let nextVc = TRBuyActionSheetViewController(model: self.productIssueNumberDataModel) else { return }
        nextVc.delegate = self
        present(nextVc, animated: false, completion:  nil)
    }
}

extension TRArticleReadViewController: TRBuyActionSheetViewControllerDelegate {
    func sheetViewBuyButtonDidSelected(dataArrayShopModel: [YCOrderShopModel]?) {
        let nextVc = TRCartSureOrderViewController(dataArrayShopModel: dataArrayShopModel)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension TRArticleReadViewController{
    // 计算文本高度
    func lxheight(for contentText: String?) -> CGFloat {
        var height: CGFloat = 10
        guard let text = contentText else { return height }
        let label = UILabel()
        label.numberOfLines = 0
        
        //label.font = UIFont.systemFont(ofSize: 15)
        //label.text = text
        
        //通过富文本来设置行间距
        let paraph = NSMutableParagraphStyle()
        //将行间距设置为28
        paraph.lineSpacing = 5
        //样式属性集合
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16),
                          NSAttributedString.Key.paragraphStyle: paraph]
        label.attributedText = NSAttributedString(string: text, attributes: attributes)

        
        height += label.sizeThatFits(CGSize(width: LXScreenWidth - 16, height: CGFloat.infinity)).height
        return height
    }
}


