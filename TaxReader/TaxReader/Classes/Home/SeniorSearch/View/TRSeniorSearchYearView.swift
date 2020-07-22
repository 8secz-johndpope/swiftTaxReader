//
//  TRSeniorSearchYearView.swift
//  TaxReader
//
//  Created by asdc on 2020/7/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

let textFieldWidth = ((kScreenWidth - 40 - 2 * 20) - 3 * 12) * 0.25

typealias TRSeniorSearchYearViewTextFieldBlock = (_ textField: UITextField) ->Void

class TRSeniorSearchYearView: UIView {
    
    var textFieldShouldBeginEditingBlock: TRSeniorSearchYearViewTextFieldBlock?
    
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
    
    lazy var trStartYearTFBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        
        return view
    }()
    
    lazy var trStartYearSearchTextField: UITextField = {
        let view = UITextField.init()
        view.delegate = self
        view.returnKeyType = .done
        view.font = UIFont.systemFont(ofSize: 12.0)
        
        return view
    }()
    
    lazy var trEndYearTFBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        
        return view
    }()
    
    lazy var trEndYearSearchTextField: UITextField = {
        let view = UITextField.init()
        view.delegate = self
        view.returnKeyType = .done
        view.font = UIFont.systemFont(ofSize: 12.0)
        
        return view
    }()

    lazy var trStartNumberTFBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        
        return view
    }()
    
    lazy var trStartNumberSearchTextField: UITextField = {
        let view = UITextField.init()
        view.delegate = self
        view.returnKeyType = .done
        view.font = UIFont.systemFont(ofSize: 12.0)
        
        return view
    }()
    
    lazy var trEndNumberTFBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        
        return view
    }()
    
    lazy var trEndNumberSearchTextField: UITextField = {
        let view = UITextField.init()
        view.delegate = self
        view.returnKeyType = .done
        view.font = UIFont.systemFont(ofSize: 12.0)
        
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
        
        self.trContentView.addSubview(self.trStartYearTFBackgroundView)
        self.trStartYearTFBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTitleLabel.snp.bottom)
            make.left.bottom.equalToSuperview()
            make.width.equalTo(textFieldWidth)
        }
        
        self.trStartYearTFBackgroundView.addSubview(self.trStartYearSearchTextField)
        self.trStartYearSearchTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
        self.trContentView.addSubview(self.trEndYearTFBackgroundView)
        self.trEndYearTFBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trStartYearTFBackgroundView.snp.top)
            make.left.equalTo(self.trStartYearTFBackgroundView.snp.right).offset(12)
            make.bottom.equalToSuperview()
            make.width.equalTo(self.trStartYearTFBackgroundView.snp.width)
        }
        
        self.trEndYearTFBackgroundView.addSubview(self.trEndYearSearchTextField)
        self.trEndYearSearchTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
        self.trContentView.addSubview(self.trStartNumberTFBackgroundView)
        self.trStartNumberTFBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trStartYearTFBackgroundView.snp.top)
            make.left.equalTo(self.trEndYearTFBackgroundView.snp.right).offset(40)
            make.bottom.equalToSuperview()
            make.width.equalTo(self.trStartYearTFBackgroundView.snp.width)
        }
        
        self.trStartNumberTFBackgroundView.addSubview(self.trStartNumberSearchTextField)
        self.trStartNumberSearchTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(8)
        }
        
        self.trContentView.addSubview(self.trEndNumberTFBackgroundView)
        self.trEndNumberTFBackgroundView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trStartYearTFBackgroundView.snp.top)
            make.left.equalTo(self.trStartNumberTFBackgroundView.snp.right).offset(12)
            make.bottom.equalToSuperview()
            make.width.equalTo(self.trStartYearTFBackgroundView.snp.width)
        }
        
        self.trEndNumberTFBackgroundView.addSubview(self.trEndNumberSearchTextField)
        self.trEndNumberSearchTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(8)
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
    
    var dataArrayTextFieldPlaceHolder: [String]? {
        didSet {
            guard let dataArrayTextFieldPlaceHolder = dataArrayTextFieldPlaceHolder else {
                return
            }

            self.trStartYearSearchTextField.placeholder = dataArrayTextFieldPlaceHolder[0]
            self.trEndYearSearchTextField.placeholder = dataArrayTextFieldPlaceHolder[1]
            self.trStartNumberSearchTextField.placeholder = dataArrayTextFieldPlaceHolder[2]
            self.trEndNumberSearchTextField.placeholder = dataArrayTextFieldPlaceHolder[3]
        }
    }
}

extension TRSeniorSearchYearView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 6 {
            
            guard let textFieldShouldBeginEditingBlock = textFieldShouldBeginEditingBlock else { return false}
            textFieldShouldBeginEditingBlock(textField)
            
            return false
        }
        return true
    }
}

