//
//  LXHeaderLabelView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class LXHeaderLabelView: UITableViewHeaderFooterView {
    
    lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTitleLabel: UILabel = {
        let view = UILabel.init()
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18.0)
        
        return view
    }()
    
    lazy var trTopLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.red
        
        return view
    }()
        
    lazy var trBottomLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
                
        self.trContentView.addSubview(self.trTopLineView)
        self.trTopLineView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.trContentView.addSubview(self.trBottomLineView)
        self.trBottomLineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }

        self.trContentView.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trTopLineView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.trBottomLineView.snp.top)
        }
        
        self.trBackView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
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
            
            self.trTitleLabel.text = titleString
        }
    }
}
