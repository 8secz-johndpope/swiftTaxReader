//
//  TROrderCodeViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/18.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TROrderCodeViewController: UIViewController {
    
    var dataArray: [TROrderActivityCodeDataModel]?
    
    var orderDetailID: String?
    convenience init(orderDetailID: String?) {
        self.init()
        self.orderDetailID = orderDetailID
    }
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "激活码"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    private let identific = "TROrderCodeTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.register(UINib.init(nibName: identific, bundle: nil), forCellReuseIdentifier: identific)
        
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
        
        view.backgroundColor = UIColor.cyan
        setupLayout()
        NetworkOrderGetActivityCode()
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TROrderCodeViewController {
    func NetworkOrderGetActivityCode() {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.orderActivityCodeModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.orderActivityCodeModel?.msg ?? "", view: self.view)
                return
            }
            
            self.dataArray = self.networkViewModel.orderActivityCodeModel?.data
            self.tableView.reloadData()
        }
        networkViewModel.refreshDataSource_OrderGetActivityCode(OrderID: "", OrderDetailID: self.orderDetailID ?? "", PageIndex: "", PageSize: "")
    }
}


extension TROrderCodeViewController: UITableViewDataSource, UITableViewDelegate {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: identific, for: indexPath) as! TROrderCodeTableViewCell
        let model: TROrderActivityCodeDataModel = self.dataArray?[indexPath.row] ?? TROrderActivityCodeDataModel.init()
        cell.orderActivityCodeModel = model
        cell.delegate = self
        cell.trCopyCodeButton.tag = indexPath.row
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TROrderCodeViewController: TROrderCodeTableViewCellDelegate {
    func cellButtonDidSelectRowAt(_ button: UIButton) {
        let model: TROrderActivityCodeDataModel = self.dataArray?[button.tag] ?? TROrderActivityCodeDataModel.init()
        if model.ActivationCodeStatus == 1 {
            MBProgressHUD.showWithText(text: "不可复制", view: self.view)
            return
        }
        
        let pastboard = UIPasteboard.general
        pastboard.string = "序列号：\(model.ActivationCodeSN ?? "") 密码：\(model.ActivationCodePWD ?? "")"
    }
}
