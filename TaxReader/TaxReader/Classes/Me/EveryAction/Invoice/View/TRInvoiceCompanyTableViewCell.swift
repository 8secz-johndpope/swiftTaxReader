//
//  TRInvoiceCompanyTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRInvoiceCompanyTableViewCellDefaultButtonBlock = (_ button: UIButton) ->Void

class TRInvoiceCompanyTableViewCell: UITableViewCell {
    
    var defaultButtonBlock: TRInvoiceCompanyTableViewCellDefaultButtonBlock?
    
    lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTipCompanyNameLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "单位名称："
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 17.0)
        view.textAlignment = .right
        
        return view
    }()
    
    lazy var trCompanyNameLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "北京中税和科技发展有限责任公司"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()
    
    lazy var trTipNumberLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "税号："
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 17.0)
        view.textAlignment = .right
        
        return view
    }()
    
    lazy var trNumberLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "9199199111i098980980kil"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()
    
    lazy var trTipAddressLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "地址电话："
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 17.0)
        view.textAlignment = .right
        
        return view
    }()
    
    lazy var trAddressLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "北京市丰台区广安路9号国投财富大厦1号楼10层1003号楼 63886790"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 15.0)
        view.numberOfLines = 0
        
        return view
    }()
    
    lazy var trTipBankLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "开户行及账号："
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 17.0)
        view.textAlignment = .right
        
        return view
    }()
    
    lazy var trBankLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "建设长安银行 103904398490859048590485"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()


    lazy var trDefaultButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setTitle("设置默认开票", for: .normal)
        view.setTitleColor(TRThemeColor, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)

        view.addTarget(self, action: #selector(defaultButtonClick(button:)), for: .touchUpInside)

        return view
    }()

    @objc func defaultButtonClick(button:GSCaptchaButton) {
        guard let defaultButtonBlock = defaultButtonBlock else { return }
        defaultButtonBlock(button)
    }
    
    lazy var trDefaultLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "默认开票"
        view.textAlignment = .center
        view.textColor = UIColor.red
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    func setupLayout() {
        self.contentView.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trTipCompanyNameLabel)
        self.trTipCompanyNameLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(12)
            make.width.equalTo(90)
        }

        self.trContentView.addSubview(self.trCompanyNameLabel)
        self.trCompanyNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipCompanyNameLabel.snp.top)
            make.left.equalTo(self.trTipCompanyNameLabel.snp.right).offset(8)
            make.right.equalTo(-100)
        }
        
        self.trContentView.addSubview(self.trTipNumberLabel)
        self.trTipNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trCompanyNameLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipCompanyNameLabel.snp.left)
            make.width.equalTo(self.trTipCompanyNameLabel.snp.width)
        }

        self.trContentView.addSubview(self.trNumberLabel)
        self.trNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipNumberLabel.snp.top)
            make.left.equalTo(self.trCompanyNameLabel.snp.left)
            make.right.equalTo(-100)
        }
        
        self.trContentView.addSubview(self.trTipAddressLabel)
        self.trTipAddressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trNumberLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipNumberLabel.snp.left)
            make.width.equalTo(self.trTipNumberLabel.snp.width)
        }

        self.trContentView.addSubview(self.trAddressLabel)
        self.trAddressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipAddressLabel.snp.top)
            make.left.equalTo(self.trNumberLabel.snp.left)
            make.right.equalTo(-30)
        }
        
        self.trContentView.addSubview(self.trTipBankLabel)
        self.trTipBankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trAddressLabel.snp.bottom).offset(8)
            make.left.equalTo(self.trTipAddressLabel.snp.left)
            make.width.equalTo(130)
        }

        self.trContentView.addSubview(self.trBankLabel)
        self.trBankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipBankLabel.snp.top)
            make.left.equalTo(self.trTipBankLabel.snp.right).offset(8)
            make.right.equalTo(-10)
        }
        
        // 按钮
        self.trContentView.addSubview(self.trDefaultButton)
        self.trDefaultButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipCompanyNameLabel.snp.top)
            make.right.equalTo(-5)
            make.width.equalTo(90)
            make.height.equalTo(30)
        }
        
        // 显示
        self.trContentView.addSubview(self.trDefaultLabel)
        self.trDefaultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipCompanyNameLabel.snp.top)
            make.right.equalTo(-5)
            make.width.equalTo(90)
            make.height.equalTo(30)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var infoDataModel: TRInvoiceInfoDataModel? {
        didSet {
            guard let model = infoDataModel else {
                return
            }
            
            self.trCompanyNameLabel.text = model.UserInvoiceTitle
            self.trNumberLabel.text = model.UserInvoiceTaxpayerNo
            self.trAddressLabel.text = "\(model.UserInvoiceorAddress ?? "") \(model.UserInvoicePhone ?? "")"
            self.trBankLabel.text = "\(model.UserInvoiceBuyerBankName ?? "") \(model.UserInvoiceBankAcount ?? "")"
            self.trDefaultButton.isHidden = model.UserInvoiceDefault == 1 ? true : false
            self.trDefaultLabel.isHidden = model.UserInvoiceDefault == 1 ? false : true
        }
    }
}
