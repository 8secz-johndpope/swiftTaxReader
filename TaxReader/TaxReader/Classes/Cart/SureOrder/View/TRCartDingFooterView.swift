//
//  TRCartDingFooterView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRCartDingFooterViewButtonClickBlock = (_ button: UIButton) ->Void

class TRCartDingFooterView: UIView {
    
    var footerButtonClickBlock: TRCartDingFooterViewButtonClickBlock?
        
    // 全选
    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
        
    // 结算
    lazy var trTotalBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTotalPriceButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.red
        button.setTitle("提交订单", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20.0
        button.addTarget(self, action: #selector(totalPriceButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func totalPriceButtonClick(button:UIButton) {
        guard let footerButtonClickBlock = footerButtonClickBlock else { return }
        footerButtonClickBlock(button)
    }
    
    private lazy var trTotalPriceLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.text = "总计：￥1100"
        label.textColor = UIColor.red
        
        return label
    }()
    
    private lazy var trTotalNumberLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "共1件"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        
        return label
    }()
    
    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0.5, left: 0, bottom: 0, right: 0))
        }
        
        // 结算功能
        self.addSubview(self.trTotalBackView)
        self.trTotalBackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.bottom.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        
        self.trTotalBackView.addSubview(self.trTotalPriceButton)
        self.trTotalPriceButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(120)
        }
        
        self.trTotalBackView.addSubview(self.trTotalPriceLabel)
        self.trTotalPriceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.trTotalPriceButton.snp.left).offset(-12)
            make.centerY.equalToSuperview()
        }
        
        self.trTotalBackView.addSubview(self.trTotalNumberLabel)
        self.trTotalNumberLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.trTotalPriceLabel.snp.left).offset(-8)
            make.centerY.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        self.backgroundColor = UIColor.lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var totolNumberText: String? {
        didSet {
            guard let totolNumberText = totolNumberText else {
                return
            }
            
            self.trTotalNumberLabel.text = "共\(totolNumberText)件"
        }
    }
    
    var totolPrice: Float? {
        didSet {
            guard let totolPrice = totolPrice else {
                return
            }
            
            let att:NSAttributedString = NSAttributedString(string: "合计：", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
            let ss:String = String.init(format: "￥%.2f", totolPrice)
            let att1:NSAttributedString = NSAttributedString(string: ss, attributes: [NSAttributedString.Key.foregroundColor  : UIColor.red, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
            //定义富文本即有格式的字符串
            let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
            attributedStrM.append(att)
            attributedStrM.append(att1)
            self.trTotalPriceLabel.attributedText = attributedStrM
        }
    }

    
    
}
