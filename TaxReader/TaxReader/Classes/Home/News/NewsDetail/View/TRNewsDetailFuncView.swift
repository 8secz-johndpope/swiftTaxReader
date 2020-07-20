//
//  TRNewsDetailFuncView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRNewsDetailFuncViewDelegate: NSObjectProtocol {
    func buttonReadDidSelected(button:UIButton)
    func buttonBuyDidSelected(button:UIButton)
    func buttonFavorDidSelected(button:UIButton)
    func buttonDownloadDidSelected(button:UIButton)
}

class TRNewsDetailFuncView: UIView {
    
    weak var delegate: TRNewsDetailFuncViewDelegate?
    
    private lazy var backgroundView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var button0: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitle("阅读", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.setTitleColor(TRThemeColor, for: .selected)
        button.setImage(UIImage.init(named: "期刊阅读01"), for: .normal)
        button.setImage(UIImage.init(named: "期刊阅读02"), for: .selected)
        button.addTarget(self, action: #selector(readButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func readButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("ButtonClick")))) != nil) {
            self.delegate?.buttonReadDidSelected(button: button)
        }
    }
    
    lazy var button1: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitle("订阅", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.setTitleColor(TRThemeColor, for: .selected)
        button.setImage(UIImage.init(named: "期刊订阅01"), for: .normal)
        button.setImage(UIImage.init(named: "期刊订阅02"), for: .selected)
        button.addTarget(self, action: #selector(subButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func subButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("ButtonClick")))) != nil) {
            self.delegate?.buttonBuyDidSelected(button: button)
        }
    }

    lazy var button2: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitle("收藏", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.setTitleColor(TRThemeColor, for: .selected)
        button.setImage(UIImage.init(named: "期刊收藏01"), for: .normal)
        button.setImage(UIImage.init(named: "期刊收藏02"), for: .selected)
        button.addTarget(self, action: #selector(collectButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func collectButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("ButtonClick")))) != nil) {
            self.delegate?.buttonFavorDidSelected(button: button)
        }
    }

    lazy var button3: UIButton = {
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.white
        button.setTitle("下载", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.setTitleColor(TRThemeColor, for: .selected)
        button.setImage(UIImage.init(named: "期刊下载01"), for: .normal)
        button.setImage(UIImage.init(named: "期刊下载02"), for: .selected)
        button.addTarget(self, action: #selector(downloadButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func downloadButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("ButtonClick")))) != nil) {
            self.delegate?.buttonDownloadDidSelected(button: button)
        }
    }
    
    func setupLayout() {
        self.addSubview(self.backgroundView)
        self.backgroundView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4)
        }
        
        self.backgroundView.addSubview(self.button0)
        self.button0.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
        }
        
        self.backgroundView.addSubview(self.button1)
        self.button1.snp.makeConstraints { (make) in
            make.left.equalTo(self.button0.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self.button0.snp.width)
        }

        self.backgroundView.addSubview(self.button2)
        self.button2.snp.makeConstraints { (make) in
            make.left.equalTo(self.button1.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self.button0.snp.width)
        }

        /*
        self.backgroundView.addSubview(self.button3)
        self.button3.snp.makeConstraints { (make) in
            make.left.equalTo(self.button2.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self.button0.snp.width)
        }
 */
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
