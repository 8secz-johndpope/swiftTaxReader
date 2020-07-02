//
//  TRLoginSideView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRLoginSideView: UIView {
    
    lazy var qqBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white

        return view
    }()
    
    lazy var qqButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setBackgroundImage(UIImage.init(named: "QQ"), for: .normal)

        return view
    }()
    
    lazy var leftLineView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.lightGray

        return view
    }()
    
    lazy var wxBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white

        return view
    }()
    
    lazy var wxButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setBackgroundImage(UIImage.init(named: "微信"), for: .normal)

        return view
    }()

    lazy var wbBackView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white

        return view
    }()
    
    lazy var wbButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setBackgroundImage(UIImage.init(named: "微博"), for: .normal)

        return view
    }()

    lazy var rightLineView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.lightGray

        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.qqBackView)
        self.qqBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(2)
            make.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
        }
        
        self.qqBackView.addSubview(self.qqButton)
        self.qqButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(60*scaleHeightSE2nd)
        }
        
        self.addSubview(self.leftLineView)
        self.leftLineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2.9)
            make.height.equalTo(2)
        }
        
        self.addSubview(self.wxBackView)
        self.wxBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview()
            make.left.equalTo(self.qqBackView.snp.right)
            make.width.equalTo(self.qqBackView.snp.width)
        }
        
        self.wxBackView.addSubview(self.wxButton)
        self.wxButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(60*scaleHeightSE2nd)
        }
        
        self.addSubview(self.wbBackView)
        self.wbBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview()
            make.left.equalTo(self.wxBackView.snp.right)
            make.width.equalTo(self.wxBackView.snp.width)
        }
        
        self.wbBackView.addSubview(self.wbButton)
        self.wbButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(60*scaleHeightSE2nd)
        }
        
        self.addSubview(self.rightLineView)
        self.rightLineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2.9)
            make.height.equalTo(2)
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
