//
//  TRMoreNewsDropView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/8.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRMoreNewsDropViewButtonClickBlock = (_ button: UIButton) ->Void

class TRMoreNewsDropView: UIView {
    
    var selectButtonClickBlock: TRMoreNewsDropViewButtonClickBlock?
    
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    lazy var trSelectButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = TRSelectedBackgroundColor
        button.setTitle("全部", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(selectButtonClick(button:)), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    @objc func selectButtonClick(button:UIButton) {
        guard let selectButtonClickBlock = selectButtonClickBlock else { return }
        selectButtonClickBlock(button)
    }
    
    lazy var trArrowImageView:UIImageView = {
        let view = UIImageView.init(frame: .zero)
        view.image = UIImage.init(named: "LX上箭头")
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trSelectButton)
        self.trSelectButton.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trArrowImageView)
        self.trArrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-12)
            make.size.equalTo(22)
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
