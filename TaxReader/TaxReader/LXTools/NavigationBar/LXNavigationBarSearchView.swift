//
//  LXNavigationBarSearchView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/12.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias LXNavBackButtonClickBlock = (_ button: UIButton) ->Void
typealias LXNavTextFieldShouldReturnBlock = (_ textField: UITextField) ->Void
typealias LXNavNextButtonClickBlock = (_ button: UIButton) ->Void

class LXNavigationBarSearchView: UIView {
    
    var navBackButtonClickBlock: LXNavBackButtonClickBlock?
    var navTextFieldShouldReturnBlock: LXNavTextFieldShouldReturnBlock?
    var navNextButtonClickBlock: LXNavNextButtonClickBlock?
    
    private lazy var trContentView: UIView = {
        let view = UIView.init()
        
        return view
    }()
    
    private lazy var trContentImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "首页背景")
        
        return imageView
    }()
    
    private lazy var trBackgroundView: UIView = {
        let view = UIView.init()
        
        return view
    }()
        
    // 返回
    private lazy var backButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setBackgroundImage(UIImage.init(named: "返回白"), for: .normal)
        view.addTarget(self, action: #selector(navBackButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func navBackButtonClick(button:UIButton) {
        guard let navBackButtonClickBlock = navBackButtonClickBlock else { return }
        navBackButtonClickBlock(button)
    }
    
    private lazy var seniorSearchButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = UIColor.purple
        view.setTitle("高级搜索", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        view.layer.cornerRadius = 16
        view.addTarget(self, action: #selector(navSeniorSearchButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func navSeniorSearchButtonClick(button:UIButton) {
        guard let navNextButtonClickBlock = navNextButtonClickBlock else { return }
        navNextButtonClickBlock(button)
    }
    
    // 搜索
    private lazy var searchView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.init(red: 125/255.0, green: 136/255.0, blue: 246/255.0, alpha: 1)
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "搜索")
        
        return imageView
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField.init()
        textField.placeholder = "文章"
        textField.delegate = self
        textField.returnKeyType = .done
        
        return textField
    }()
        
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trContentImageView)
        self.trContentImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trBackgroundView)
        self.trBackgroundView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(LXNavBarStatusHeight)
        }
        
        self.trBackgroundView.addSubview(self.backButton)
        self.backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(4)
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
        
        self.trBackgroundView.addSubview(self.seniorSearchButton)
        self.seniorSearchButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-4)
            make.centerY.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(32)
        }

        self.trBackgroundView.addSubview(self.searchView)
        self.searchView.snp.makeConstraints { (make) in
            make.left.equalTo(self.backButton.snp.right).offset(12)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.seniorSearchButton.snp.left).offset(-12)
            make.height.equalTo(32)

        }

        self.searchView.addSubview(self.searchImageView)
        self.searchImageView.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(24)
        }

        self.searchView.addSubview(self.searchTextField)
        self.searchTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.searchImageView.snp.right).offset(8)
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isFirstView: Bool? {
        didSet {
            guard let isFirstView = isFirstView else {
                return
            }
            
            self.backButton.isHidden = isFirstView ? true : false
            if isFirstView {
                self.backButton.snp.updateConstraints { (make) in
                    make.size.equalTo(0)
                }
            }
        }
    }
    
    var isHasSeniorButton: Bool? {
        didSet {
            guard let isHasSeniorButton = isHasSeniorButton else {
                return
            }
            
            self.seniorSearchButton.isHidden = isHasSeniorButton ? false : true
            if !isHasSeniorButton {
                self.seniorSearchButton.snp.updateConstraints { (make) in
                    make.size.equalTo(0)
                }
            }
        }
    }
}

extension LXNavigationBarSearchView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let navTextFieldShouldReturnBlock = navTextFieldShouldReturnBlock else { return false}
        navTextFieldShouldReturnBlock(textField)

        return true
    }
}
