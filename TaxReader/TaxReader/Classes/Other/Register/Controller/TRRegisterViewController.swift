//
//  TRRegisterViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/6.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import MJExtension
import HandyJSON
import SwiftyJSON

let itemHeight = 55 + 12

class TRRegisterViewController: UIViewController{
    
    //private var dataArray1: [String]?
    var dataArray1: [areaDataCountryModel1] = []
    var dataArrayAddress: [TRAddressModel] = []
    var arrayDict = [[String:Any]]()
    var areaDataModel: areaDataCountryModel1?
    
    var areaTreePath:String? // 注册接口，4000-1-2
    var areaAddress:String? // 注册接口，河南省 信阳市 罗山县
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "手机注册"
        view.navBackButtonClick = {[weak self]() in
            let nextVc = TRWLoginViewController()
            let keyWindow = UIApplication.shared.windows.first
            if let window = keyWindow {
                window.rootViewController = nextVc
            }
        }
        
        return view
    }()
    
    lazy var scrollView: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView.init(frame: .zero)
        scrollView.backgroundColor = UIColor.white
        scrollView.contentSize = CGSize.init(width: LXScreenWidth, height: LXScreenHeight)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true

        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // 单行
    lazy var accountView: UIView = {
        let view = TRRegisterAccountView.init(frame: .zero)
        
        return view
    }()
    
    lazy var phoneView: TRRegisterPhoneView = {
        let view = TRRegisterPhoneView.init(frame: .zero)
        view.prefixButtonBlock = {[weak self](prefixButton) in
            let buttonLabelText:String = prefixButton.titleLabel?.text ?? ""
            print("buttonLabelText = \(String(describing: buttonLabelText))")
            
            self?.blockPrefixButton(buttonText:buttonLabelText)
        }
        
        return view
    }()
    
    lazy var imageCodeView: UIView = {
        let view = TRRegisterImageCodeView.init(frame: .zero)
        
        return view
    }()
    
    lazy var numberCodeView: TRRegisterNumberCodeView = {
        let view = TRRegisterNumberCodeView.init(frame: .zero)
        view.countButtonClickBlock = {[weak self](countButton) in
            self?.blockCountButtonClick(countButton: countButton)
        }
        
        view.textFieldDidEndEditingBlock = {[weak self](textField, reason) in
//            print("\(String(describing: textField.text))")
//            if textField.text?.contains("0") ?? false {
//                view.warnMegLabel.text = "请填写正确短信验证码"
//                view.warnMegLabel.snp.updateConstraints { (make) in
//                    make.height.equalTo(30)
//                }
//                view.snp.updateConstraints { (make) in
//                    make.height.equalTo(itemHeight + 30)
//                }
//            } else {
//                view.warnMegLabel.snp.updateConstraints { (make) in
//                    make.height.equalTo(0)
//                }
//                view.snp.updateConstraints { (make) in
//                    make.height.equalTo(itemHeight)
//                }
//            }
        }
        
        return view
    }()

    lazy var pwdView: TRRegisterPwdView = {
        let view = TRRegisterPwdView.init(frame: .zero)
        
        return view
    }()
    
    lazy var verifyPwdView: TRRegisterVerifyPwdView = {
        let view = TRRegisterVerifyPwdView.init(frame: .zero)
        
        return view
    }()

    lazy var areaView: TRRegisterAreaView = {
        let view = TRRegisterAreaView.init(frame: .zero)
        view.registerAreaViewTap = {[weak self](view) in
            let nextVc = TRRegisterAreaViewController()
            nextVc.delegate = self
            self?.present(nextVc, animated: true, completion: nil)
        }
        
        return view
    }()

    lazy var agreementView: TRRegisterAgreementView = {
        let view = TRRegisterAgreementView.init(frame: .zero)
        view.agreementLabelTap = {[weak self](sender: UITapGestureRecognizer) in
            let nextVc = TRRegisterAgreeViewController()
            self?.present(nextVc, animated: true, completion: nil)
        }
        
        return view
    }()
    
    lazy var footerView: UIView = {
        let view = LXFooterButtonView.init(frame: .zero)
        view.footerButton.setTitle("立即注册", for: UIControl.State.normal)
        view.backgroundColor = UIColor.white
        view.footerButton.layer.cornerRadius = 2
        view.footerButtonClick = {[weak self](button) in
            self?.blockFooterButtonClick(button: button)
        }
        
        return view
    }()
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
    
    lazy var registerViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
    
    override func viewDidLayoutSubviews() {
        self.contentView.snp.updateConstraints { (make) in
            make.height.equalTo(self.footerView.frame.origin.y + self.footerView.frame.size.height)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
//        getLocalJson()
    }
    
    
    func getLocalJson() {
        let path = Bundle.main.path(forResource: "Cart2", ofType: "json") // TRArea2
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do {
                let json = JSON(jsonData!)
                //print(json.description)

                let dict = getDictionaryFromJSONString(jsonString: json.description)
                let success = dict.write(toFile: "/Users/asdc/Desktop/Temp/temp.plist", atomically: true)
                print(success)
                
                if let mappedObject = JSONDeserializer<areaDataCountryModel1>.deserializeFrom(json: json["data"][0].description) {
                    self.areaDataModel = mappedObject
                    
                    let areaModel1 = mappedObject.children
                    for item1 in areaModel1! {
                        let addressModel = TRAddressModel()
                        addressModel.id = String.init(describing: item1.AreaID)
                        addressModel.parentid = String.init(describing: item1.AreaParentID)
                        addressModel.name = item1.AreaName
                        addressModel.treePath = item1.AreaTreePath
                        dataArrayAddress.append(addressModel)
                        
                        for item2 in item1.children! {
                            let addressModel = TRAddressModel()
                            addressModel.id = String.init(describing: item2.AreaID)
                            addressModel.parentid = String.init(describing: item2.AreaParentID)
                            addressModel.name = item2.AreaName
                            addressModel.treePath = item2.AreaTreePath
                            dataArrayAddress.append(addressModel)

                            for item3 in item2.children! {
                                let addressModel = TRAddressModel()
                                addressModel.id = String.init(describing: item2.AreaID)
                                addressModel.parentid = String.init(describing: item3.AreaParentID)
                                addressModel.name = item3.AreaName
                                addressModel.treePath = item3.AreaTreePath
                                dataArrayAddress.append(addressModel)
                            }
                        }
                    }
                    
                    for model:TRAddressModel in dataArrayAddress {
                        let dict =  model.mj_keyValues()
                        arrayDict.append(dict as! Dictionary)
                    }
                    let dict = arrayDict
                    let json = JSON(dict)
                    print(json)
                }
            }
        }
        
    }
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
}

