//
//  TRAddressTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/14.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRAddressTableViewCellEditBtnClick = () ->Void

class TRAddressTableViewCell: UITableViewCell {
    
    var cellEditBtnClick : TRAddressTableViewCellEditBtnClick?
    
    private lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private lazy var trDefaultImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage.init(named: "红色对号")
        
        return imageView
    }()
    
    private lazy var trNameTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "张某某"
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var trPhoneTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "13012345678"
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var trDefalutTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "默认地址"
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.layer.cornerRadius = 15.0
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.red.cgColor
        
        return label
    }()
    
    private lazy var trEditButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.white
        button.setImage(UIImage.init(named: "LX省略号"), for: .normal)
        button.addTarget(self, action: #selector(cellEditBtnClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func cellEditBtnClick(button:UIButton) {
        // 闭包回调
        guard let cellEditBtnClick = cellEditBtnClick else { return }
        cellEditBtnClick()
    }
    
    private lazy var trAddressTextLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "北京市朝阳区XXXXXXXXXXX小区XXXX单元XXXXXX室"
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        
        return label
    }()
        
    func setupLayout() {
        self.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0))
        }
        
        self.backView.addSubview(self.trDefaultImageView)
        self.trDefaultImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(30)
        }
        
        self.backView.addSubview(self.trNameTextLabel)
        self.trNameTextLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trDefaultImageView.snp.right).offset(12)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(30)
        }
        
        self.backView.addSubview(self.trPhoneTextLabel)
        self.trPhoneTextLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trNameTextLabel.snp.right).offset(12)
            make.centerY.equalTo(self.trNameTextLabel.snp.centerY)
            make.height.equalTo(30)
        }
        
        self.backView.addSubview(self.trDefalutTextLabel)
        self.trDefalutTextLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trPhoneTextLabel.snp.right).offset(12)
            make.centerY.equalTo(self.trNameTextLabel.snp.centerY)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        self.backView.addSubview(self.trEditButton)
        self.trEditButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.size.equalTo(30)
        }
        
        self.backView.addSubview(self.trAddressTextLabel)
        self.trAddressTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trNameTextLabel.snp.bottom).offset(12)
            make.left.equalTo(self.trDefaultImageView.snp.right).offset(12)
            make.right.equalTo(self.trEditButton.snp.left).offset(-12)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.lightGray
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isDefaultAddress: Bool? {
        didSet {
            guard let isDefaultAddress = isDefaultAddress else {
                return
            }
            
            if !isDefaultAddress {
                self.trDefaultImageView.isHidden = true
                self.trDefaultImageView.snp.updateConstraints { (make) in
                    make.left.equalToSuperview().offset(0)
                    make.width.equalTo(0)
                }
                
                self.trDefalutTextLabel.isHidden = true
            }
            
        }
    }
    
    var addressInfoModel: TRAddressInfoDataModel? {
        didSet {
            guard let model = addressInfoModel else {
                return
            }
            
            if model.UserAddressIsDefault == 0 {
                self.trDefaultImageView.isHidden = true
                self.trDefaultImageView.snp.updateConstraints { (make) in
                    make.left.equalToSuperview().offset(0)
                    make.width.equalTo(0)
                }
                
                self.trDefalutTextLabel.isHidden = true
            }else {
                self.trDefaultImageView.isHidden = false
                self.trDefaultImageView.snp.updateConstraints { (make) in
                    make.left.equalToSuperview().offset(12)
                    make.width.equalTo(30)
                }
                
                self.trDefalutTextLabel.isHidden = false
            }
            
            self.trNameTextLabel.text = model.UserAddressMan
            self.trPhoneTextLabel.text = model.UserAddressMobile
            
            // 详细地址拼接
            self.trAddressTextLabel.text = "\(model.UserAddressProv ?? "")\(model.UserAddressCity ?? "")\(model.UserAddressDistrict ?? "")\(model.UserAddressDetail ?? "")"
        }
    }
    
}
