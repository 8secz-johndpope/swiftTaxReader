//
//  TRAlertPwdViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class TRAlertPwdViewController: UIViewController {
    let placeHolderArray: [String] = ["请输入原密码", "请输入新密码", "请输入确认密码"]
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "密码修改"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    private let identific = "LXTextFieldTableViewCell"
    lazy var tableView: TPKeyboardAvoidingTableView = {
        let tableView = TPKeyboardAvoidingTableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
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
        
        setupLayout()
    }
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRAlertPwdViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 94 : 68 // 94
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
        return 108
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = LXFooterButtonCenterView.init(frame: .zero)
        view.footerButtonClick = {[weak self](button) in
            self?.blockFooterButtonClick(button: button)
        }
        
        return view
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identific, for: indexPath) as! LXTextFieldTableViewCell
        cell.isHasWarnLabel = indexPath.row == 0 ? true : false
        cell.trTextField.isSecureTextEntry = true
        cell.trTextField.placeholder = placeHolderArray[indexPath.row]
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TRAlertPwdViewController {
    func blockFooterButtonClick(button: UIButton) {
        let cell0: LXTextFieldTableViewCell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! LXTextFieldTableViewCell
        let cell1: LXTextFieldTableViewCell = tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as! LXTextFieldTableViewCell
        let cell2: LXTextFieldTableViewCell = tableView.cellForRow(at: IndexPath.init(row: 2, section: 0)) as! LXTextFieldTableViewCell
        
        let oldPwd = cell0.trTextField.text ?? ""
        let pwd = cell1.trTextField.text ?? ""
        let verifyPwd = cell2.trTextField.text ?? ""
        
        // 密码校验
        if oldPwd.isBlank {
            MBProgressHUD.showWithText(text: "请输入原密码", view: (self.view)!)
            return
        }
        if pwd.isBlank {
            MBProgressHUD.showWithText(text: "请输入密码", view: (self.view)!)
            return
        }
        if verifyPwd.isBlank {
            MBProgressHUD.showWithText(text: "请输入确认密码", view: (self.view)!)
            return
        }
        if pwd != verifyPwd {
            MBProgressHUD.showWithText(text: "密码和确认密码不一致", view: (self.view)!)
            return
        }
        if !verifyPwd.isRulerPassword(password: verifyPwd) {
            MBProgressHUD.showWithText(text: "密码为8-16位数字和字母组合!", view: (self.view)!)
            return
        }
        
        // 接口调用
        viewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.viewModel.userUppassModel?.msg ?? "", view: self.view)
            
            if self.viewModel.userUppassModel?.ret == false {
                MBProgressHUD.showWithText(text: self.viewModel.userUppassModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.viewModel.userUppassModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.blockFooterButtonClick(button: button)
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if self.viewModel.userUppassModel?.msgCode == 200 {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        viewModel.refreshDataSource_Uppass(oldPass: oldPwd, newPass: verifyPwd)
    }
}
