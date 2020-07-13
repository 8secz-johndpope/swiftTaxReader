//
//  TRArticleSearchViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/12.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRArticleSearchViewController: UIViewController {
    
    var searchText: String?
    convenience init(searchText: String?) {
        self.init()
        self.searchText = searchText
    }
    
    private var page: Int = 1
    var dataArr: [TRArticleSearchDataDataModel]? = []
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "文章"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    private let TRSearchDetailTableViewCellID = "TRSearchDetailTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = LXTableViewBackgroundColor
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(TRSearchDetailTableViewCell.self, forCellReuseIdentifier: TRSearchDetailTableViewCellID)
        tableView.uHead = URefreshHeader{ [weak self] in
            self?.NetworkArticleSearch(more: false)
        }
        
        tableView.uFoot = URefreshFooter{ [weak self] in
            self?.NetworkArticleSearch(more: true)
        }
        
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
            make.left.right.bottom.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        NetworkArticleSearch(more: false)
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRArticleSearchViewController {
    func NetworkArticleSearch(more: Bool) {
        networkViewModel.updateBlock = {[unowned self] in
            self.tableView.uHead.endRefreshing()
            if self.dataArr?.count == self.networkViewModel.orderFindModel?.totalCount {
                self.tableView.uFoot.endRefreshingWithNoMoreData()
            }else {
                self.tableView.uFoot.endRefreshing()
            }

            if self.networkViewModel.articleSearchModel?.ret == false{
                MBProgressHUD.showWithText(text: self.networkViewModel.articleSearchModel?.msg ?? "", view: self.view)
                return
            }
            
            if more == false { self.dataArr?.removeAll() }
            self.dataArr?.append(contentsOf: self.networkViewModel.articleSearchModel?.data?.data ?? [])
            self.tableView.reloadData()
        }
        
        page = (more ? ( page + 1) : 1)
        networkViewModel.refreshDataSource_ArticleSearch(KeyWord: searchText ?? "税", PageIndex: "\(page)", PageSize: "10")
    }
}


extension TRArticleSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TRSearchDetailTableViewCellID, for: indexPath) as! TRSearchDetailTableViewCell
        var model: TRArticleSearchDataDataModel = self.dataArr?[indexPath.section] ?? TRArticleSearchDataDataModel.init()
        model.cellIndexPathSection = indexPath.section
        cell.articleSearchDadaDataModel = model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model: TRArticleSearchDataDataModel = self.dataArr?[indexPath.section] ?? TRArticleSearchDataDataModel.init()
        let nextVc = TRArticleReadViewController(ArticleID: "\(model.ArticleID)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.red
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = LXGrayColor
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            print("111111")
        }
    }
}
