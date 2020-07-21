//
//  TRSeniorSearchInputView.swift
//  TaxReader
//
//  Created by asdc on 2020/7/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRSeniorSearchInputView: UIView {
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTitleLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.text = "搜索"
        view.font = UIFont.systemFont(ofSize: 15.0)
        view.textColor = UIColor.black
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var trTFBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        
        return view
    }()
    
    private lazy var trSearchTextField: UITextField = {
        let view = UITextField.init()
        view.delegate = self
        view.returnKeyType = .done
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(8)
            make.height.equalTo(25)
        }
        
        self.trContentView.addSubview(self.trTFBackgroundView)
        self.trTFBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTitleLabel.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.trTFBackgroundView.addSubview(self.trSearchTextField)
        self.trSearchTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTitleLabel.snp.bottom)
            make.left.equalToSuperview().offset(4)
            make.bottom.right.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleLabelText: String? {
        didSet {
            guard let titleLabelText = titleLabelText else {
                return
            }
            
            self.trTitleLabel.text = titleLabelText
        }
    }
    
    var textFieldPlaceHolder: String? {
        didSet {
            guard let textFieldPlaceHolder = textFieldPlaceHolder else {
                return
            }
            
            self.trSearchTextField.placeholder = textFieldPlaceHolder
        }
    }
}

extension TRSeniorSearchInputView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

