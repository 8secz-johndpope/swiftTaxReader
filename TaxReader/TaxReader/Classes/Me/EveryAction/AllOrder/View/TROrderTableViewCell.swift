//
//  TROrderTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/6/5.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TROrderTableViewCellDelegate: NSObjectProtocol {
    func cellInvoiceButtonDidSelected(button: UIButton, cell:TROrderTableViewCell)
    func cellCodeButtonDidSelected(button: UIButton, cell:TROrderTableViewCell)
}

class TROrderTableViewCell: UITableViewCell {
    
    weak var delegate: TROrderTableViewCellDelegate?
    
    private lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
            
    lazy var trLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        imageView.kf.setImage(with: URL(string: "http://app.ctax.org.cn/uploadfiles/magazines/b09fd794-62b6-4ffe-8c37-6954f4596857.jpg"))
        
        return imageView
    }()
    
    lazy var trNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.blue
        label.text = "世界税收信息"
        
        return label
    }()
    
    lazy var invoiceButton:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.setTitleColor(UIColor.black, for: UIControl.State.normal)
        view.setTitle("查看发票", for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addTarget(self, action: #selector(invoiceButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func invoiceButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("invoiceButtonClick")))) != nil) {
            self.delegate?.cellInvoiceButtonDidSelected(button: button, cell: self)
        }
    }
    
    lazy var codeButton:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.backgroundColor = TRThemeColor
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.setTitle("复制激活码", for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.layer.cornerRadius = 14.0
        view.addTarget(self, action: #selector(codeButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func codeButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("codeButtonClick")))) != nil) {
            self.delegate?.cellCodeButtonDidSelected(button: button, cell: self)
        }
    }

    
    lazy var trTimeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        label.text = "2020年 第2期 总第425期"
        
        return label
    }()
    
    lazy var trNumberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.black
        label.text = "1"
        label.textAlignment = .right
        
        return label
    }()
    
    lazy var trPriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.black
        label.text = "￥46.9"
        label.textAlignment = .right
        
        return label
    }()
    
    func setupLayout() {
        self.contentView.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trLeftImageView)
        self.trLeftImageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(self.trLeftImageView.snp.height).dividedBy(3.1 / 2)
        }
        
        self.trContentView.addSubview(self.trNameLabel)
        self.trNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trLeftImageView.snp.top).offset(12)
            make.left.equalTo(self.trLeftImageView.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        self.trContentView.addSubview(self.trTimeLabel)
        self.trTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.trNameLabel.snp.leading)
        }
        
        self.trContentView.addSubview(self.trPriceLabel)
        self.trPriceLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(self.trLeftImageView.snp.bottom).offset(-2)
        }
        
        self.trContentView.addSubview(self.trNumberLabel)
        self.trNumberLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.trPriceLabel.snp.right)
            make.bottom.equalTo(self.trPriceLabel.snp.top).offset(-4)
        }
        
        self.trContentView.addSubview(self.invoiceButton)
        self.invoiceButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.trNameLabel.snp.top).offset(-4)
            make.right.equalTo(-15)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        self.trContentView.addSubview(self.codeButton)
        self.codeButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.invoiceButton.snp.bottom).offset(2)
            make.right.equalTo(-15)
            make.width.equalTo(100)
            make.height.equalTo(28)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var detailModel: TROrderFindDataDetailModel? {
        didSet {
            guard let model = detailModel else {
                return
            }
            self.trLeftImageView.sd_setImage(with: URL(string: "\(appIp)\(model.Product?.ProdImg ?? "")"),
                                        placeholderImage: UIImage.init(named: "DefaultS"),
                                        options: .allowInvalidSSLCertificates,
                                        context: nil)
            self.trNameLabel.text = model.Product?.ProdName
            self.trTimeLabel.text = model.PubProductName
            self.trNumberLabel.text = "\(model.OrderDetailCount)"
            self.trPriceLabel.text = "￥\(model.PubProductPrice)"
        }
    }

    
    var dataModel: TROrderFindDataModel? {
        didSet {
            guard let model = dataModel else {
                return
            }
            
            self.invoiceButton.isHidden = model.OrderStatus == 1 ? true : false
            self.codeButton.isHidden = model.OrderStatus == 1 ? true : false
        }
    }
    
    
    
    
    var findDetailDataDetailModel: TROrderFindDetailDataOrderDetailModel? {
        didSet {
            guard let model = findDetailDataDetailModel else {
                return
            }
            self.trLeftImageView.sd_setImage(with: URL(string: "\(appIp)\(model.Product?.ProdImg ?? "")"),
                                        placeholderImage: UIImage.init(named: "DefaultS"),
                                        options: .allowInvalidSSLCertificates,
                                        context: nil)
            self.trNameLabel.text = model.Product?.ProdName
            self.trTimeLabel.text = model.PubProductName
            //self.trNumberLabel.text = "\(model.OrderDetailCount)"
            //self.trPriceLabel.text = "￥\(model.PubProductPrice)"
        }
    }

    
    var findDetailDataModel: TROrderFindDetailDataModel? {
        didSet {
            guard let model = findDetailDataModel else {
                return
            }
            
            self.invoiceButton.isHidden = model.OrderStatus == 1 ? true : false
            self.codeButton.isHidden = model.OrderStatus == 1 ? true : false
        }
    }

}
