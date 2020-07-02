//
//  TRInfoAreaView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRInfoAreaViewAreaCoverTap = (_ sender: UITapGestureRecognizer) ->Void

class TRInfoAreaView: UIView {
    
    var areaCoverTap : TRInfoAreaViewAreaCoverTap?
    
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
    
    lazy var topLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
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
        view.text = "地区："
        view.font = UIFont.systemFont(ofSize: 20.0)
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var trInterImageView: UIImageView = {
        let view = UIImageView.init()
        view.backgroundColor = UIColor.white
        view.image = UIImage.init(named: "会员箭头灰")
        
        return view
    }()
    
    lazy var trAreaLabel: UILabel = {
        let view = UILabel.init()
        view.backgroundColor = UIColor.white
        view.text = "请选择地区"
        view.textColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var coverView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.clear
        
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(infoAreaCoverTap(sender:)))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    @objc func infoAreaCoverTap(sender: UITapGestureRecognizer) {
        guard let areaCoverTap = areaCoverTap else { return }
        areaCoverTap(sender)
    }
        
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.contentView.addSubview(self.backView)
        self.backView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLineView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight - 2)
        }
        
        self.backView.addSubview(self.trTipLabel)
        self.trTipLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(30)
            make.width.equalTo(64)
        }
        
        self.backView.addSubview(self.trInterImageView)
        self.trInterImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-12)
            make.width.height.equalTo(32)
        }
        
        self.backView.addSubview(self.trAreaLabel)
        self.trAreaLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(self.trTipLabel.snp.right).offset(4)
            make.right.equalTo(self.trInterImageView.snp.left).offset(-4)
        }
        
        self.contentView.addSubview(self.underLineView)
        self.underLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.backView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.backView.addSubview(self.coverView)
        self.coverView.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.leading.equalTo(self.trAreaLabel.snp.leading)
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
