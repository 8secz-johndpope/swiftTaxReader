//
//  TRTicketTypeHeaderTypeView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRTicketTypeHeaderTypeViewButtonClick = (_ button: UIButton) ->Void

class TRTicketTypeHeaderTypeView: UIView {
    
    var footerButtonClick : TRTicketTypeHeaderTypeViewButtonClick?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTipLabel: UILabel = {
        let view = UILabel.init()
        view.text = "发票类型"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18.0)
        
        return view
    }()
    
    var footerButton1:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("个人", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.layer.cornerRadius = 22.0
        
        button.setTitleColor(UIColor.red, for: .normal)
        button.backgroundColor = TRPinkBackgroundColor
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.red.cgColor
        
        button.tag = 1
        button.addTarget(self, action: #selector(footerButtonClick1(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick1(button:UIButton) {
        if !button.isSelected {
            button.setTitleColor(UIColor.red, for: .normal)
            button.backgroundColor = TRPinkBackgroundColor
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.red.cgColor
            
            self.footerButton2.setTitleColor(UIColor.black, for: .normal)
            self.footerButton2.backgroundColor = TRGrayBackgroundColor
            self.footerButton2.layer.borderWidth = 0.0
            self.footerButton2.layer.borderColor = UIColor.white.cgColor
        } else {
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = TRGrayBackgroundColor
            button.layer.borderWidth = 0.0
            button.layer.borderColor = UIColor.white.cgColor

            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton1.backgroundColor = TRGrayBackgroundColor
            self.footerButton1.layer.borderWidth = 0.0
            self.footerButton1.layer.borderColor = UIColor.white.cgColor
        }
        
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
        
    var footerButton2:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("企业", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.layer.cornerRadius = 22.0
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = TRGrayBackgroundColor
        button.layer.borderWidth = 0.0
        button.layer.borderColor = UIColor.white.cgColor
        
        button.tag = 2
        button.addTarget(self, action: #selector(footerButtonClick2(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick2(button:UIButton) {
        if !button.isSelected {
            button.setTitleColor(UIColor.red, for: .normal)
            button.backgroundColor = TRPinkBackgroundColor
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.red.cgColor
            
            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton1.backgroundColor = TRGrayBackgroundColor
            self.footerButton1.layer.borderWidth = 0.0
            self.footerButton1.layer.borderColor = UIColor.white.cgColor
        } else {
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = TRGrayBackgroundColor
            button.layer.borderWidth = 0.0
            button.layer.borderColor = UIColor.white.cgColor

            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton1.backgroundColor = TRGrayBackgroundColor
            self.footerButton1.layer.borderWidth = 0.0
            self.footerButton1.layer.borderColor = UIColor.white.cgColor
        }

        // 功能点的改变
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.addSubview(self.trTipLabel)
        self.trTipLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(30)
        }
        
        self.addSubview(self.footerButton1)
        self.footerButton1.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.trTipLabel.snp.right).offset(16)
            make.width.equalTo(88)
            make.height.equalTo(44)
        }

        self.addSubview(self.footerButton2)
        self.footerButton2.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.footerButton1.snp.right).offset(16)
            make.width.equalTo(88)
            make.height.equalTo(44)
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
