//
//  TRRegisterNumberCodeView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRRegisterNumberCodeViewTextFieldDidEndEditingBlock = (_ textField: UITextField, _ reason: UITextField.DidEndEditingReason) ->Void

typealias TRRegisterNumberCodeViewCountDownButtonClickBlock = (_ button: GSCaptchaButton) ->Void

class TRRegisterNumberCodeView: UIView {
    
    var textFieldDidEndEditingBlock: TRRegisterNumberCodeViewTextFieldDidEndEditingBlock?
    var countButtonClickBlock: TRRegisterNumberCodeViewCountDownButtonClickBlock?
    
    lazy var warnMegLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.red
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var bgViewForTextfield: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 2.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        
        return view
    }()
    
    lazy var textField: UITextField = {
        let view = UITextField.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.placeholder = "输入验证码"
        view.delegate = self
        
        return view
    }()
    
    lazy var countDownButton: GSCaptchaButton = {
        let view = GSCaptchaButton.init(type: .custom)
        view.backgroundColor = UIColor.init(red: 77.0 / 255, green: 79.0 / 255, blue: 96.0 / 255, alpha: 1)
        view.setTitle("获取验证码", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        view.addTarget(self, action: #selector(countDownButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func countDownButtonClick(button:GSCaptchaButton) {        
        guard let countButtonClickBlock = countButtonClickBlock else { return }
        countButtonClickBlock(button)
    }
    
    func setupLayout() {
        self.addSubview(self.warnMegLabel)
        self.warnMegLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(itemMargin)
            make.right.equalToSuperview().offset(-itemMargin)
            make.bottom.equalToSuperview()
            make.height.equalTo(0)
        }
        
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            // make.edges.equalToSuperview().inset(UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: 0, right: itemMargin))
            make.top.left.equalToSuperview().offset(itemMargin)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalTo(self.warnMegLabel.snp.top)
        }
        
        self.contentView.addSubview(self.bgViewForTextfield)
        self.bgViewForTextfield.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.6)
        }
        
        self.bgViewForTextfield.addSubview(self.textField)
        self.textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.countDownButton)
        self.countDownButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.textField.snp.right).offset(12)
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

extension TRRegisterNumberCodeView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let textFieldDidEndEditingBlock = textFieldDidEndEditingBlock else { return }
        textFieldDidEndEditingBlock(textField, reason)
    }
}
