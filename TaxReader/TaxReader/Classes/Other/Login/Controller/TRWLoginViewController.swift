//
//  TRWLoginViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import MBProgressHUD

class TRWLoginViewController: UIViewController {
    
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
        view.backgroundColor = UIColor.cyan
        
        return view
    }()
    
    var launchImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.init(named: "LaunchScreenImage")
        
        return view
    }()

    // Logo区
    lazy var logoBackView: TRLoginLogoView = {
        let view = TRLoginLogoView.init(frame: .zero)
        
        return view
    }()
    
    // 输入区
    lazy var inputBackView: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    lazy var inputHeaderView: TRLoginInputHeaderView = {
        let view = TRLoginInputHeaderView.init(frame: .zero)

        return view
    }()

    lazy var inputContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white

        return view
    }()
    
    lazy var contentServeView: TRLoginServeView = {
        let view = TRLoginServeView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.loginButton.addTarget(self, action: #selector(loginButtonAction(button:)), for: .touchUpInside)
        view.remForgetPwdButton.addTarget(self, action: #selector(remForgetPwdButtonAction(button:)), for: .touchUpInside)
        view.remLoginButton.addTarget(self, action: #selector(remLoginButtonAction(button:)), for: .touchUpInside)

        return view
    }()
    
    // 登录按钮点击
    @objc func loginButtonAction(button:UIButton) {
        blockLoginButtonClick(button: button)
    }
    
    // 登录按钮点击
    @objc func remLoginButtonAction(button:UIButton) {
        blockRemLoginButtonClick(button: button)
    }
    
    // 忘记密码按钮点击
    @objc func remForgetPwdButtonAction(button:UIButton) {
        blockForgetPwdButtonClick(button: button)
    }
    
    lazy var contentSideView: TRLoginSideView = {
        let view = TRLoginSideView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.isHidden = true

        return view
    }()
    
    // 注册区
    lazy var registerBackView: TRLoginRegisterView = {
        let view = TRLoginRegisterView.init(frame: .zero)
        view.backgroundColor = UIColor.yellow
        view.registerButton.addTarget(self, action: #selector(registerButtonAction(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func registerButtonAction(button:UIButton) {
        targetRegisterButtonClick(button: button)
    }
    
    func setupLayout() {
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(LXScreenHeight)
        }
        
        self.contentView.addSubview(self.launchImageView)
        self.launchImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        
        self.contentView.addSubview(self.inputBackView)
        self.inputBackView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview().offset(((180-64)*scaleHeightSE2nd)*0.5)
            make.height.equalTo((LXScreenHeight - (64 + 180)*scaleHeightSE2nd))
        }
        
        self.contentView.addSubview(self.logoBackView)
        self.logoBackView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(180*scaleHeightSE2nd)
        }
        
        self.contentView.addSubview(self.registerBackView)
        self.registerBackView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(64*scaleHeightSE2nd)
        }
        
        self.inputBackView.addSubview(self.inputHeaderView)
        self.inputHeaderView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44*scaleHeightSE2nd)
        }

        self.inputBackView.addSubview(self.inputContentView)
        self.inputContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.inputHeaderView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.inputContentView.addSubview(self.contentServeView)
        self.contentServeView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalToSuperview().dividedBy(1.6)
        }

        self.inputContentView.addSubview(self.contentSideView)
        self.contentSideView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentServeView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupView()
        autoLogin()
    }
    
    lazy var viewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRWLoginViewController {
    func setupView() {
        if !(UserDefaults.LoginInfo.string(forKey: .accountText)?.isBlank ?? false) {
            self.contentServeView.accountTextField.text = UserDefaults.LoginInfo.string(forKey: .accountText)
        }
        if !(UserDefaults.LoginInfo.string(forKey: .passwordText)?.isBlank ?? false) {
            self.contentServeView.pwdTextField.text = UserDefaults.LoginInfo.string(forKey: .passwordText)
        }
        
        let isRemLogin = (UserDefaults.LoginInfo.string(forKey: .rem_login) == "1")
        self.contentServeView.remLoginButton.isSelected = isRemLogin ? true : false
    }
}

extension TRWLoginViewController {
    // 注册
    func targetRegisterButtonClick(button:UIButton) {
        let nextVc = TRRegisterViewController()
        let keyWindow = UIApplication.shared.windows.first
        if let window = keyWindow {
            window.rootViewController = nextVc
        }
    }
    
    // 登录
    func verifyInput(verify1: String, verify2: String) -> String? {
        var msgString: String?
        if verify1.isBlank {
            msgString = "请输入用户名";
        }else if verify2.isBlank {
            msgString = "请输入密码";
        }
        return msgString ?? ""
    }
    
    func blockLoginButtonClick(button:UIButton) {
        // 登录输入校验
        let accountTFText = self.contentServeView.accountTextField.text ?? ""
        let pwdTFText = self.contentServeView.pwdTextField.text ?? ""
        let message = verifyInput(verify1: accountTFText, verify2: pwdTFText)
        if !(message?.isBlank ?? true) {
            MBProgressHUD.showWithText(text: message ?? "", view: view)
            return
        }
        
        viewModel.updateBlock = {[unowned self] in
            MBProgressHUD.hide(for: self.view, animated: true)
            if self.viewModel.loginServe?.ret == false {
                MBProgressHUD.showWithText(text: self.viewModel.loginServe?.msg ?? "", view: self.view)
                return
            }
            
            // 登录账号存储
            UserDefaults.LoginInfo.set(value: accountTFText, forKey: .accountText)
            UserDefaults.LoginInfo.set(value: pwdTFText, forKey: .passwordText)
            let selectText = self.contentServeView.remLoginButton.isSelected ? "1" : "0"
            UserDefaults.LoginInfo.set(value: selectText, forKey: .rem_login)
            
            //  登录成功后，User调用需要 access_token 添加到 headerfad 中，expire_time 失效时间
            let loginModel: TRLoginModel? = self.viewModel.loginServe
            UserDefaults.LoginInfo.set(value: loginModel?.access_token, forKey: .access_token)
            UserDefaults.LoginInfo.set(value: loginModel?.expire_time, forKey: .expire_time)
            UserDefaults.AccountInfo.set(value: loginModel?.data?.UserName, forKey: .userName)
            
            let tabBar = LXTabbarProvider.TRsystemStyle()
            let keyWindow = UIApplication.shared.windows.first
            if let window = keyWindow {
                window.rootViewController = tabBar
            }
        }

        MBProgressHUD.showWithStatus(text: "", view: view)
        viewModel.refreshDataSource_Login(userName: accountTFText, UserPWD: pwdTFText)
    }
    
    // 忘记密码
    func blockForgetPwdButtonClick(button: UIButton) {
        let nextVc = TRForgetPwdViewController()
        let keyWindow = UIApplication.shared.windows.first
        if let window = keyWindow {
            window.rootViewController = nextVc
        }
    }
    
    // 记住登录
    func blockRemLoginButtonClick(button: UIButton) {
        button.isSelected = !button.isSelected
    }
    
    func autoLogin(){
        if UserDefaults.LoginInfo.string(forKey: .rem_login) == "1" {
            blockLoginButtonClick(button: UIButton.init())
        }
    }
}
