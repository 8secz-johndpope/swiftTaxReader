//
//  LXNavigationBarView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias LXNavigationBarViewBackButtonClickBlock = () ->Void
typealias LXNavigationBarViewRightButtonClickBlock = (_ button: UIButton) ->Void

class LXNavigationBarView: UIView {
    
    var navBackButtonClick : LXNavigationBarViewBackButtonClickBlock?
    var navRightButtonClick : LXNavigationBarViewRightButtonClickBlock?
    
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
        button.addTarget(self, action: #selector(navBackButtonClick(backButton:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func navBackButtonClick(backButton:UIButton) {
        guard let navBackButtonClick = navBackButtonClick else { return }
        navBackButtonClick()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textColor = UIColor.white
        
        return label
    }()
    
    // right
    lazy var rightButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.isHidden = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(navRigthButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func navRigthButtonClick(button:UIButton) {
        guard let navRightButtonClick = navRightButtonClick else { return }
        navRightButtonClick(button)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    func setupLayout() {
        self.addSubview(self.bgImageView)
        self.bgImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
                
        self.addSubview(self.backButton)
        self.backButton.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.bottom.equalTo(-8)
            make.size.equalTo(36)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.backButton.snp.centerY)
        }
        
        self.addSubview(self.rightButton)
        self.rightButton.snp.makeConstraints { (make) in
            make.right.equalTo(-8)
            make.centerY.equalTo(self.backButton.snp.centerY)
            make.size.equalTo(44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleString: String? {
        didSet {
            guard let titleString = titleString else {
                return
            }
            
            self.titleLabel.text = titleString
        }
    }
    
    var rightBarTitleNormal: String? {
        didSet {
            guard let rightBarTitleNormal = rightBarTitleNormal else {
                return
            }
            
            self.rightButton.setTitle(rightBarTitleNormal, for: .normal)
            self.rightButton.isHidden = (self.rightButton.titleLabel?.text == nil) ? true : false
        }
    }
    
    var rightBarTitleSelected: String? {
        didSet {
            guard let rightBarTitleSelected = rightBarTitleSelected else {
                return
            }
            
            self.rightButton.setTitle(rightBarTitleSelected, for: .selected)
            self.rightButton.isHidden = (self.rightButton.titleLabel?.text == nil) ? true : false
        }
    }
    
    var isFirstView: Bool? {
        didSet {
            guard let isFirstView = isFirstView else {
                return
            }
            
            self.backButton.isHidden = isFirstView ? true : false
        }
    }
    
}
