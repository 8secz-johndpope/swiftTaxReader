//
//  TRInfoAccountView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRInfoAccountView: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
    
    lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var underLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var trTipLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "账号："
        view.font = UIFont.systemFont(ofSize: 20.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var trTextField: UITextField = {
        let view = UITextField.init()
        view.backgroundColor = UIColor.white
        view.text = "13000000000"
        view.textColor = UIColor.black
        view.isEnabled = false
        
        return view
    }()
    
    lazy var trWarnLabel: UILabel = {
        let view = UILabel.init()
        view.text = "注：账户不可修改"
        view.textColor = UIColor.red
        view.font = UIFont.systemFont(ofSize: 14.0)
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight)
        }
        
        self.backView.addSubview(self.trTipLabel)
        self.trTipLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(30)
        }
        
        self.backView.addSubview(self.trTextField)
        self.trTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.trTipLabel.snp.right)
        }
        
        self.contentView.addSubview(self.underLineView)
        self.underLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.contentView.addSubview(self.trWarnLabel)
        self.trWarnLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.underLineView.snp.bottom)
            make.leading.equalTo(self.trTipLabel.snp.leading)
            make.bottom.equalToSuperview()
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
