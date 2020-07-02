//
//  TRInvoiceDetailOrderView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRInvoiceDetailOrderView: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        
        return view
    }()
    
    lazy var topLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    // 单行
    lazy var trTipOrderNumberLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "订单编号："
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 19.0)
        view.textAlignment = .right

        return view
    }()

    lazy var trOrderNumberLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "7859470807894757"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 17.0)

        return view
    }()

    lazy var trTipOrderTimeLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "下单时间："
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 19.0)
        view.textAlignment = .right

        return view
    }()

    lazy var trOrderTimeLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "2020-05-26 12:00:34"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 17.0)

        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.contentView.addSubview(self.bottomLineView)
        self.bottomLineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }

        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLineView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomLineView.snp.top)
        }
        
        // 单行 添加到 backView
        self.contentView.addSubview(self.trTipOrderNumberLabel)
        self.trTipOrderNumberLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(12)
            make.width.equalTo(110)
            make.height.equalTo(35)
        }

        self.contentView.addSubview(self.trOrderNumberLabel)
        self.trOrderNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipOrderNumberLabel.snp.top)
            make.left.equalTo(self.trTipOrderNumberLabel.snp.right).offset(8)
            make.right.equalTo(-30)
            make.height.equalTo(self.trTipOrderNumberLabel.snp.height)
        }

        self.contentView.addSubview(self.trTipOrderTimeLabel)
        self.trTipOrderTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trOrderNumberLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipOrderNumberLabel.snp.left)
            make.width.equalTo(self.trTipOrderNumberLabel.snp.width)
            make.height.equalTo(self.trTipOrderNumberLabel.snp.height)
        }

        self.contentView.addSubview(self.trOrderTimeLabel)
        self.trOrderTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipOrderTimeLabel.snp.top)
            make.left.equalTo(self.trOrderNumberLabel.snp.left)
            make.right.equalTo(-30)
            make.height.equalTo(self.trTipOrderNumberLabel.snp.height)
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
