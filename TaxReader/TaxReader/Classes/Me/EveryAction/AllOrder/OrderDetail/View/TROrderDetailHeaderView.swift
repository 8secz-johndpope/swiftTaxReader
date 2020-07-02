//
//  TROrderDetailHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TROrderDetailHeaderView: UITableViewHeaderFooterView {
    
    lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.cyan
        
        return view
    }()
    
    lazy var trStatusContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
    
    private lazy var trOrderMsgBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
        
    lazy var trOrderStatusLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.text = "订单编号："
        
        return view
    }()

    lazy var trOrderStatusMsgLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.text = "订单时间："
        
        return view
    }()

    lazy var trOrderIssueLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.text = "付款编号："
        
        return view
    }()
    
    lazy var trAddressContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.orange
        
        return view
    }()
    
    lazy var dingAddressView: TRCartDingAddressView = {
        let view = TRCartDingAddressView.init(frame: .zero)
        view.isHasDefaultAddress = true
        
        return view
    }()
    
    lazy var trTitleContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
    
    lazy var trTitleBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.yellow
        
        return view
    }()
    
    lazy var trTitleTopLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var trTitleBackViewAction: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTitleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 18.0)
        
        return label
    }()
        
    lazy var trTitleBottomLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
        
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trStatusContentView)
        self.trStatusContentView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(90)
        }
        
        self.trStatusContentView.addSubview(self.trOrderMsgBackView)
        self.trOrderMsgBackView.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        self.trOrderMsgBackView.addSubview(self.trOrderStatusLabel)
        self.trOrderStatusLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.left.right.equalToSuperview()
            make.height.equalTo(25)
        }
        
        self.trOrderMsgBackView.addSubview(self.trOrderStatusMsgLabel)
        self.trOrderStatusMsgLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trOrderStatusLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.trOrderStatusLabel.snp.height)
        }

        self.trOrderMsgBackView.addSubview(self.trOrderIssueLabel)
        self.trOrderIssueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trOrderStatusMsgLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.trOrderStatusLabel.snp.height)
        }
        
        
        self.trContentView.addSubview(self.trAddressContentView)
        self.trAddressContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trStatusContentView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(104)
        }
        
        self.trAddressContentView.addSubview(self.dingAddressView)
        self.dingAddressView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        // 文字头
        self.trContentView.addSubview(self.trTitleContentView)
        self.trTitleContentView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.trTitleContentView.addSubview(self.trTitleBackView)
        self.trTitleBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.bottom.left.right.equalToSuperview()
        }
        
        self.trTitleBackView.addSubview(self.trTitleTopLineView)
        self.trTitleTopLineView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        self.trTitleBackView.addSubview(self.trTitleBottomLineView)
        self.trTitleBottomLineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }

        self.trTitleBackView.addSubview(self.trTitleBackViewAction)
        self.trTitleBackViewAction.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTitleTopLineView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.trTitleBottomLineView.snp.top)
        }
        
        self.trTitleBackView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleString: String? {
        didSet {
            guard let titleString = titleString else {
                return
            }
            
            self.trTitleLabel.text = titleString
        }
    }
    
    var findDetailDataModel: TROrderFindDetailDataModel?{
        didSet {
            guard let model = findDetailDataModel else {
                return
            }
            
            let orderStatusText = model.OrderStatus == 1 ? "待支付": "已完成"
            self.trOrderStatusLabel.text = "当前订单状态：交易\(orderStatusText)"
            self.trOrderStatusMsgLabel.text = "\(orderStatusText)"
            self.trOrderIssueLabel.text = "如果没有收到货，或收到货后出现问题，您可以联系客服"
            
            self.dingAddressView.findDetailOrderConsignee = model.OrderConsignee
        }
    }
}
