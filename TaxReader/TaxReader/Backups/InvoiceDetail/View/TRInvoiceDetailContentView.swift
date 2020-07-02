//
//  TRInvoiceDetailContentView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRInvoiceDetailContentViewButtonClick = (_ button: UIButton) ->Void

class TRInvoiceDetailContentView: UIView {
    
    var footerButtonClick : TRInvoiceDetailContentViewButtonClick?
    
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
    lazy var trTipTypeLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "发票类型："
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 19.0)
        view.textAlignment = .right

        return view
    }()

    lazy var trTypeLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "电子普通发票"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 17.0)

        return view
    }()

    lazy var trTipTitleLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "发票抬头："
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 19.0)
        view.textAlignment = .right

        return view
    }()

    lazy var trTitleLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "企业"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 17.0)

        return view
    }()
    
    lazy var trTipInContentLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "发票内容："
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 19.0)
        view.textAlignment = .right

        return view
    }()

    lazy var trInContentLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "商品类别"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 17.0)

        return view
    }()

    lazy var trTipTaxNumberLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "发票税号："
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 19.0)
        view.textAlignment = .right

        return view
    }()

    lazy var trTaxNumberLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "80935840395843058"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 17.0)

        return view
    }()
    
    lazy var trTipPriceLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "发票金额："
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 19.0)
        view.textAlignment = .right

        return view
    }()

    lazy var trPriceLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "46.9"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 17.0)

        return view
    }()
    
    var footerButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = TRThemeColor
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.setTitle("查看发票", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick(button:UIButton) {
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }

    
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
        self.contentView.addSubview(self.trTipTypeLabel)
        self.trTipTypeLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(12)
            make.width.equalTo(110)
            make.height.equalTo(35)
        }

        self.contentView.addSubview(self.trTypeLabel)
        self.trTypeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipTypeLabel.snp.top)
            make.left.equalTo(self.trTipTypeLabel.snp.right).offset(8)
            make.right.equalTo(-30)
            make.height.equalTo(self.trTipTypeLabel.snp.height)
        }

        self.contentView.addSubview(self.trTipTitleLabel)
        self.trTipTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTypeLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipTypeLabel.snp.left)
            make.width.equalTo(self.trTipTypeLabel.snp.width)
            make.height.equalTo(self.trTipTypeLabel.snp.height)
        }

        self.contentView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipTitleLabel.snp.top)
            make.left.equalTo(self.trTypeLabel.snp.left)
            make.right.equalTo(-30)
            make.height.equalTo(self.trTipTypeLabel.snp.height)
        }
        
        
        
        self.contentView.addSubview(self.trTipInContentLabel)
        self.trTipInContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipTypeLabel.snp.left)
            make.width.equalTo(self.trTipTypeLabel.snp.width)
            make.height.equalTo(self.trTipTypeLabel.snp.height)
        }

        self.contentView.addSubview(self.trInContentLabel)
        self.trInContentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipInContentLabel.snp.top)
            make.left.equalTo(self.trTipInContentLabel.snp.right).offset(8)
            make.right.equalTo(-30)
            make.height.equalTo(self.trTipInContentLabel.snp.height)
        }

        self.contentView.addSubview(self.trTipTaxNumberLabel)
        self.trTipTaxNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trInContentLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipInContentLabel.snp.left)
            make.width.equalTo(self.trTipInContentLabel.snp.width)
            make.height.equalTo(self.trTipInContentLabel.snp.height)
        }

        self.contentView.addSubview(self.trTaxNumberLabel)
        self.trTaxNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipTaxNumberLabel.snp.top)
            make.left.equalTo(self.trInContentLabel.snp.left)
            make.right.equalTo(-30)
            make.height.equalTo(self.trTipInContentLabel.snp.height)
        }
        
        self.contentView.addSubview(self.trTipPriceLabel)
        self.trTipPriceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTaxNumberLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipTypeLabel.snp.left)
            make.width.equalTo(self.trTipTypeLabel.snp.width)
            make.height.equalTo(self.trTipTypeLabel.snp.height)
        }

        self.contentView.addSubview(self.trPriceLabel)
        self.trPriceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipPriceLabel.snp.top)
            make.left.equalTo(self.trTaxNumberLabel.snp.left)
            make.right.equalTo(-30)
            make.height.equalTo(self.trTipPriceLabel.snp.height)
        }
        
        
        // 查看发票
        self.contentView.addSubview(self.footerButton)
        self.footerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipTypeLabel.snp.top)
            make.right.equalTo(-12)
            make.width.equalTo(100)
            make.height.equalTo(30)
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
