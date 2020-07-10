//
//  TRMoreInfoViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/12.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRMoreInfoViewController: TRBaseViewController {
    
    var dataArray: [TRArticleGettopnewsDataModel]? = []

    lazy var navView: UIView = {
        let view = LXNavigationBarSearchView.init(frame: .zero)
        view.navBackButtonClickBlock = {[weak self](button) in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.navTextFieldShouldReturnBlock = {[weak self](textField) in
            let nextVc = TRArticleSearchViewController(searchText: textField.text)
            self?.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        return view
    }()
    
    private let TRCatalogTableViewCellID = "TRCatalogTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(UINib.init(nibName: "TRCatalogTableViewCell", bundle: nil), forCellReuseIdentifier: TRCatalogTableViewCellID)
        
        return tableView
    }()

    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        NetworkHomeArticleGetTopNews()
    }
        
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRMoreInfoViewController {
    func NetworkHomeArticleGetTopNews() {
        networkViewModel.homeArticleGetTopNewsBlock = {[unowned self] in
            self.dataArray = self.networkViewModel.articleGetTopNewsModel?.data
            self.tableView.reloadData()
        }
        
        networkViewModel.refreshDataSource_articleGetTopNews(NewsID: "", Number: "")
    }
}

extension TRMoreInfoViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TRCatalogTableViewCellID, for: indexPath) as! TRCatalogTableViewCell
        
        let model: TRArticleGettopnewsDataModel = self.dataArray?[indexPath.row] ?? TRArticleGettopnewsDataModel.init()
        
        cell.trTitleLabel?.text = model.News_Title
        cell.trTitleLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell.trTitleLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell.trTitleLabel?.lineBreakMode = .byCharWrapping
        cell.trTitleLabel?.numberOfLines = 2
         
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model: TRArticleGettopnewsDataModel = self.dataArray?[indexPath.row] ?? TRArticleGettopnewsDataModel.init()
        let nextVc = TRArticleReadHTMLViewController(ArticleID: "\(model.News_ID)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}



