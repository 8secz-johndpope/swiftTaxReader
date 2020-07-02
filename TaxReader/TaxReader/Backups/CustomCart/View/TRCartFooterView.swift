//
//  TRCartFooterView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRCartFooterView: UITableViewHeaderFooterView {

    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()

    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.5)
            make.bottom.left.right.equalToSuperview()
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
