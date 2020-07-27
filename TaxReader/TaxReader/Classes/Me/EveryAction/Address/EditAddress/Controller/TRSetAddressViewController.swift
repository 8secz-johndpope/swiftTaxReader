//
//  TRSetAddressViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/15.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

let TRSetAddressSectionNameTF = 0           // 其他输入
let TRSetAddressSectionNameArea = 1         // 所在地区
let TRSetAddressSectionNameSW = 6           // 设置默认地址

let dataArrayZhiCityName = ["北京市","天津市","上海市","重庆市"]

class TRSetAddressViewController: UIViewController {
    private var isAddressEdit: Bool = false
    private var addressInfoDataModel: TRAddressInfoDataModel?
    private var isDefaultOn: Bool = false
    
    convenience init(isAddressEdit: Bool = false, addressInfoDataModel: TRAddressInfoDataModel?) {
        self.init()
        
        self.isAddressEdit = isAddressEdit
        self.addressInfoDataModel = addressInfoDataModel
    }
    
    var addressExamples: [TRAddressExample]?
    
    var areaTreePath:String? // 注册接口，4000-1-2
    var areaAddress:String? // 注册接口，河南省 信阳市 罗山县
    
    lazy var navView: LXNavigationBarView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "设置地址"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    private let TRAddressNameTFTableViewCellID = "TRAddressNameTFTableViewCell"
    private let TRAddressNameAreaTableViewCellID = "TRAddressNameAreaTableViewCell"
    private let TRAddressNameSwitchTableViewCellID = "TRAddressNameSwitchTableViewCell"
    
    lazy var tableView: TPKeyboardAvoidingTableView = {
        let tableView = TPKeyboardAvoidingTableView.init(frame: .zero, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = LXTableViewBackgroundColor
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(TRAddressNameTFTableViewCell.self, forCellReuseIdentifier: TRAddressNameTFTableViewCellID)
        tableView.register(TRAddressNameAreaTableViewCell.self, forCellReuseIdentifier: TRAddressNameAreaTableViewCellID)
        tableView.register(TRAddressNameSwitchTableViewCell.self, forCellReuseIdentifier: TRAddressNameSwitchTableViewCellID)
        
        return tableView
    }()
    
    lazy var footerView: UIView = {
        let view = LXFooterButtonView.init(frame: .zero)
        view.footerButton.setTitle("保存", for: UIControl.State.normal)
        view.footerButtonClick = {[weak self](button) in
            self?.blockFooterButtonClick(button: button)
        }
        
        return view
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
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
        setupExamples()
    }
}

extension TRSetAddressViewController {
    func setupExamples() {
        
        let areaText = "\(self.addressInfoDataModel?.UserAddressProv ?? "")\(self.addressInfoDataModel?.UserAddressCity ?? "")\(self.addressInfoDataModel?.UserAddressDistrict ?? "")"
        let isDefaultSwitchOn: Bool = self.addressInfoDataModel?.UserAddressIsDefault == 0 ? false : true
        self.addressExamples = [TRAddressExample.customNameTFExampleStyle(isRequired: true, title: "收货人：", textFieldValue: self.addressInfoDataModel?.UserAddressMan),
                                TRAddressExample.customNameAreaExampleStyle(isRequired: true, title: "所在地区：", detailTtile: areaText),
                                TRAddressExample.customNameTFExampleStyle(isRequired: true, title: "地址：", textFieldValue: self.addressInfoDataModel?.UserAddressDetail),
                                TRAddressExample.customNameTFExampleStyle(isRequired: true, title: "手机：", textFieldValue: self.addressInfoDataModel?.UserAddressMobile),
                                TRAddressExample.customNameTFExampleStyle(isRequired: false, title: "固定电话：", textFieldValue: self.addressInfoDataModel?.UserAddressPhone),
                                TRAddressExample.customNameTFExampleStyle(isRequired: false, title: "邮编号码：", textFieldValue: self.addressInfoDataModel?.UserAddressPhone),
                                TRAddressExample.customNameSWExampleStyle(isRequired: false, title: "设置默认地址：", isSwitchOn: isDefaultSwitchOn)
                        ];
    }
}

extension TRSetAddressViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addressExamples?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exampleModel: TRAddressExample = self.addressExamples![indexPath.row]
        
        switch indexPath.row {
        case TRSetAddressSectionNameArea:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRAddressNameAreaTableViewCellID, for: indexPath) as! TRAddressNameAreaTableViewCell
            cell.accessoryType = .disclosureIndicator
            cell.exampleModel = exampleModel
            cell.areaLabelTap = {[weak self](sender: UITapGestureRecognizer) in
                let nextVc = TRRegisterAreaViewController()
                nextVc.delegate = self
                self?.present(nextVc, animated: true, completion: nil)
            }
            
            return cell
            
