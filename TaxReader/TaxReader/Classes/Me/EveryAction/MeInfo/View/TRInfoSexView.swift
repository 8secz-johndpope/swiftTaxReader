//
//  TRInfoSexView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRInfoSexViewButtonClick = (_ button: UIButton) ->Void

class TRInfoSexView: UIView {
    
    var footerButtonClick : TRInfoSexViewButtonClick?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
    
    lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var underLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var trTipLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "性别："
        view.font = UIFont.systemFont(ofSize: 20.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var trRadioView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var footerButton1:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("男", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
                
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage.init(named: "单选未选中"), for: .normal)
        
        button.tag = 1
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
            
    lazy var footerButton2:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("女", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage.init(named: "单选未选中"), for: .normal)
        
        button.tag = 2
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var footerButton3:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("保密", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage.init(named: "单选未选中"), for: .normal)
        
        button.tag = 3
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick(button:UIButton) {
        switch button.tag {
        case 1:
            self.footerButton1.setTitleColor(TRThemeColor, for: .normal)
            self.footerButton1.setImage(UIImage.init(named: "单选选中"), for: .normal)
            self.footerButton2.setTitleColor(UIColor.black, for: .normal)
            self.footerButton2.setImage(UIImage.init(named: "单选未选中"), for: .normal)
            self.footerButton3.setTitleColor(UIColor.black, for: .normal)
            self.footerButton3.setImage(UIImage.init(named: "单选未选中"), for: .normal)
        case 2:
            self.footerButton2.setTitleColor(TRThemeColor, for: .normal)
            self.footerButton2.setImage(UIImage.init(named: "单选选中"), for: .normal)
            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton1.setImage(UIImage.init(named: "单选未选中"), for: .normal)
            self.footerButton3.setTitleColor(UIColor.black, for: .normal)
            self.footerButton3.setImage(UIImage.init(named: "单选未选中"), for: .normal)
        case 3:
            self.footerButton3.setTitleColor(TRThemeColor, for: .normal)
            self.footerButton3.setImage(UIImage.init(named: "单选选中"), for: .normal)
            self.footerButton2.setTitleColor(UIColor.black, for: .normal)
            self.footerButton2.setImage(UIImage.init(named: "单选未选中"), for: .normal)
            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton1.setImage(UIImage.init(named: "单选未选中"), for: .normal)
        default:
            print("\(button.tag)")
        }
        
        
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
        
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight - 1)
        }
        
        self.backView.addSubview(self.trTipLabel)
        self.trTipLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(30)
        }
        
        self.backView.addSubview(self.trRadioView)
        self.trRadioView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.left.equalTo(self.trTipLabel.snp.right)
        }
        
        self.contentView.addSubview(self.underLineView)
        self.underLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.trRadioView.addSubview(self.footerButton1)
        self.footerButton1.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.width.equalTo(50)
            make.height.equalTo(32)
        }
        
        self.trRadioView.addSubview(self.footerButton2)
        self.footerButton2.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.footerButton1.snp.right).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(32)
        }
        
        self.trRadioView.addSubview(self.footerButton3)
        self.footerButton3.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.footerButton2.snp.right).offset(10)
            make.width.equalTo(80)
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
    
    var userGender: Int? {
        didSet {
            guard let userGender = userGender else {
                return
            }
            
            switch userGender {
            case 1:
                self.footerButton1.setTitleColor(TRThemeColor, for: .normal)
                self.footerButton1.setImage(UIImage.init(named: "单选选中"), for: .normal)
            case 2:
                self.footerButton2.setTitleColor(TRThemeColor, for: .normal)
                self.footerButton2.setImage(UIImage.init(named: "单选选中"), for: .normal)
            case 3:
                self.footerButton3.setTitleColor(TRThemeColor, for: .normal)
                self.footerButton3.setImage(UIImage.init(named: "单选选中"), for: .normal)
            default:
                print("\(userGender)")
            }
        }
    }
    
}
