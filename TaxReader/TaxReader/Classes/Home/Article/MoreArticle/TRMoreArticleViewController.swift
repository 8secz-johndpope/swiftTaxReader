//
//  TRMoreArticleViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/12.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRMoreArticleViewController: TRBaseViewController {
    
    var dataArray: [TRArticleDataRecdModel]? = []
    
    lazy var navView: UIView = {
        let view = LXNavigationBarSearchView.init(frame: .zero)
        view.isHasSeniorButton = false
        view.navBackButtonClickBlock = {[weak self](button) in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.navTextFieldShouldReturnBlock = {[weak self](textField) in
            let nextVc = TRArticleSearchViewController(searchText: textField.text, seniorModel: TROwnSeniorSearchModel.init())
            self?.navigationController?.pushViewController(nextVc, animated: true)
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
        NetworkHomeArticleRecd()
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRMoreArticleViewController {
    func NetworkHomeArticleRecd() {
        networkViewModel.homeArticleRecdBlock = {[unowned self] in
            
            if self.networkViewModel.articleRecdModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.articleRecdModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.articleRecdModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkHomeArticleRecd()
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            
            self.dataArray = self.networkViewModel.articleRecdModel?.data
            self.tableView.reloadData()
        }
        
        networkViewModel.refreshDataSource_ArticleRecd()
    }
}


extension TRMoreArticleViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TRSearchDetailTableViewCellID, for: indexPath) as! TRSearchDetailTableViewCell
        var model: TRArticleDataRecdModel = self.dataArray?[indexPath.section] ?? TRArticleDataRecdModel.init()
        model.cellIndexPathSection = indexPath.section
        cell.articleDataRecdModel = model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model: TRArticleDataRecdModel = self.dataArray?[indexPath.row] ?? TRArticleDataRecdModel.init()
        let nextVc = TRArticleReadViewController(ArticleID: "\(model.ReadSourceID)")
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

