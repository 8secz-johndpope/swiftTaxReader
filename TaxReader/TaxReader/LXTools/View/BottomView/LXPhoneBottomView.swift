//
//  LXPhoneBottomView.swift
//  TaxReader
//
//  Created by asdc on 2020/7/15.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

let LXScreenButtonMargin = 12
let LXScreenWidthDiv4 = (Int(LXScreenWidth) - 5 * LXScreenButtonMargin) / 4

typealias LXPhoneBottomViewButtonActionBlock = (_ button: UIButton) ->Void

class LXPhoneBottomView: UIView {
    
    var buttomButtonClick: LXPhoneBottomViewButtonActionBlock?
    
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
        
    lazy var buttomButton2:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.backgroundColor = TRThemeColor
        view.setTitle("上一页", for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.tag = 2
        view.addTarget(self, action: #selector(bottomButtonClick(button:)), for: .touchUpInside)
        view.layer.cornerRadius = 16.0
        
        return view
    }()
    
    lazy var buttomButton1:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.setTitle("首页", for: UIControl.State.normal)
        view.setTitleColor(TRThemeColor, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.tag = 1
        view.addTarget(self, action: #selector(bottomButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    lazy var buttomButton4:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.setTitle("尾页", for: UIControl.State.normal)
        view.setTitleColor(TRThemeColor, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.tag = 4
        view.addTarget(self, action: #selector(bottomButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()

    lazy var buttomButton3:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.backgroundColor = TRThemeColor
        view.setTitle("下一页", for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.tag = 3
        view.addTarget(self, action: #selector(bottomButtonClick(button:)), for: .touchUpInside)
        view.layer.cornerRadius = 16.0
        
        return view
    }()
    
    @objc func bottomButtonClick(button:UIButton) {
        guard let buttomButtonClick = buttomButtonClick else { return }
        buttomButtonClick(button)
    }
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trBackgroundView)
        self.trBackgroundView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-LXPhoneLHBarHeight)
        }
        
        self.trBackgroundView.addSubview(self.buttomButton2)
        self.buttomButton2.snp.makeConstraints{ (make) in
            make.centerY.equalToSuperview()
            make.height.equalTo(32)
            make.left.equalTo(LXScreenButtonMargin)
            make.width.equalTo(LXScreenWidthDiv4)
        }
        
        self.trBackgroundView.addSubview(self.buttomButton1)
        self.buttomButton1.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.buttomButton2.snp.centerY)
            make.height.equalTo(self.buttomButton2.snp.height)
            make.left.equalTo(self.buttomButton2.snp.right).offset(LXScreenButtonMargin)
            make.width.equalTo(self.buttomButton2.snp.width)
        }
        
        self.trBackgroundView.addSubview(self.buttomButton4)
        self.buttomButton4.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.buttomButton2.snp.centerY)
            make.height.equalTo(self.buttomButton2.snp.height)
            make.left.equalTo(self.buttomButton1.snp.right).offset(LXScreenButtonMargin)
            make.width.equalTo(self.buttomButton2.snp.width)
        }
        
        self.trBackgroundView.addSubview(self.buttomButton3)
        self.buttomButton3.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.buttomButton2.snp.centerY)
            make.height.equalTo(self.buttomButton2.snp.height)
            make.left.equalTo(self.buttomButton4.snp.right).offset(LXScreenButtonMargin)
            make.width.equalTo(self.buttomButton2.snp.width)
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
