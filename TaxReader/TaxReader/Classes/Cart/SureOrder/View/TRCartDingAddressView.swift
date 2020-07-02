//
//  TRCartDingAddressView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRCartDingAddressViewNoAddressCoverButtonBlock = (_ button: UIButton) ->Void

class TRCartDingAddressView: UIView {
    
    var coverButtonClickBlock: TRCartDingAddressViewNoAddressCoverButtonBlock?
    
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
    
    lazy var bottomLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    // 具体布局
    lazy var trImageView: UIImageView = {
        let view = UIImageView.init()
        view.backgroundColor = UIColor.white
        view.image = UIImage.init(named: "地址")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    lazy var trInderImageView: UIImageView = {
        let view = UIImageView.init()
        view.backgroundColor = UIColor.white
        view.image = UIImage.init(named: "会员箭头灰")
        
        return view
    }()

    lazy var centerView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel.init()
        view.text = "张某某"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18)
        
        return view
    }()
    
    lazy var phoneLabel: UILabel = {
        let view = UILabel.init()
        view.text = "13000000000"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18)
        
        return view
    }()
    
    lazy var addressLabel: UILabel = {
        let view = UILabel.init()
        view.text = "北京市海淀区XXXXXXXXXXXX小区XXXXXXX单元XXXXX室"
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 16)
        view.numberOfLines = 0
        
        return view
    }()
    
    // 解救获取收货地址，在没有的情况下，显示提示按钮
    var noAddressCoverButton:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.backgroundColor = UIColor.lightGray
        view.setTitle("请先设置添加地址", for: .normal)
        view.addTarget(self, action: #selector(coverButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func coverButtonClick(button:UIButton) {
        guard let coverButtonClickBlock = coverButtonClickBlock else { return }
        coverButtonClickBlock(button)
    }

    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-12)
        }
        
        self.backView.addSubview(self.bottomLineView)
        self.bottomLineView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        // 具体
        self.backView.addSubview(self.trImageView)
        self.trImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(12)
            make.size.equalTo(39)
        }
        
        self.backView.addSubview(self.trInderImageView)
        self.trInderImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-12)
            make.size.equalTo(32)
        }
        
        self.backView.addSubview(self.centerView)
        self.centerView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.trImageView.snp.right)
            make.right.equalTo(self.trInderImageView.snp.left)
            make.height.equalTo(1)
        }
        
        self.backView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.centerView.snp.top)
            make.left.equalTo(self.trImageView.snp.right).offset(12)
        }
        
        self.backView.addSubview(self.phoneLabel)
        self.phoneLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.centerView.snp.top)
            make.left.equalTo(self.nameLabel.snp.right).offset(20)
        }
        
        self.backView.addSubview(self.addressLabel)
        self.addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.centerView.snp.bottom).offset(6)
            make.left.equalTo(self.nameLabel.snp.left)
            make.right.equalTo(self.trInderImageView.snp.left)
        }

        
        self.backView.addSubview(self.noAddressCoverButton)
        self.noAddressCoverButton.snp.makeConstraints { (make) in
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
    
    var isHasDefaultAddress: Bool? {
        didSet {
            guard let isHasAddress = isHasDefaultAddress else {
                return
            }
            
            self.noAddressCoverButton.isHidden = isHasAddress
            self.contentView.isHidden = !isHasAddress
        }
    }
    
    var findDetailOrderConsignee: TROrderFindDetailDataOrderConsigneeModel? {
        didSet {
            guard let model = findDetailOrderConsignee else {
                return
            }
            
            self.nameLabel.text = model.OrderCons
            self.phoneLabel.text = model.OrderConsTel
            self.addressLabel.text = model.OrderConsDetail
        }
    }
    
    var getDefaultAddressDataModel: TRAddressGetDefaultDataModel? {
        didSet {
            guard let model = getDefaultAddressDataModel else {
                return
            }
            
            self.nameLabel.text = model.UserAddressMan
            self.phoneLabel.text = model.UserAddressMobile
            self.addressLabel.text = model.UserAddressDetail
        }
    }
    
}
