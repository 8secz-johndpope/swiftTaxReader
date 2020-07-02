//
//  TRForgetPwdViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import MJExtension
import HandyJSON
import SwiftyJSON

class TRForgetPwdViewController: UIViewController {
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "忘记密码"
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
    
    lazy var numberCodeView: TRRegisterNumberCodeView = {
        let view = TRRegisterNumberCodeView.init(frame: .zero)
        view.countButtonClickBlock = {[weak self](countButton) in
            self?.blockCountButtonClick(countButton: countButton)
        }
        
        return view
    }()
    
    lazy var footerButtonView: LXFooterButtonCenterView = {
        let view = LXFooterButtonCenterView.init(frame: .zero)
        view.footerButton.setTitle("设置新密码", for: .normal)
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
        
        self.contentView.addSubview(self.phoneView)
        self.phoneView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }
        
        self.contentView.addSubview(self.numberCodeView)
        self.numberCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight)
        }
        
        self.contentView.addSubview(self.footerButtonView)
        self.footerButtonView.snp.makeConstraints { (make) in
            make.top.equalTo(self.numberCodeView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemHeight + 100)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.cyan
        setupLayout()
    }
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRForgetPwdViewController: TRPrefixPhoneVCDelegate {
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
                                            NKValidateCodeType: "02",
                                            UserRegIP: ipAddress)
    }
    
    
    func blockFooterButtonClick(button: UIButton) {
        let nextVc = TRForgetNewPwdViewController()
        let keyWindow = UIApplication.shared.windows.first
        if let window = keyWindow {
            window.rootViewController = nextVc
        }

    }
}
