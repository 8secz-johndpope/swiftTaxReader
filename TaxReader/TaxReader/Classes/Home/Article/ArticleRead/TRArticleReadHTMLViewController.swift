//
//  TRArticleReadHTMLViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRArticleReadHTMLViewController: UIViewController {
    
    var ArticleID: String?
    convenience init(ArticleID: String?) {
        self.init()
        self.ArticleID = ArticleID
    }
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "资讯详情"
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
        NetworkArticleNewsDetail(ArticleID: self.ArticleID)
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
                return
            }
            
            self.richTextView.richText = self.networkViewModel.articleNewsDetailModel?.data?.News_Content_HTML
        }
        
        networkViewModel.refreshDataSource_articleNewsDetail(NewsID: ArticleID ?? "", Number: "1")
    }
}
