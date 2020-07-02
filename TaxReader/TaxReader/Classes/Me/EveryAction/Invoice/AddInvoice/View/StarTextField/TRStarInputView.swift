//
//  TRStarInputView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

let starInputViewHeight = 64.0

class TRStarInputView: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 24.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        
        return view
    }()
    
    lazy var starImageView: UIImageView = {
        let view = UIImageView.init()
        view.image = UIImage.init(named: "加星")
        
        return view
    }()
    
    lazy var trTextField: UITextField = {
        let view = UITextField.init()
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20))
        }
        
        self.backView.addSubview(self.starImageView)
        self.starImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
            make.width.height.equalTo(16)
        }
        
        self.backView.addSubview(self.trTextField)
        self.trTextField.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.starImageView.snp.right).offset(8)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isHasStarImageView: Bool? {
        didSet {
            guard let isHasStarImageView = isHasStarImageView else {
                return
            }
            
            self.starImageView.isHidden = isHasStarImageView ? false : true
        }
    }
}
