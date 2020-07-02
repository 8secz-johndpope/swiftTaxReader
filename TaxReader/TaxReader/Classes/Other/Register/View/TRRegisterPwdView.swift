//
//  TRRegisterPwdView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRRegisterPwdView: UIView {
    lazy var warnMegLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 15.0)
        view.text = "密码为8-16位数字和字母组合!"
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 2.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        
        return view
    }()
    
    lazy var secureButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = UIColor.white
        view.setImage(UIImage.init(named: "LX密码隐藏"), for: .normal)
        view.setImage(UIImage.init(named: "LX密码显示"), for: .selected)
        view.addTarget(self, action: #selector(secureButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func secureButtonClick(button:UIButton) {
        button.isSelected = !button.isSelected
        self.textField.isSecureTextEntry = !self.textField.isSecureTextEntry
    }
    
    lazy var textField: UITextField = {
        let view = UITextField.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.placeholder = "设置密码"
        view.isSecureTextEntry = true
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.warnMegLabel)
        self.warnMegLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(itemMargin)
            make.right.equalToSuperview().offset(-itemMargin)
            make.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            // make.edges.equalToSuperview().inset(UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: 0, right: itemMargin))
            make.top.left.equalToSuperview().offset(itemMargin)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalTo(self.warnMegLabel.snp.top)
        }
        
        self.contentView.addSubview(self.secureButton)
        self.secureButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(self.secureButton.snp.height)
        }
        
        self.contentView.addSubview(self.textField)
        self.textField.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(12)
            make.right.equalTo(self.secureButton.snp.left)
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
