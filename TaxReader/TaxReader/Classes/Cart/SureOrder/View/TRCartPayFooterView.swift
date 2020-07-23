//
//  TRCartPayFooterView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRCartPayFooterViewTapBlock = (_ isPayType: Bool, _ isTicketType: Bool) ->Void

class TRCartPayFooterView: UITableViewHeaderFooterView {
    
    var itemCoverViewTapBlock : TRCartPayFooterViewTapBlock?

    private lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var payTypeView: TRCartpayItemView = {
        let view = TRCartpayItemView.init()
        view.trTitleText = "支付方式"
        view.trDetailTitleText = "支付宝支付"
        view.coverViewTap = {[weak self](sender: UITapGestureRecognizer) in
            guard let itemCoverViewTapBlock = self?.itemCoverViewTapBlock else { return }
            itemCoverViewTapBlock(true, false)
        }
        
        return view
    }()
    
    lazy var ticketTypeView: TRCartpayItemView = {
        let view = TRCartpayItemView.init()
        view.trTitleText = "开票信息"
        view.trDetailTitleText = "个人发票"
        view.coverViewTap = {[weak self](sender: UITapGestureRecognizer) in
            view.coverViewTap = {[weak self](sender: UITapGestureRecognizer) in
                guard let itemCoverViewTapBlock = self?.itemCoverViewTapBlock else { return }
                itemCoverViewTapBlock(false, true)
            }
        }
        
        return view
    }()

    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(88)
        }
        
        self.addSubview(self.payTypeView)
        self.payTypeView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }

        self.addSubview(self.ticketTypeView)
        self.ticketTypeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.payTypeView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isHasTicketTypeView: Bool? {
        didSet {
            guard let isHasTicketTypeView = isHasTicketTypeView else {
                return
            }
            
            self.ticketTypeView.isHidden = !isHasTicketTypeView
        }
    }
}
