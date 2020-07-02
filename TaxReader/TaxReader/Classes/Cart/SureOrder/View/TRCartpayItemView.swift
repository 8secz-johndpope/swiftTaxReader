//
//  TRCartpayItemView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRCartpayItemViewCoverTap = (_ sender: UITapGestureRecognizer) ->Void

class TRCartpayItemView: UIView {
    
    var coverViewTap : TRCartpayItemViewCoverTap?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var backView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTitleLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18)
        
        return view
    }()

    lazy var trDetailTitleLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 16)
        
        return view
    }()
    
    lazy var trInderImageView: UIImageView = {
        let view = UIImageView.init()
        view.backgroundColor = UIColor.white
        view.image = UIImage.init(named: "会员箭头灰")
        
        return view
    }()
    
    lazy var coverView: UIView = {
        let view = UIView.init()
        
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(coverViewTap(sender:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    @objc func coverViewTap(sender: UITapGestureRecognizer) {
        guard let coverViewTap = coverViewTap else { return }
        coverViewTap(sender)
    }
        
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-0.5)
        }
        
        self.backView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
        }
        
        self.backView.addSubview(self.trInderImageView)
        self.trInderImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-8)
            make.size.equalTo(32)
        }
        
        self.backView.addSubview(self.trDetailTitleLabel)
        self.trDetailTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.trInderImageView.snp.left).offset(-8)
        }
        
        self.backView.addSubview(self.coverView)
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
    
    var trTitleText: String? {
        didSet {
            guard let trTitleText = trTitleText else {
                return
            }
            
            self.trTitleLabel.text = trTitleText
        }
    }
    
    var trDetailTitleText: String? {
        didSet {
            guard let trDetailTitleText = trDetailTitleText else {
                return
            }
            
            self.trDetailTitleLabel.text = trDetailTitleText
        }
    }
}
