//
//  TRHomeHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

// 创建闭包 - OC中的block
typealias TRHomeHeaderMoreBtnClick = () ->Void

class TRHomeHeaderView: UITableViewHeaderFooterView {
    
    var headerMoreBtnClick : TRHomeHeaderMoreBtnClick?
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView.init()
        view.image = UIImage.init(named: "标题图标")
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 18.0)
        
        return label
    }()
    
    private var moreBtn:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("更多 >", for: UIControl.State.normal)
        button.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(moreButtonClick(moreButton:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func moreButtonClick(moreButton:UIButton) {
        // 闭包回调
        guard let headerMoreBtnClick = headerMoreBtnClick else { return }
        headerMoreBtnClick()
    }
    
    func setupLayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
            make.size.equalTo(26)
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(self.moreBtn)
        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(15)
            make.top.equalTo(10)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleString: String? {
        didSet {
            guard let titleString = titleString else {
                return
            }
            
            self.titleLabel.text = titleString
        }
    }
}
