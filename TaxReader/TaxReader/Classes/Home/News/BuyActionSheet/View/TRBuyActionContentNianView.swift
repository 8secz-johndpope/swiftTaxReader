//
//  TRBuyActionContentNianView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRBuyActionContentNianViewBlock = (_ button: UIButton) ->Void

class TRBuyActionContentNianView: UIView {
    
    var buttonClickBlock: TRBuyActionContentNianViewBlock?
    
    var nianModel: TRProductGetIssueNumberDataYearModel?
    
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.red
        
        return view
    }()
    
    lazy var trBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trYearNumberLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.text = "2020年  全年"
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 15.0)
        
        return view
    }()
    
    // 数量加减
    lazy var trNumberBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.orange
        
        return view
    }()
    
    lazy var trNumberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        label.text = "1"
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var trNumberReduceButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("-", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.tag = 1
        button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var trNumberAddButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.tag = 2
        button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func buttonClick(button:UIButton) {
//        guard let buttonClickBlock = buttonClickBlock else { return }
//        buttonClickBlock(button)
        
        if button.tag == 1 {
            self.buttonClickReduceNumber(button: button)
        }
        
        if button.tag == 2 {
           self.buttonClickAddNumber(button: button)
        }
    }
    
    lazy var trPriceLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.text = "￥ 0.03"
        view.textColor = UIColor.red
        view.font = UIFont.systemFont(ofSize: 16.0)
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(76)
        }
        
        self.trBackView.addSubview(self.trYearNumberLabel)
        self.trYearNumberLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(32)
        }
        
        self.trBackView.addSubview(self.trNumberBackView)
        self.trNumberBackView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(32)
        }
        
        self.trNumberBackView.addSubview(self.trNumberLabel)
        self.trNumberLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview()
        }
        
        self.trNumberBackView.addSubview(self.trNumberReduceButton)
        self.trNumberReduceButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(self.trNumberLabel.snp.left)
        }
        
        self.trNumberBackView.addSubview(self.trNumberAddButton)
        self.trNumberAddButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(self.trNumberLabel.snp.right)
        }
        
        self.trBackView.addSubview(self.trPriceLabel)
        self.trPriceLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var yearModel: TRProductGetIssueNumberDataYearModel? {
        didSet {
            guard let model = yearModel else {
                return
            }
            
            self.nianModel = model
            
            self.trYearNumberLabel.text = "\(model.ProdYear)年 全年"
            
            let number = (self.trNumberLabel.text! as NSString).doubleValue
            self.trPriceLabel.text = "￥ \(model.ProdIOSPrice * number)"
        }
    }
}

extension TRBuyActionContentNianView {
    func buttonClickReduceNumber(button: UIButton) {
        let number = (self.trNumberLabel.text! as NSString).intValue
        let changeNumber = number - 1
        if changeNumber == 0 {
            return
        }
        
        self.trNumberLabel.text = "\(changeNumber)"
        
        let currentNumber = (self.trNumberLabel.text! as NSString).doubleValue
        self.trPriceLabel.text = "￥ \(self.nianModel!.ProdIOSPrice * currentNumber)"
    }
    
    func buttonClickAddNumber(button: UIButton) {
        let number = (self.trNumberLabel.text! as NSString).intValue
        let changeNumber = number + 1
        self.trNumberLabel.text = "\(changeNumber)"
        
        let currentNumber = (self.trNumberLabel.text! as NSString).doubleValue
        self.trPriceLabel.text = "￥ \(self.nianModel!.ProdIOSPrice * currentNumber)"
    }
}

