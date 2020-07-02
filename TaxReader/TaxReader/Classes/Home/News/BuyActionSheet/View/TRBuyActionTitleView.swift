//
//  TRBuyActionTitleView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRBuyActionTitleView: UIView {
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTitleLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.text = "请选择购买的选项"
        view.textColor = UIColor.black
        view.font  = UIFont.systemFont(ofSize: 17.0)
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var trCancelButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = UIColor.white
        view.setImage(UIImage.init(named: "icon_close"), for: .normal)
        
        return view
    }()
        
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trCancelButton)
        self.trCancelButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(self.trContentView.snp.height)
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
