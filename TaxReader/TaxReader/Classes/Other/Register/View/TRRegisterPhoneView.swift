//
//  TRRegisterPhoneView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRRegisterPhoneViewPrefixButtonBlock = (_ button: UIButton) ->Void

class TRRegisterPhoneView: UIView {
    
    var prefixButtonBlock: TRRegisterPhoneViewPrefixButtonBlock?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 2.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        
        return view
    }()
    
    lazy var prefixButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = UIColor.white
        view.setTitle("+86", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.addTarget(self, action: #selector(prefixButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func prefixButtonClick(button:GSCaptchaButton) {
        guard let prefixButtonBlock = prefixButtonBlock else { return }
        prefixButtonBlock(button)
    }
    
    lazy var textField: UITextField = {
        let view = UITextField.init(frame: .zero)
        view.placeholder = "手机号"
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: 0, right: itemMargin))
        }
        
        self.contentView.addSubview(self.prefixButton)
        self.prefixButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(64)
        }
        
        self.contentView.addSubview(self.textField)
        self.textField.snp.makeConstraints { (make) in
            make.left.equalTo(self.prefixButton.snp.right).offset(4)
            make.top.bottom.right.equalToSuperview()
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
