//
//  TRBuyActionContentPianView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/30.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRBuyActionContentPianView: UIView {
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTitleLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 16.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var trDetailTitleLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 15.0)
        view.textColor = UIColor.black
        
        return view
    }()
    
    lazy var trPriceLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor = UIColor.red
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.bottom.equalTo(self.trContentView.snp.centerY)
            make.height.equalTo(30)
        }
        
        self.trContentView.addSubview(self.trDetailTitleLabel)
        self.trDetailTitleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(self.trContentView.snp.centerY)
            make.height.equalTo(30)
        }
        
        self.trContentView.addSubview(self.trPriceLabel)
        self.trPriceLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-12)
            make.top.equalTo(self.trContentView.snp.centerY)
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
    
    var productIssueNumberModel: TRProductGetIssueNumberDataModel? {
        didSet {
            guard let model = productIssueNumberModel else {
                return
            }
            
            self.trTitleLabel.text = model.ArticleTitle
            self.trDetailTitleLabel.text = "\(model.PubIssueYear ?? "")年第\(model.ProdIssue)期"
            self.trPriceLabel.text = "￥ \(model.ArticleIOSPrice ?? "")"
        }
    }
    
}
