//
//  TRRegisterAgreementView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRRegisterAgreementViewAgreementLabelTap = (_ sender: UITapGestureRecognizer) ->Void

class TRRegisterAgreementView: UIView {
    
    var agreementLabelTap : TRRegisterAgreementViewAgreementLabelTap?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white

        return view
    }()
    
    lazy var agreementButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = UIColor.white
        view.setImage(UIImage.init(named: "LX单选未选中"), for: .normal)
        view.setImage(UIImage.init(named: "LX单选选中"), for: .selected)
        view.addTarget(self, action: #selector(agreementButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    lazy var agreementLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "中国税务杂志社内刊平台注册协议"
        view.textColor = UIColor.black
        
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(agreementLabelTap(sender:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    @objc func agreementButtonClick(button:UIButton) {
        button.isSelected = !button.isSelected
        self.agreementLabel.textColor = button.isSelected ? TRControlColor : UIColor.black
    }
    
    @objc func agreementLabelTap(sender: UITapGestureRecognizer) {
        guard let agreementLabelTap = agreementLabelTap else { return }
        agreementLabelTap(sender)
    }
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: 0, right: itemMargin))
        }
        
        self.contentView.addSubview(self.agreementButton)
        self.agreementButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
        }
        
        self.contentView.addSubview(self.agreementLabel)
        self.agreementLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.agreementButton.snp.right).offset(4)
            make.centerY.equalTo(self.agreementButton.snp.centerY)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
