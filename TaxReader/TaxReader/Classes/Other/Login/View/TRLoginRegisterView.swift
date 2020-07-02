//
//  TRLoginRegisterView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRLoginRegisterView: UIView {
    lazy var registerButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = UIColor.init(red: 216.0 / 255, green: 219.0 / 255, blue: 255.0 / 255, alpha: 1)
        view.setTitle("立即注册", for: .normal)
        view.setTitleColor(TRThemeColor, for: .normal)
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.registerButton)
        self.registerButton.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
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
