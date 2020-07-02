//
//  TRAddressNameSwitchTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
typealias TRAddressNameSwitchTableViewCellSwitchIsChanged = (_ sender: UISwitch) ->Void

class TRAddressNameSwitchTableViewCell: UITableViewCell {
    
    var switchIsChanged : TRAddressNameSwitchTableViewCellSwitchIsChanged?
    
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
    
    lazy var trSwitct: UISwitch = {
        let trswitch = UISwitch.init()
        trswitch.backgroundColor = UIColor.white
        trswitch.onTintColor = UIColor.red
        trswitch.addTarget(self, action: #selector(switchIsChanged(sender:)), for: .valueChanged)
            
        return trswitch
    }()
        
    @objc func switchIsChanged(sender:UISwitch) {
        guard let switchIsChanged = switchIsChanged else { return }
        switchIsChanged(sender)
    }

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
        
        self.addSubview(self.trSwitct)
        self.trSwitct.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
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
            if (model.title != nil) {
                let labelWidth = getLabelWidth(for: model.title)
                self.trNameLabel.snp.updateConstraints { (make) in
                    make.width.equalTo(labelWidth)
                }
            }
            self.trSwitct.isOn = model.isSwitchOn ?? true
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
        print("文字宽度 - \(width)")
        return width
    }

}
