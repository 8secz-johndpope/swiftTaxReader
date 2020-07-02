//
//  TROrderFooterView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/5.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TROrderFooterViewDelegate: NSObjectProtocol {
    func viewCancelOrderButtonDidSelected(button: UIButton, view:TROrderFooterView)
    func viewPayButtonDidSelected(button: UIButton, view:TROrderFooterView)
}

class TROrderFooterView: UITableViewHeaderFooterView {
    
    weak var delegate: TROrderFooterViewDelegate?
    
    private lazy var trContentView: UIView = {
        let view = UIView.init()
        
        return view
    }()

    lazy var trTotalPriceLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 16.0)
        view.text = "订单总金额：46.9元"
        view.textAlignment = .right
        
        return view
    }()
    
    lazy var trActionView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
        
    var trPayButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.red
        button.setTitle("立即支付", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 14.0
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(payButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func payButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("payButtonClick")))) != nil) {
            self.delegate?.viewPayButtonDidSelected(button: button, view: self)
        }
    }
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trTotalPriceLabel)
        self.trTotalPriceLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(30)
        }
        
        // 未支付 取消订单 立即支付
        self.trContentView.addSubview(self.trActionView)
        self.trActionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTotalPriceLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(36)
        }
        
        self.trActionView.addSubview(self.trPayButton)
        self.trPayButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-4)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(28)
        }
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isHasActionPayView: Bool? {
        didSet {
            guard let isHasActionPayView = isHasActionPayView else {
                return
            }
            
            if !isHasActionPayView {
                self.trActionView.isHidden = true
                self.trActionView.snp.updateConstraints { (make) in
                    make.height.equalTo(0)
                }
            }else {
                self.trActionView.isHidden = false
                self.trActionView.snp.updateConstraints { (make) in
                    make.height.equalTo(36)
                }
            }
        }
    }
    
    
    var detailModelArray: [TROrderFindDataDetailModel]? {
         didSet {
             guard let modelArray = detailModelArray else {
                 return
             }
             
            var priceTotal: Double = 0.00
            for model: TROrderFindDataDetailModel in modelArray {
                priceTotal = priceTotal + (model.PubProductPrice * Double(model.OrderDetailCount))
            }
            
            
            let att:NSAttributedString = NSAttributedString(string: "订单总金额：",
                                                            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black,
                                                                         NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
            let att1:NSAttributedString = NSAttributedString(string: String.init(format: "%.2f元", priceTotal),
                                                             attributes: [NSAttributedString.Key.foregroundColor : UIColor.red,
                                                                          NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
            let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
            attributedStrM.append(att)
            attributedStrM.append(att1)
            self.trTotalPriceLabel.attributedText = attributedStrM

         }
     }
}
