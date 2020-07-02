//
//  TRMeViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRMeViewController: UIViewController {
    var examples: [[LXExample]]?
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "会员中心"
        view.isFirstView = true
        
        return view
    }()
    
    private let TRMeHeaderViewID = "TRMeHeaderView"
    private let TRMeFooterViewID = "TRMeFooterView"
    private let TRMeTableViewCellID = "TRMeTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        tableView.register(TRMeHeaderView.self, forHeaderFooterViewReuseIdentifier: TRMeHeaderViewID)
        tableView.register(TRMeFooterView.self, forHeaderFooterViewReuseIdentifier: TRMeFooterViewID)
        tableView.register(TRMeTableViewCell.self, forCellReuseIdentifier: TRMeTableViewCellID)
        
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        setupLayout()
        setupExamples()        
    }
    
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
    
    func setupExamples() {
        self.examples = [
            [LXExample.customExampleStyle(imageName: "会员全部订单", title: "全部订单", selector: #selector(indeterminateAllOrder)),
             LXExample.customExampleStyle(imageName: "会员收回地址", title: "收货地址", selector: #selector(indeterminateAddress)),
             LXExample.customExampleStyle(imageName: "会员开票信息", title: "开票信息", selector: #selector(indeterminateInvoice)),
             LXExample.customExampleStyle(imageName: "会员绑定激活码", title: "绑定激活码", selector: #selector(indeterminateActiveCode))],
            [LXExample.customExampleStyle(imageName: "会员基本信息", title: "基本信息", selector: #selector(indeterminateMeInfo)),
             LXExample.customExampleStyle(imageName: "会员密码修改", title: "密码修改", selector: #selector(indeterminateAlertPwd))],
            [LXExample.customExampleStyle(imageName: "会员联系我们", title: "联系我们", selector: #selector(indeterminateConnectUS))]
        ];
    }
}

extension TRMeViewController {
    @objc func indeterminateExample() {
        print("1111")
    }
        
    @objc func indeterminateAllOrder() {
        let nextVc = TRAllOrderViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func indeterminateInvoice() {
        let nextVc = TRInvoiceViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func indeterminateAddress() {
        let nextVc = TRAddressViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func indeterminateMeInfo() {
        let nextVc = TRMeInfoViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func indeterminateActiveCode() {
        let nextVc = TRActiveCodeViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func indeterminateAlertPwd() {
        let nextVc = TRAlertPwdViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @objc func indeterminateConnectUS() {
        let nextVc = TRConnectUSViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension TRMeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.examples?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let exampleArray: [LXExample] = self.examples![section]
        return exampleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exampleArray: [LXExample] = self.examples![indexPath.section]
        let example: LXExample = exampleArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TRMeTableViewCellID, for: indexPath) as! TRMeTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage.init(named: example.imageName ?? "")
        cell.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
        cell.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
        cell.textLabel?.lineBreakMode = .byCharWrapping
        cell.textLabel?.text = "\(String(describing: example.title!))"
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exampleArray: [LXExample] = self.examples![indexPath.section]
        let example: LXExample = exampleArray[indexPath.row]
        
        self.perform(example.selector)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 128 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView: TRMeHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRMeHeaderViewID) as! TRMeHeaderView
            headerView.phoneLabel.text = UserDefaults.AccountInfo.string(forKey: .userName) ?? "15711112222"
            headerView.headerImageViewTapBlock = {[weak self](view) in
                self?.bockHeaderViewTap()
            }
            return headerView
        }else {
            return UIView.init()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.red
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: TRMeFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRMeFooterViewID) as! TRMeFooterView
        return footerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = UIColor.red
    }
}

extension TRMeViewController {
    func bockHeaderViewTap() {
        let nextVc = TRLoginOutViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
