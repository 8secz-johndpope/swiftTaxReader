//
//  TRAddressNameTFTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/16.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRAddressNameTFTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trRequiredLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "*"
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var trNameLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.text = "收货人："
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        
        return label
    }()
    
    lazy var trContentTF: UITextField = {
        let textField = UITextField.init()
        textField.backgroundColor = UIColor.white
        textField.delegate = self
        textField.returnKeyType = .done
        
        return textField
    }()
            
    func setupLayout() {
        self.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0))
        }
        
        self.addSubview(self.trRequiredLabel)
        self.trRequiredLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
        
        self.addSubview(self.trNameLabel)
        self.trNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trRequiredLabel.snp.right).offset(4)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(44)
        }
        
        self.addSubview(self.trContentTF)
        self.trContentTF.snp.makeConstraints { (make) in
            make.left.equalTo(self.trNameLabel.snp.right)
            make.centerY.equalTo(self.trNameLabel.snp.centerY)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(44)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.lightGray
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var exampleModel:TRAddressExample? {
        didSet {
            guard let model = exampleModel else {return}
            self.trRequiredLabel.isHidden = !(model.isRequired ?? true)
            self.trNameLabel.text = model.title
            self.trContentTF.text = model.textFieldValue
            if (model.title != nil) {
                let labelWidth = getLabelWidth(for: model.title)
                self.trNameLabel.snp.updateConstraints { (make) in
                    make.width.equalTo(labelWidth)
                }
            }
        }
    }
    
    // 计算文字的宽度
    func getLabelWidth(for text: String?) -> CGFloat {
        var width: CGFloat = 0
        guard let text = text else { return width }
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = text
        width += label.sizeThatFits(CGSize(width: CGFloat.infinity, height: 44)).width
        
        return width
    }

}

extension TRAddressNameTFTableViewCell:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
