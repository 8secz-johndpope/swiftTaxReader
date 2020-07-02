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

class LXNavigationBarSearchView: UIView {
    
    var navBackButtonClickBlock: LXNavBackButtonClickBlock?
    var navTextFieldShouldReturnBlock: LXNavTextFieldShouldReturnBlock?
    
    // 背景
    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "首页背景")
        
        return imageView
    }()
        
    // 返回
    private lazy var backButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setBackgroundImage(UIImage.init(named: "返回白"), for: .normal)
        button.addTarget(self, action: #selector(navBackButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func navBackButtonClick(button:UIButton) {
        guard let navBackButtonClickBlock = navBackButtonClickBlock else { return }
        navBackButtonClickBlock(button)
    }
    
    // 搜索
    private lazy var searchView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.init(red: 125/255.0, green: 136/255.0, blue: 246/255.0, alpha: 1)
        view.layer.cornerRadius = 15
        
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
        self.addSubview(self.bgImageView)
        self.bgImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
                
        self.addSubview(self.backButton)
        self.backButton.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.bottom.equalTo(-12)
            make.size.equalTo(36)
        }
                
        self.addSubview(self.searchView)
        self.searchView.snp.makeConstraints { (make) in
            make.left.equalTo(self.backButton.snp.right).offset(20)
            make.bottom.equalTo(-12)
            make.right.equalTo(-30)
            make.height.equalTo(30)

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
}

extension LXNavigationBarSearchView:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let navTextFieldShouldReturnBlock = navTextFieldShouldReturnBlock else { return false}
        navTextFieldShouldReturnBlock(textField)

        return true
    }
}