        case TRSetAddressSectionNameSW:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRAddressNameSwitchTableViewCellID, for: indexPath) as! TRAddressNameSwitchTableViewCell
            cell.exampleModel = exampleModel
            cell.switchIsChanged = {[weak self](sender: UISwitch) in
                self?.isDefaultOn = sender.isOn
            }
            
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TRAddressNameTFTableViewCellID, for: indexPath) as! TRAddressNameTFTableViewCell
            cell.exampleModel = exampleModel
            
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension TRSetAddressViewController: TRRegisterAreaVCDelegate{
    func delegateAreaReverseValue(address: String?, areaTreePath: String?) {
        
        let cell: TRAddressNameAreaTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as! TRAddressNameAreaTableViewCell
        
        // 对返回的 address 进行处理 显示在页面上 不需要空格
        // 返回的 address 带有空格 用来进行接口传值
        let showAddress = address?.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        cell.trAreaLabel.text = showAddress
        self.areaAddress = address?.trimmingCharacters(in: .whitespaces)
        
        // 返回的 areaTreePath "4000,1,2" 需要的格式为 4000-1-2
        let interAreaTreePath = areaTreePath?.replacingOccurrences(of: ",", with: "-", options: .literal, range: nil)
        self.areaTreePath = interAreaTreePath
        
        print("address = \(String(describing: address)) + showAddress = \(String(describing: showAddress))")
        print("areaTreePath = \(String(describing: address)) + interAreaTreePath = \(String(describing: interAreaTreePath))")
    }
}


extension TRSetAddressViewController {
    func blockFooterButtonClick(button: UIButton) {
        if self.isAddressEdit {
            NetworkDataAddressEdit()
        }else {
            NetworkDataAddressAdd()
        }
    }
    
    func NetworkDataAddressAdd() {
        viewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.viewModel.addressAddModel?.msg ?? "", view: self.view)
            
            if self.viewModel.addressAddModel?.ret == false {
                MBProgressHUD.showWithText(text: self.viewModel.addressAddModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.viewModel.addressAddModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkDataAddressAdd()
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if self.viewModel.addressAddModel?.msgCode == 200 {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        
        let cell0: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! TRAddressNameTFTableViewCell
        let nameText = cell0.trContentTF.text ?? ""
        
        var areaArray = self.areaAddress?.components(separatedBy: " ")
        let areaFirst = areaArray?.first ?? ""
        if dataArrayZhiCityName.contains(areaFirst) {
            areaArray?.insert(areaFirst, at: 0)
        }
        let UserAddressProv = areaArray?.first ?? ""
        let UserAddressCity = areaArray?[1] ?? ""
        let UserAddressDistrict = areaArray?.last ?? ""
        
        let cell2: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 2, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressDetailText = cell2.trContentTF.text ?? ""
        
        let cell3: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressMobileText = cell3.trContentTF.text ?? ""
        
        let cell4: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressPhoneText = cell4.trContentTF.text ?? ""

        let cell5: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressZIPCodeText = cell5.trContentTF.text ?? ""
        
        let UserAddressIsDefaultText = self.isDefaultOn ? "1" : "0"
        
        viewModel.refreshDataSource_AddressAdd(UserAddrID: "",
                                               UserID: "",
                                               UserAddressMan: nameText,
                                               UserAddressCountry: "",
                                               UserAddressProv: UserAddressProv,
                                               UserAddressCity: UserAddressCity,
                                               UserAddressDistrict: UserAddressDistrict,
                                               UserAddressStreet: "",
                                               UserAddressDetail: UserAddressDetailText,
                                               UserAddressMobile: UserAddressMobileText,
                                               UserAddressPhone: UserAddressPhoneText,
                                               UserAddressZIPCode: UserAddressZIPCodeText,
                                               UserAddressIsDefault: UserAddressIsDefaultText,
                                               UserAddressManGender: "0")
    }
    
    func NetworkDataAddressEdit() {
        viewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.viewModel.addressEditModel?.msg ?? "", view: self.view)
            
            if self.viewModel.addressEditModel?.ret == false {
                MBProgressHUD.showWithText(text: self.viewModel.addressEditModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.viewModel.addressEditModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkDataAddressEdit()
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if self.viewModel.addressEditModel?.msgCode == 200 {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        
        let cell0: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! TRAddressNameTFTableViewCell
        let nameText = cell0.trContentTF.text ?? ""
        
        var areaArray = self.areaAddress?.components(separatedBy: " ")
        let areaFirst = areaArray?.first ?? ""
        if dataArrayZhiCityName.contains(areaFirst) {
            areaArray?.insert(areaFirst, at: 0)
        }
        let UserAddressProv = areaArray?.first ?? ""
        let UserAddressCity = areaArray?[1] ?? ""
        let UserAddressDistrict = areaArray?.last ?? ""
        
        let cell2: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 2, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressDetailText = cell2.trContentTF.text ?? ""
        
        let cell3: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 3, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressMobileText = cell3.trContentTF.text ?? ""
        
        let cell4: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 4, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressPhoneText = cell4.trContentTF.text ?? ""

        let cell5: TRAddressNameTFTableViewCell = self.tableView.cellForRow(at: IndexPath.init(row: 5, section: 0)) as! TRAddressNameTFTableViewCell
        let UserAddressZIPCodeText = cell5.trContentTF.text ?? ""
        
        let UserAddressIsDefaultText = self.isDefaultOn ? "1" : "0"
        
        viewModel.refreshDataSource_AddressEdit(UserAddrID: "\(self.addressInfoDataModel?.UserAddrID ?? 0)",
                                               UserID: "",
                                               UserAddressMan: nameText,
                                               UserAddressCountry: "",
                                               UserAddressProv: UserAddressProv,
                                               UserAddressCity: UserAddressCity,
                                               UserAddressDistrict: UserAddressDistrict,
                                               UserAddressStreet: "",
                                               UserAddressDetail: UserAddressDetailText,
                                               UserAddressMobile: UserAddressMobileText,
                                               UserAddressPhone: UserAddressPhoneText,
                                               UserAddressZIPCode: UserAddressZIPCodeText,
                                               UserAddressIsDefault: UserAddressIsDefaultText,
                                               UserAddressManGender: "0")
    }
}
