//
//  TRFavorArticleViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/14.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit


class TRFavorArticleViewController: UIViewController {
    
    var dataArr: [TRFavorFindDataModel]? = []
    
    private let TRFavorArticleTableViewCellID = "TRFavorArticleTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = LXTableViewBackgroundColor
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(TRFavorArticleTableViewCell.self, forCellReuseIdentifier: TRFavorArticleTableViewCellID)
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkFavorFind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        setupLayout()
    }
        
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRFavorArticleViewController {
    func NetworkFavorFind() {
        networkViewModel.updateBlock = {[unowned self] in
            self.dataArr = self.networkViewModel.favorFindModel?.data
            self.tableView.reloadData()
        }
        
        networkViewModel.refreshDataSource_FavorFind(FavoriteID: "", ReadFavoriteType: "30")
    }
}

extension TRFavorArticleViewController: UITableViewDataSource, UITableViewDelegate {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: TRFavorArticleTableViewCellID, for: indexPath) as! TRFavorArticleTableViewCell
        let model: TRFavorFindDataModel = self.dataArr?[indexPath.section] ?? TRFavorFindDataModel.init()
        cell.findDataModel = model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model: TRFavorFindDataModel = self.dataArr?[indexPath.row] ?? TRFavorFindDataModel.init()
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
            let model: TRFavorFindDataModel = self.dataArr?[indexPath.section] ?? TRFavorFindDataModel.init()
            editingStyleDeleteCell(PubIssueID: "\(model.ArticleID)")
        }
    }
}

extension TRFavorArticleViewController {
    func editingStyleDeleteCell(PubIssueID: String) {
        print("PubIssueID = \(PubIssueID)")
        
        let alert = UIAlertController.init(title: "您确定要删除这个信息吗?", message: "", preferredStyle: .alert)
        let confirmaction = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) in
            self.networkViewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.networkViewModel.favorCancelModel?.msg ?? "", view: self.view)
                self.NetworkFavorFind()
            }
            self.networkViewModel.refreshDataSource_FavorCancel(FavoriteID: PubIssueID, ReadFavoriteType: "30")
        }
        let cancleAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alert.addAction(confirmaction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)
    }
}


