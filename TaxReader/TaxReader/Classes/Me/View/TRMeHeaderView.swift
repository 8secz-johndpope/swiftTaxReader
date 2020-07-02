//
//  TRMeHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRMeHeaderViewHeaderImageViewTapBlock = (_ sender: UITapGestureRecognizer) ->Void

class TRMeHeaderView: UITableViewHeaderFooterView {
    
    var headerImageViewTapBlock: TRMeHeaderViewHeaderImageViewTapBlock?
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "首页背景")
        
        return imageView
    }()
    
    private lazy var headImageView: UIImageView = {
        let view = UIImageView.init()
        view.image = UIImage.init(named: "头像")
        
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(headImageViewTap(sender:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    @objc func headImageViewTap(sender: UITapGestureRecognizer) {
        guard let headerImageViewTapBlock = headerImageViewTapBlock else { return }
        headerImageViewTapBlock(sender)
    }
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel.init()
        label.text = "15711351234"
        label.textColor = UIColor.white
        
        return label
    }()
    
    private lazy var rowImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "会员箭头白")
        
        return imageView
    }()
    
    func setupLayout() {
        self.addSubview(self.backgroundImageView)
        self.backgroundImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.addSubview(self.headImageView)
        self.headImageView.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(60)
        }
        
        self.addSubview(self.phoneLabel)
        self.phoneLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.headImageView.snp.right).offset(12)
            make.centerY.equalTo(self.headImageView.snp.centerY)
        }
        
        self.addSubview(self.rowImageView)
        self.rowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.centerY.equalTo(self.headImageView.snp.centerY)
            make.size.equalTo(30)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
