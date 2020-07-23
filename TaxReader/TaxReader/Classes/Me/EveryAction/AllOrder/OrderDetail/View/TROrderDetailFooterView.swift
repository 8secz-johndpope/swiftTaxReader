//
//  TROrderDetailFooterView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import UIKit

protocol TROrderDetailFooterViewDelegate: NSObjectProtocol {
    func viewCancelOrderButtonDidSelected(button: UIButton, view:TROrderDetailFooterView)
    func viewPayButtonDidSelected(button: UIButton, view:TROrderDetailFooterView)
    func viewInvoiceButtonDidSelected(button: UIButton, view:TROrderDetailFooterView)
}

class TROrderDetailFooterView: UITableViewHeaderFooterView {
    
    weak var delegate: TROrderDetailFooterViewDelegate?
    
    private lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
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
    
    lazy var trActionPayView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
        
    lazy var trPayButton:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.backgroundColor = UIColor.red
        view.setTitle("立即支付", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        view.setTitleColor(UIColor.white, for: .normal)
        view.layer.cornerRadius = 14.0
        view.layer.borderColor = UIColor.red.cgColor
        view.addTarget(self, action: #selector(payButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func payButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("payButtonClick")))) != nil) {
            self.delegate?.viewPayButtonDidSelected(button: button, view: self)
        }
    }
    
    lazy var trActionInvoiceView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
        
    lazy var trInvoiceButton:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.backgroundColor = UIColor.red
        view.setTitle("补开发票", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        view.setTitleColor(UIColor.white, for: .normal)
        view.layer.cornerRadius = 14.0
        view.layer.borderColor = UIColor.red.cgColor
        view.addTarget(self, action: #selector(invoiceButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func invoiceButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("invoiceButtonClick")))) != nil) {
            self.delegate?.viewInvoiceButtonDidSelected(button: button, view: self)
        }
    }
    
    private lazy var trBottomLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    // 订单信息
    private lazy var trOrderMsgContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private lazy var trOrderMsgBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTipOrderMsgLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 16.0)
        view.text = "订单信息"
        
        return view
    }()
    
    lazy var trOrderNumberLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 15.0)
        view.text = "订单编号："
        
        return view
    }()

    lazy var trCreateTimeLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 15.0)
        view.text = "订单时间："
        
        return view
    }()

    lazy var trPayTimeLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 15.0)
        view.text = "付款编号："
        
        return view
    }()
    
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
        
        // 未支付状态下显示立即支付按钮 状态 == 1 其他不显示
        self.trContentView.addSubview(self.trActionPayView)
        self.trActionPayView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTotalPriceLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(35.5)
        }
        
        self.trActionPayView.addSubview(self.trPayButton)
        self.trPayButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-4)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(28)
        }
        
        // 补开发票状态下显示立即补开发票按钮 状态 == 10 其他不显示
        self.trContentView.addSubview(self.trActionInvoiceView)
        self.trActionInvoiceView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trActionPayView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(35.5)
        }
        
        self.trActionInvoiceView.addSubview(self.trInvoiceButton)
        self.trInvoiceButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-4)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(28)
        }
        
        self.trContentView.addSubview(self.trBottomLineView)
        self.trBottomLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trActionInvoiceView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        // 订单信息
        self.trContentView.addSubview(self.trOrderMsgContentView)
        self.trOrderMsgContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trBottomLineView.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
        
        self.trOrderMsgContentView.addSubview(self.trOrderMsgBackView)
        self.trOrderMsgBackView.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        self.trOrderMsgBackView.addSubview(self.trTipOrderMsgLabel)
        self.trTipOrderMsgLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.trOrderMsgBackView.addSubview(self.trOrderNumberLabel)
        self.trOrderNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTipOrderMsgLabel.snp.bottom).offset(1)
            make.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.trOrderMsgBackView.addSubview(self.trCreateTimeLabel)
        self.trCreateTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trOrderNumberLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.trOrderNumberLabel.snp.height)
        }

        self.trOrderMsgBackView.addSubview(self.trPayTimeLabel)
        self.trPayTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trCreateTimeLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.trOrderNumberLabel.snp.height)
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
                self.trActionPayView.isHidden = true
                self.trActionPayView.snp.updateConstraints { (make) in
                    make.height.equalTo(0)
                }
            }else {
                self.trActionPayView.isHidden = false
                self.trActionPayView.snp.updateConstraints { (make) in
                    make.height.equalTo(35.5)
                }
            }
        }
    }
    
    var isHasActionInvoiceView: Bool? {
        didSet {
            guard let isHasActionInvoiceView = isHasActionInvoiceView else {
                return
            }
            
            if !isHasActionInvoiceView {
                self.trActionInvoiceView.isHidden = true
                self.trActionInvoiceView.snp.updateConstraints { (make) in
                    make.height.equalTo(0)
                }
            }else {
                self.trActionInvoiceView.isHidden = false
                self.trActionInvoiceView.snp.updateConstraints { (make) in
                    make.height.equalTo(35.5)
                }
            }
        }
    }
    
    var findDetailDataModel: TROrderFindDetailDataModel?{
        didSet {
            guard let model = findDetailDataModel else {
                return
            }
            
            self.trTipOrderMsgLabel.text = "订单信息"
            self.trOrderNumberLabel.text = "订单编号：\(model.OrderSerialCode)"
            self.trCreateTimeLabel.text = "创建时间：\(model.OrderDate ?? "")"
            self.trPayTimeLabel.text = "付款时间：\(model.OrderIsInvoiceDueDate ?? "")"
        }
    }
    
    var findDetailDataDetailModelArray: [TROrderFindDetailDataOrderDetailModel]? {
         didSet {
             guard let modelArray = findDetailDataDetailModelArray else {
                 return
             }
             
            var priceTotal: Double = 0.00
            for model: TROrderFindDetailDataOrderDetailModel in modelArray {
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
