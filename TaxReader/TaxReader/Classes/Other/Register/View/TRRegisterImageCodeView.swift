//
//  TRRegisterImageCodeView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import BTCaptchaView

class TRRegisterImageCodeView: UIView {
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
        view.placeholder = "输入图片验证码"
        
        return view
    }()
    
    lazy var codeView: BTCaptchaView = {
        let view = BTCaptchaView.init()
        view.font = UIFont.systemFont(ofSize: 18)
        view.code = "税刊阅读"
        view.onTouch = {
            view.code = "中国税务"
        }
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: 0, right: itemMargin))
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
        
        self.contentView.addSubview(self.codeView)
        self.codeView.snp.makeConstraints { (make) in
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
