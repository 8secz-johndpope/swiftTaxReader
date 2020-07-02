//
//  TRCartToolView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRCartToolView: UIView {
        
    // 全选
    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    var trSelectAllButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        button.setImage(UIImage.init(named: "LX选中"), for: .selected)
        button.addTarget(self, action: #selector(selectButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func selectButtonClick(button:UIButton) {
        
    }
    
    private lazy var trSelectAllLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.text = "全选"
        label.textColor = UIColor.lightGray
        
        return label
    }()
    
    // 结算
    lazy var trTotalBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    var trTotalPriceButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.red
        button.setTitle("结算", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20.0
        button.addTarget(self, action: #selector(totalPriceButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func totalPriceButtonClick(button:UIButton) {
        
    }
    
    private lazy var trTotalPriceLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.text = "总计：￥1100"
        label.textColor = UIColor.red
        
        return label
    }()
    
    // 编辑
    lazy var trEditBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white

        return view
    }()
    
    var trEditDeleteButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("删除", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.cornerRadius = 20.0
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2.0
        button.addTarget(self, action: #selector(editDeleteButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func editDeleteButtonClick(button:UIButton) {
        
    }

    var trEditToFavorButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("移到收藏", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 20.0
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 2.0
        button.addTarget(self, action: #selector(editToFavorButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func editToFavorButtonClick(button:UIButton) {
        
    }

    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0.5, left: 0, bottom: 0.5, right: 0))
        }
        
        self.addSubview(self.trSelectAllButton)
        self.trSelectAllButton.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
        
        self.addSubview(self.trSelectAllLabel)
        self.trSelectAllLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectAllButton.snp.right).offset(12)
            make.centerY.equalTo(self.trSelectAllButton.snp.centerY)
        }
        
        // 编辑功能
        self.addSubview(self.trEditBackView)
        self.trEditBackView.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectAllLabel.snp.right).offset(12)
            make.bottom.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        
        self.trEditBackView.addSubview(self.trEditDeleteButton)
        self.trEditDeleteButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(120)
        }
        
        self.trEditBackView.addSubview(self.trEditToFavorButton)
        self.trEditToFavorButton.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.equalTo(self.trEditDeleteButton.snp.left).offset(-12)
            make.width.equalTo(120)
        }
        
        // 结算功能
        self.addSubview(self.trTotalBackView)
        self.trTotalBackView.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectAllLabel.snp.right).offset(12)
            make.bottom.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        
        self.trTotalBackView.addSubview(self.trTotalPriceButton)
        self.trTotalPriceButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(120)
        }
        
        self.trTotalBackView.addSubview(self.trTotalPriceLabel)
        self.trTotalPriceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.trTotalPriceButton.snp.left).offset(-12)
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
