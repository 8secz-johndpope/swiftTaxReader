//
//  LXFooterButtonTwoView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias LXFooterButtonTwoViewBlock = (_ button: UIButton) ->Void

class LXFooterButtonTwoView: UIView {
    
    var footerButtonClick : LXFooterButtonTwoViewBlock?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var backView1: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var footerButton1:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = TRThemeColor
        button.setTitle("重置", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.layer.cornerRadius = 8.0
        button.tag = 1
        button.addTarget(self, action: #selector(footerButtonClick1(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick1(button:UIButton) {
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
    
    lazy var backView2: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var footerButton2:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = TRThemeColor
        button.setTitle("确定", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.layer.cornerRadius = 8.0
        button.tag = 2
        button.addTarget(self, action: #selector(footerButtonClick2(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick2(button:UIButton) {
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(LXScreenWidth)
            make.height.equalTo(44)
        }
        
        self.backView.addSubview(self.backView1)
        self.backView1.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        
        self.backView1.addSubview(self.footerButton1)
        self.footerButton1.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
        
        self.backView.addSubview(self.backView2)
        self.backView2.snp.makeConstraints { (make) in
            make.left.equalTo(self.backView1.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        
        self.backView2.addSubview(self.footerButton2)
        self.footerButton2.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
