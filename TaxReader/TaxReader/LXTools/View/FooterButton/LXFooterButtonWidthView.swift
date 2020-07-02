//
//  LXFooterButtonWidthView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias LXFooterButtonWidthViewBlock = (_ button: UIButton) ->Void

class LXFooterButtonWidthView: UIView {
    
    var footerButtonClick : LXFooterButtonWidthViewBlock?
    
    var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
    
    var topLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    var backButtonView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
        
    var footerButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("退出登录", for: UIControl.State.normal)
        button.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick(button:UIButton) {
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
    
    var bottomLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()

    func setupLayout() {
        self.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.addSubview(self.backButtonView)
        self.backButtonView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(LXScreenWidth)
            make.height.equalTo(64)
        }
        
        self.backButtonView.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
                
        self.backButtonView.addSubview(self.bottomLineView)
        self.bottomLineView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.backButtonView.addSubview(self.footerButton)
        self.footerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLineView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomLineView.snp.top)
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