extension TRRegisterViewController: TRRegisterAreaVCDelegate{
    func delegateAreaReverseValue(address: String?, areaTreePath: String?) {
        // 对返回的 address 进行处理 显示在页面上 不需要空格
        // 返回的 address 带有空格 用来进行接口传值
        let showAddress = address?.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        self.areaView.textField.text = showAddress
        self.areaAddress = address
        
        // 返回的 areaTreePath "4000,1,2" 需要的格式为 4000-1-2
        let interAreaTreePath = areaTreePath?.replacingOccurrences(of: ",", with: "-", options: .literal, range: nil)
        self.areaTreePath = interAreaTreePath
        
        print("address = \(String(describing: address)) + showAddress = \(String(describing: showAddress))")
        print("areaTreePath = \(String(describing: address)) + interAreaTreePath = \(String(describing: interAreaTreePath))")
    }
}

extension TRRegisterViewController: TRPrefixPhoneVCDelegate {
    func backPrefixCodeEnDe(code: String, en: String) {
        self.phoneView.prefixButton.setTitle(code, for: .normal)
    }
    
    func blockPrefixButton(buttonText: String) {
        let nextVc = TRPrefixPhoneViewController()
        nextVc.delegate = self
        self.present(nextVc, animated: true, completion: nil)
    }
    
