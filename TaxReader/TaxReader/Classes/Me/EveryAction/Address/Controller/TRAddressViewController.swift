//
//  TRAddressViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/14.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRAddressViewController: UIViewController {
    
    private var dataArray: [TRAddressInfoDataModel]?
    
    private let TRAddressTableViewCellID = "TRAddressTableViewCell"
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "收货地址"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
        
    lazy var footerView: UIView = {
        let view = LXFooterButtonView.init(frame: .zero)
        view.footerButton.setTitle("+ 新建收货地址", for: UIControl.State.normal)
        view.footerButtonClick = {[weak self](button) in
            let nextVc = TRSetAddressViewController(isAddressEdit: false, addressInfoDataModel: nil)
            self?.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = LXTableViewBackgroundColor
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(TRAddressTableViewCell.self, forCellReuseIdentifier: TRAddressTableViewCellID)
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.bottom.equalTo(self.footerView.snp.top)
            make.left.right.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkDataInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
    }
        
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRAddressViewController {
    func NetworkDataInfo() {
        viewModel.updateBlock = {[unowned self] in
            
            if self.viewModel.addressInfoModel?.ret == false {
                MBProgressHUD.showWithText(text: self.viewModel.addressInfoModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.viewModel.addressInfoModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkDataInfo()
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            
            self.dataArray = self.viewModel.addressInfoModel?.data
            self.tableView.reloadData()
        }
        viewModel.refreshDataSource_AddressInfo()
    }
}

extension TRAddressViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model: TRAddressInfoDataModel = self.dataArray?[indexPath.section] ?? TRAddressInfoDataModel.init()
        let cell = tableView.dequeueReusableCell(withIdentifier: TRAddressTableViewCellID, for: indexPath) as! TRAddressTableViewCell
        cell.addressInfoModel = model
        
        cell.cellEditBtnClick = {() in
            self.cellEditButtonClickAlertView(cell, indexPath: indexPath)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
}


extension TRAddressViewController {
    func cellEditButtonClickAlertView(_ cell: UITableViewCell, indexPath: IndexPath) {
        let model: TRAddressInfoDataModel = self.dataArray?[indexPath.section] ?? TRAddressInfoDataModel.init()
        
        // alertDefault.setValue(UIColor.red, forKey: "_titleTextColor")
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let alertDefault = UIAlertAction(title: "设置默认", style: .default) { (UIAlertAction) in
            print("you selected alertDefault")
            self.cellEditingStyleSetDefaultCell(UserAddrID: "\(model.UserAddrID)")
        }
        
        let alertEdit = UIAlertAction(title: "编辑", style: .default) { (UIAlertAction) in
            let nextVc = TRSetAddressViewController(isAddressEdit: true, addressInfoDataModel: model)
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
        let alertDelete = UIAlertAction(title: "删除", style: .destructive) { (UIAlertAction) in
            print("you selected alertDelete")
            self.cellEditingStyleDeleteCell(UserAddrID: "\(model.UserAddrID)")
        }
        
        let alertCancel = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) in
            print("you selected alertCancel")
        }
        
        alertController.addAction(alertDefault)
        alertController.addAction(alertEdit)
        alertController.addAction(alertDelete)
        alertController.addAction(alertCancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func cellEditingStyleSetDefaultCell(UserAddrID: String) {
        print("UserAddrID = \(UserAddrID)")
        
        let alert = UIAlertController.init(title: "您确定要设置为默认地址吗?", message: "", preferredStyle: .alert)
        let confirmaction = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) in
            self.viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.addressSetDefaultModel?.msg ?? "", view: self.view)
                
                if self.viewModel.addressSetDefaultModel?.ret == false {
                    MBProgressHUD.showWithText(text: self.viewModel.addressSetDefaultModel?.msg ?? "", view: self.view)
                    
                    // 3000 authorization参数不能为空
                    if self.viewModel.addressSetDefaultModel?.msgCode == NetDataAuthorizationNull {
                        let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                            let popoverView = TRWLoginViewController()
                            popoverView.modalPresentationStyle = .custom
                            popoverView.isTypeShowFromTokenNull = true
                            popoverView.loginReloadBlock = {[unowned self] in
                                self.cellEditingStyleSetDefaultCell(UserAddrID: UserAddrID)
                            }
                            self.present(popoverView, animated: true, completion: nil)
                        }
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                    return
                }

                
                self.NetworkDataInfo()
            }
            self.viewModel.refreshDataSource_AddressSetDefault(UserAddrID: UserAddrID)
        }
        let cancleAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alert.addAction(confirmaction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func cellEditingStyleDeleteCell(UserAddrID: String) {
        print("UserAddrID = \(UserAddrID)")
        
        let alert = UIAlertController.init(title: "您确定要删除这个信息吗?", message: "", preferredStyle: .alert)
        let confirmaction = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) in
            self.viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.addressDeleteModel?.msg ?? "", view: self.view)
                
                if self.viewModel.addressDeleteModel?.ret == false {
                    MBProgressHUD.showWithText(text: self.viewModel.addressDeleteModel?.msg ?? "", view: self.view)
                    
                    // 3000 authorization参数不能为空
                    if self.viewModel.addressDeleteModel?.msgCode == NetDataAuthorizationNull {
                        let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                            let popoverView = TRWLoginViewController()
                            popoverView.modalPresentationStyle = .custom
                            popoverView.isTypeShowFromTokenNull = true
                            popoverView.loginReloadBlock = {[unowned self] in
                                self.cellEditingStyleDeleteCell(UserAddrID: UserAddrID)
                            }
                            self.present(popoverView, animated: true, completion: nil)
                        }
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                    return
                }

                
                self.NetworkDataInfo()
            }
            self.viewModel.refreshDataSource_AddressDelete(UserAddrID: UserAddrID)
        }
        let cancleAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alert.addAction(confirmaction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)
    }
}

