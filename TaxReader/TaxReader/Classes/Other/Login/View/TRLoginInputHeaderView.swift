//
//  TRLoginInputHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/11.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRLoginInputHeaderView: UIView {
    lazy var headerLabel: UILabel = {
        let view = UILabel.init()
        view.text = "登录/注册"
        view.textColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 22.0)
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.headerLabel)
        self.headerLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
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
