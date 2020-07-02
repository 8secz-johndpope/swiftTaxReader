//
//  TRInvoiceAllViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRInvoiceAllViewController: UIViewController {
    var dataArray: [TRInvoiceInfoDataModel]?
    
    private let LXHeaderLabelViewID = "LXHeaderLabelView"
    private let TRInvoicePersonTableViewCellID = "TRInvoicePersonTableViewCell"
    private let TRInvoiceCompanyTableViewCellID = "TRInvoiceCompanyTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(LXHeaderLabelView.self, forHeaderFooterViewReuseIdentifier: LXHeaderLabelViewID)
        tableView.register(TRInvoicePersonTableViewCell.self, forCellReuseIdentifier: TRInvoicePersonTableViewCellID)
        tableView.register(TRInvoiceCompanyTableViewCell.self, forCellReuseIdentifier: TRInvoiceCompanyTableViewCellID)
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetWorkInvoiceInfo()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRInvoiceAllViewController {
    func NetWorkInvoiceInfo() {
        viewModel.updateBlock = {[unowned self] in
            self.dataArray = self.viewModel.invoiceInfoModel?.data
            self.tableView.reloadData()
        }
        viewModel.refreshDataSource_InvoiceInfo()
    }
}

extension TRInvoiceAllViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let infoModel: TRInvoiceInfoDataModel = self.dataArray?[indexPath.row] ?? TRInvoiceInfoDataModel.init()
        return infoModel.UserInvoiceReceiveType == 2 ? 155.0 : 94.0
    }
        
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infoModel: TRInvoiceInfoDataModel = self.dataArray?[indexPath.row] ?? TRInvoiceInfoDataModel.init()
        
        // 收票方类型(1-个人；2-企业)
        switch infoModel.UserInvoiceReceiveType {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRInvoicePersonTableViewCellID, for: indexPath) as! TRInvoicePersonTableViewCell
            cell.infoDataModel = infoModel
            cell.defaultButtonBlock = {[unowned self](button) in
                let infoModel: TRInvoiceInfoDataModel = self.dataArray?[indexPath.row] ?? TRInvoiceInfoDataModel.init()
                self.blockCellButtonSetDefault(UserInvoiceID: String.init(describing: infoModel.UserInvoiceID))
            }
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRInvoiceCompanyTableViewCellID, for: indexPath) as! TRInvoiceCompanyTableViewCell
            cell.infoDataModel = infoModel
            cell.defaultButtonBlock = {[unowned self](button) in
                let infoModel: TRInvoiceInfoDataModel = self.dataArray?[indexPath.row] ?? TRInvoiceInfoDataModel.init()
                self.blockCellButtonSetDefault(UserInvoiceID: String.init(describing: infoModel.UserInvoiceID))
            }
            
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")

            cell.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
            cell.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
            cell.textLabel?.lineBreakMode = .byCharWrapping
            cell.textLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1)"
            cell.textLabel?.numberOfLines = 2
            
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let infoModel: TRInvoiceInfoDataModel = self.dataArray?[indexPath.row] ?? TRInvoiceInfoDataModel.init()
        let nextVc = TRAddInvoiceViewController(navTitle: "编辑开票信息", invoiceInfoDataModel: infoModel)
        self.navigationController?.pushViewController(nextVc, animated: true)
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
            let infoModel: TRInvoiceInfoDataModel = self.dataArray?[indexPath.row] ?? TRInvoiceInfoDataModel.init()
            editingStyleDeleteCell(UserInvoiceID: String.init(describing: infoModel.UserInvoiceID))
        }
    }
}

extension TRInvoiceAllViewController {
    func editingStyleDeleteCell(UserInvoiceID: String) {
        print("UserInvoiceID = \(UserInvoiceID)")
        
        let alert = UIAlertController.init(title: "您确定要删除这个信息吗?", message: "", preferredStyle: .alert)
        let confirmaction = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) in
            self.viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.invoiceDeleteModel?.msg ?? "", view: self.view)
                self.NetWorkInvoiceInfo()
            }
            self.viewModel.refreshDataSource_InvoiceDelete(UserInvoiceID: UserInvoiceID)
        }
        let cancleAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alert.addAction(confirmaction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension TRInvoiceAllViewController {
    func blockCellButtonSetDefault(UserInvoiceID: String) {
        print("UserInvoiceID = \(UserInvoiceID)")
        
        let alert = UIAlertController.init(title: "您确定要设置为默认开票吗?", message: "", preferredStyle: .alert)
        let confirmaction = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) in
            self.viewModel.updateBlock = {[unowned self] in
                MBProgressHUD.showWithText(text: self.viewModel.invoiceDeleteModel?.msg ?? "", view: self.view)
                self.NetWorkInvoiceInfo()
            }
            self.viewModel.refreshDataSource_InvoiceSetDefault(UserInvoiceID: UserInvoiceID)
        }
        let cancleAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alert.addAction(confirmaction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)
    }
}
