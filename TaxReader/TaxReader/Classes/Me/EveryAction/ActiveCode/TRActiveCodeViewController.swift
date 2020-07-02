//
//  TRActiveCodeViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class TRActiveCodeViewController: UIViewController {
    let codeTipArray: [String] = ["请输入激活码：", "请输入密码："]
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "绑定激活码"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    private let identific = "LXTextFieldLineTableViewCell"
    lazy var tableView: TPKeyboardAvoidingTableView = {
        let tableView = TPKeyboardAvoidingTableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        //tableView.register(identific.self, forCellReuseIdentifier: identific)
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
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRActiveCodeViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 68 : 68 // 94
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
        let view = LXFooterButtonTwoView.init(frame: .zero)
        view.footerButton1.setTitle("取消", for: .normal)
        view.footerButtonClick = {[weak self](button) in
            self?.blockFooterButtonClick(button: button)
        }
        
        return view
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identific, for: indexPath) as! LXTextFieldLineTableViewCell
        cell.lxTipTitleLabel.text = codeTipArray[indexPath.row]
        cell.lxTextfiled.isSecureTextEntry = indexPath.row == 1 ? true : false
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TRActiveCodeViewController {
    func blockFooterButtonClick(button: UIButton) {
        
        // 密码校验
        let cell0: LXTextFieldLineTableViewCell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! LXTextFieldLineTableViewCell
        let cell1: LXTextFieldLineTableViewCell = tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as! LXTextFieldLineTableViewCell

        let code = cell0.lxTextfiled.text ?? ""
        let pwd = cell1.lxTextfiled.text ?? ""

        if code.isBlank {
            MBProgressHUD.showWithText(text: "请输入激活码", view: (self.view)!)
            return
        }
        if pwd.isBlank {
            MBProgressHUD.showWithText(text: "请输入密码", view: (self.view)!)
            return
        }
        if !pwd.isRulerPassword(password: pwd) {
            MBProgressHUD.showWithText(text: "密码为8-16位数字和字母组合!", view: (self.view)!)
            return
        }
        
        // 接口调用
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.userBindCodeModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.userBindCodeModel?.msg ?? "", view: self.view)
                return
            }
            
            let nextVc = TRActiveCodeResultViewController()
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        networkViewModel.refreshDataSource_BindCode(ActivationCodeSN: "52200000952", ActivationCodePWD: "c999r9Wy")
    }
}