    func blockCountButtonClick(countButton: GSCaptchaButton) {
        // 对输入的手机号进行校验
        let phoneNumber:String = self.phoneView.textField.text ?? ""
        if phoneNumber.isBlank {
            MBProgressHUD.showWithText(text: "请输入手机号", view: (self.view)!)
            return
        }

        if !phoneNumber.isRulerPhoneNumber(phoneNumber: phoneNumber) {
            MBProgressHUD.showWithText(text: "手机号格式不正确", view: (self.view)!)
            return
        }
        
        viewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.viewModel.getCodeModel?.msg ?? "", view: self.view)
            if self.viewModel.getCodeModel?.msgCode == 200 {
                countButton.maxSecond = 60
                countButton.countdown = true // 停止 false
                self.numberCodeView.textField.text = self.viewModel.getCodeModel?.data ?? ""
            }
        }
        
        let ipAddress = LXGetIPAddressTool.getIPAddressWiFiAndTraffic(false)
        let prefixPhoneCode:String = self.phoneView.prefixButton.titleLabel?.text ?? ""
        viewModel.refreshDataSource_GetCode(NKValidateCodeReceive: phoneNumber,
                                            UserMobileAreaCode: prefixPhoneCode,
                                            NKValidateCodeType: "01",
                                            UserRegIP: ipAddress)
    }
    
    func blockFooterButtonClick(button: UIButton) {
        let prefixPhoneCode:String = self.phoneView.prefixButton.titleLabel?.text ?? ""
        let phoneNumber:String = self.phoneView.textField.text ?? ""

        // 验证码
        let numberCode: String = self.numberCodeView.textField.text ?? ""
        if numberCode.isBlank {
            MBProgressHUD.showWithText(text: "请输入验证码", view: (self.view)!)
            return
        }
        if !numberCode.isRulerPureNumber(number: numberCode) {
            MBProgressHUD.showWithText(text: "4位纯数字验证码", view: (self.view)!)
            return
        }

        // 密码校验
        let pwd: String = self.pwdView.textField.text ?? ""
        let verifyPwd: String = self.verifyPwdView.textField.text ?? ""
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

        // 地区验证
        let areaText: String = self.areaView.textField.text ?? ""
        if areaText.isBlank {
            MBProgressHUD.showWithText(text: "请选择地区", view: (self.view)!)
            return
        }

        // 协议阅读
        let agreeButtonSelected: Bool = self.agreementView.agreementButton.isSelected
        if !agreeButtonSelected {
            MBProgressHUD.showWithText(text: "请阅读注册协议", view: (self.view)!)
            return
        }
        
        // 获取手机端ip地址
        let ipAddress = LXGetIPAddressTool.getIPAddressWiFiAndTraffic(false)
        print("ipAddress = \(ipAddress)")

        registerViewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showSuccessWithStatus(text: self.registerViewModel.registerModel?.msg ?? "", view: self.view)
            if self.registerViewModel.registerModel?.msgCode == 200 {
                let nextVc = TRWLoginViewController()
                let keyWindow = UIApplication.shared.windows.first
                if let window = keyWindow {
                    window.rootViewController = nextVc
                }
            }
        }
        
        registerViewModel.refreshDataSource_Register(UserName: phoneNumber,
                                            UserMobile: phoneNumber,
                                            UserRegIP: ipAddress,
                                            AreaTreePath: self.areaTreePath ?? "",
                                            AreaFullName: self.areaAddress ?? "",
                                            UserPWD:verifyPwd,// 需要加密
                                            UserMobileAreaCode:prefixPhoneCode,
                                            UseFrom: UseFrom,
                                            SMSCode: numberCode)
    }
}

extension TRRegisterViewController {
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(1000)
        }
        
        /**
        // 后期需求，去除账号输入框
        self.contentView.addSubview(self.accountView)
        self.accountView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }
         */
        
        self.contentView.addSubview(self.phoneView)
        self.phoneView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }

        /*
        // 后期需求，去除图片验证码输入框
        self.contentView.addSubview(self.imageCodeView)
        self.imageCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }
        */

        self.contentView.addSubview(self.numberCodeView)
        self.numberCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }

        self.contentView.addSubview(self.pwdView)
        self.pwdView.snp.makeConstraints { (make) in
            make.top.equalTo(self.numberCodeView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight + 30)
        }
        
        self.contentView.addSubview(self.verifyPwdView)
        self.verifyPwdView.snp.makeConstraints { (make) in
            make.top.equalTo(self.pwdView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }

        self.contentView.addSubview(self.areaView)
        self.areaView.snp.makeConstraints { (make) in
            make.top.equalTo(self.verifyPwdView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }

        self.contentView.addSubview(self.agreementView)
        self.agreementView.snp.makeConstraints { (make) in
            make.top.equalTo(self.areaView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }
        
        self.contentView.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.agreementView.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }
    }
}

/*
    {
      "data" : {
        "UserPost" : "",
        "UserValidFinishTime" : null,
        "UserAnswer" : "",
        "UserUpdateTime" : null,
        "UserID" : 4459,
        "UserLevel" : 0,
        "UserRegIP" : "192.168.1.132",
        "UserTitle" : "",
        "UserMobile" : "15711351011",
        "UserRealName" : "",
        "UserLoginCount" : 0,
        "UserEmail" : "",
        "UserNickName" : "15711351011",
        "UnitID" : 0,
        "UserGender" : 3,
        "UserStatus" : 10,
        "AreaID" : 2,
        "UserRegTime" : "2020-06-01 01:30:08",
        "UserLastLoginTime" : null,
        "UserBirthDate" : null,
        "UserValidStartTime" : null,
        "UseFrom" : 20,
        "UserCreateTime" : "2020-06-01 01:30:08",
        "UserImage" : "",
        "UserQuestion" : "",
        "UserLastLoginIP" : "",
        "UserName" : "15711351011"
      },
      "ret" : true,
      "msgCode" : "200",
      "msg" : "注册成功"
    }

 */
