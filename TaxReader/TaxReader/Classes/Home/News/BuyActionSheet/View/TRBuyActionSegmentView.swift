//
//  TRBuyActionSegmentView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRBuyActionSegmentViewBlock = (_ button: UIButton) ->Void

class TRBuyActionSegmentView: UIView {
    
    var footerButtonClickBlock: TRBuyActionSegmentViewBlock?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var footerButton0:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = TRThemeColor
        button.setTitle("本篇", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.tag = 0
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var footerButton1:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = LXTableViewBackgroundColor
        button.setTitle("本期", for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.tag = 1
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
            
    lazy var footerButton2:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = LXTableViewBackgroundColor
        button.setTitle("单期", for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.tag = 2
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
        
    lazy var footerButton3:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = LXTableViewBackgroundColor
        button.setTitle("全年", for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        button.tag = 3
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick(button:UIButton) {
        switch button.tag {
        case 0:
            self.footerButton0.backgroundColor = TRThemeColor
            self.footerButton1.backgroundColor = LXTableViewBackgroundColor
            self.footerButton2.backgroundColor = LXTableViewBackgroundColor
            self.footerButton3.backgroundColor = LXTableViewBackgroundColor
            
            self.footerButton0.setTitleColor(UIColor.white, for: .normal)
            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton2.setTitleColor(UIColor.black, for: .normal)
            self.footerButton3.setTitleColor(UIColor.black, for: .normal)
        case 1:
            self.footerButton1.backgroundColor = TRThemeColor
            self.footerButton0.backgroundColor = LXTableViewBackgroundColor
            self.footerButton2.backgroundColor = LXTableViewBackgroundColor
            self.footerButton3.backgroundColor = LXTableViewBackgroundColor
            
            self.footerButton1.setTitleColor(UIColor.white, for: .normal)
            self.footerButton0.setTitleColor(UIColor.black, for: .normal)
            self.footerButton2.setTitleColor(UIColor.black, for: .normal)
            self.footerButton3.setTitleColor(UIColor.black, for: .normal)
        case 2:
            self.footerButton2.backgroundColor = TRThemeColor
            self.footerButton0.backgroundColor = LXTableViewBackgroundColor
            self.footerButton1.backgroundColor = LXTableViewBackgroundColor
            self.footerButton3.backgroundColor = LXTableViewBackgroundColor
            
            self.footerButton2.setTitleColor(UIColor.white, for: .normal)
            self.footerButton0.setTitleColor(UIColor.black, for: .normal)
            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton3.setTitleColor(UIColor.black, for: .normal)
        case 3:
            self.footerButton3.backgroundColor = TRThemeColor
            self.footerButton0.backgroundColor = LXTableViewBackgroundColor
            self.footerButton1.backgroundColor = LXTableViewBackgroundColor
            self.footerButton2.backgroundColor = LXTableViewBackgroundColor
            
            self.footerButton3.setTitleColor(UIColor.white, for: .normal)
            self.footerButton0.setTitleColor(UIColor.black, for: .normal)
            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton2.setTitleColor(UIColor.black, for: .normal)
        default:
            self.footerButton0.backgroundColor = TRThemeColor
            self.footerButton1.backgroundColor = LXTableViewBackgroundColor
            self.footerButton2.backgroundColor = LXTableViewBackgroundColor
            self.footerButton3.backgroundColor = LXTableViewBackgroundColor
            
            self.footerButton0.setTitleColor(UIColor.white, for: .normal)
            self.footerButton1.setTitleColor(UIColor.black, for: .normal)
            self.footerButton2.setTitleColor(UIColor.black, for: .normal)
            self.footerButton3.setTitleColor(UIColor.black, for: .normal)
        }
        
        guard let footerButtonClickBlock = footerButtonClickBlock else { return }
        footerButtonClickBlock(button)
    }
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.footerButton0)
        self.footerButton0.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(80)
        }
        
        self.contentView.addSubview(self.footerButton1)
        self.footerButton1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(self.footerButton0.snp.right).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(80)
        }
        
        self.contentView.addSubview(self.footerButton2)
        self.footerButton2.snp.makeConstraints { (make) in
            make.top.bottom.width.equalTo(self.footerButton1)
            make.left.equalTo(self.footerButton1.snp.right).offset(8)
        }
        
        self.contentView.addSubview(self.footerButton3)
        self.footerButton3.snp.makeConstraints { (make) in
            make.top.bottom.width.equalTo(self.footerButton1)
            make.left.equalTo(self.footerButton2.snp.right).offset(8)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isHasCurrentPian: Bool? {
        didSet {
            guard let isHasCurrentPian = isHasCurrentPian else {
                return
            }
            
            if !isHasCurrentPian {
                self.footerButton1.backgroundColor = TRThemeColor
                self.footerButton1.setTitleColor(UIColor.white, for: .normal)
                self.footerButton0.snp.updateConstraints { (make) in
                    make.width.equalTo(0)
                }
            }
        }
    }
    
}
