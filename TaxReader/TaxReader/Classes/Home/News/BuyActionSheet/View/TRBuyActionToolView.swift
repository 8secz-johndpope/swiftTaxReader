//
//  TRBuyActionToolView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
typealias TRBuyActionToolViewBlock = (_ button: UIButton) ->Void

class TRBuyActionToolView: UIView {
    
    var footerButtonClick : TRBuyActionToolViewBlock?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var footerButton1:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.orange
        button.setTitle("加入购物车", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.tag = 1
        button.addTarget(self, action: #selector(footerButtonClick1(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick1(button:UIButton) {
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
        
    lazy var footerButton2:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.systemPink
        button.setTitle("立即购买", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
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
        
        self.contentView.addSubview(self.footerButton1)
        self.footerButton1.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(LXScreenWidth * 0.5)
        }
        
        self.contentView.addSubview(self.footerButton2)
        self.footerButton2.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.footerButton1.snp.right)
            make.width.equalTo(LXScreenWidth * 0.5)
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
    
    var isOnlyCartButton: Bool? {
        didSet {
            guard let isCartButton = isOnlyCartButton else {
                return
            }
            
            if isCartButton {
                self.footerButton2.snp.updateConstraints { (make) in
                    make.width.equalTo(0)
                }
                
                self.footerButton1.snp.updateConstraints { (make) in
                    make.width.equalTo(LXScreenWidth)
                }
            }else {
                self.footerButton2.snp.updateConstraints { (make) in
                    make.width.equalTo(LXScreenWidth * 0.5)
                }
                
                self.footerButton1.snp.updateConstraints { (make) in
                    make.width.equalTo(LXScreenWidth * 0.5)
                }
            }
        }
    }
    
}
