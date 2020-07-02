//
//  TRRegisterAreaView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/7.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRRegisterAreaViewTapBlock = (_ viewSelf: TRRegisterAreaView) ->Void

class TRRegisterAreaView: UIView {
    
    var registerAreaViewTap : TRRegisterAreaViewTapBlock?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 2.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
        
        return view
    }()
    
    lazy var arrowButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.backgroundColor = UIColor.white
        view.setTitleColor(UIColor.black, for: .normal)
        view.setImage(UIImage.init(named: "LX上箭头"), for: .normal)
        view.setImage(UIImage.init(named: "LX下箭头"), for: .selected)
        view.imageView?.backgroundColor = UIColor.white
        view.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 0)
        //view.addTarget(self, action: #selector(arrowButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
//    @objc func arrowButtonClick(button:UIButton) {
//        button.isSelected = !button.isSelected
//    }
    
    lazy var bgViewForTextfield: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var textField: UITextField = {
        let view = UITextField.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.placeholder = "请选择地区"
        
        return view
    }()
    
    lazy var coverView: UIView = {
        let view = UIView.init()
        
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(areaViewTap(sender:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    @objc func areaViewTap(sender: UITapGestureRecognizer) {
        self.arrowButton.isSelected = !self.arrowButton.isSelected
        guard let registerAreaViewTap = registerAreaViewTap else { return }
        registerAreaViewTap(self)
    }
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: itemMargin, left: itemMargin, bottom: 0, right: itemMargin))
        }
        
        self.contentView.addSubview(self.arrowButton)
        self.arrowButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(64)
        }
        
        self.contentView.addSubview(self.bgViewForTextfield)
        self.bgViewForTextfield.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(self.arrowButton.snp.left).offset(8)
        }
        
        self.bgViewForTextfield.addSubview(self.textField)
        self.textField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(12)
            make.top.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.coverView)
        self.coverView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
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
