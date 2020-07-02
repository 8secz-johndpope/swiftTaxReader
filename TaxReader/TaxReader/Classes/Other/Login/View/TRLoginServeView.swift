//
//  TRLoginServeView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRLoginServeView: UIView {
    
    lazy var accountView: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    lazy var accountBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 2.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor

        return view
    }()
    
    lazy var accountImageView: UIImageView = {
        let view = UIImageView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.image = UIImage.init(named: "用户")
        
        return view
    }()
    
    lazy var accountTextField: UITextField = {
        let view = UITextField.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.placeholder = "用户名/邮箱/手机"
        
        return view
    }()
    
    lazy var pwdView: UIView = {
        let view = UIView.init(frame: .zero)

        return view
    }()
    
    lazy var pwdBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 2.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor

        return view
    }()
    
    lazy var pwdImageView: UIImageView = {
        let view = UIImageView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.image = UIImage.init(named: "密码")
        
        return view
    }()
    
    lazy var pwdTextField: UITextField = {
        let view = UITextField.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.placeholder = "密码"
        view.isSecureTextEntry = true
        
        return view
    }()

    lazy var remBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white

        return view
    }()
    
    lazy var remLoginButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setTitle("记住登录", for: .normal)
        view.setTitleColor(TRThemeColor, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        view.setImage(UIImage.init(named: "对号02"), for: .normal)
        view.setImage(UIImage.init(named: "对号01"), for: .selected)
        
        return view
    }()
    
    lazy var remForgetPwdButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setTitle("忘记密码", for: .normal)
        view.setTitleColor(TRThemeColor, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)

        return view
    }()

    lazy var loginButtonBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.green

        return view
    }()
    
    lazy var loginButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = TRThemeColor
        view.setTitle("登录", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)

        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.accountView)
        self.accountView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        }
        
        self.accountView.addSubview(self.accountBackView)
        self.accountBackView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.accountBackView.addSubview(self.accountImageView)
        self.accountImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(40*scaleHeightSE2nd)
        }
        
        self.accountBackView.addSubview(self.accountTextField)
        self.accountTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.accountImageView.snp.right).offset(8)
        }
        
        self.addSubview(self.pwdView)
        self.pwdView.snp.makeConstraints { (make) in
            make.top.equalTo(self.accountView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.accountView.snp.height)
        }
        
        self.pwdView.addSubview(self.pwdBackView)
        self.pwdBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.bottom.left.right.equalToSuperview()
        }
        
        self.pwdBackView.addSubview(self.pwdImageView)
        self.pwdImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(40*scaleHeightSE2nd)
        }
        
        self.pwdBackView.addSubview(self.pwdTextField)
        self.pwdTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.accountImageView.snp.right).offset(8)
        }

        self.addSubview(self.remBackView)
        self.remBackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.pwdView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.accountView.snp.height)
        }
        
        self.remBackView.addSubview(self.remLoginButton)
        self.remLoginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        self.remBackView.addSubview(self.remForgetPwdButton)
        self.remForgetPwdButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        self.addSubview(self.loginButtonBackView)
        self.loginButtonBackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.remBackView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.accountView.snp.height)
        }
        
        self.loginButtonBackView.addSubview(self.loginButton)
        self.loginButton.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
