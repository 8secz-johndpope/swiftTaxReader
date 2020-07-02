//
//  TRPayTypeHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRPayTypeHeaderViewButtonClickBlock = (_ button: UIButton) ->Void

class TRPayTypeHeaderView: UITableViewHeaderFooterView {
    
    var cancelButtonClickBlock: TRPayTypeHeaderViewButtonClickBlock?
    
    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    private lazy var trTitleLabel: UILabel = {
        let view = UILabel.init()
        view.font = UIFont.systemFont(ofSize: 20.0)
        view.text = "支付方式"
        
        return view
    }()
    
    var trCancelButton:UIButton = {
        let view = UIButton.init(type: UIButton.ButtonType.custom)
        view.setImage(UIImage.init(named: "icon_close"), for: .normal)
        view.addTarget(self, action: #selector(cancelButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func cancelButtonClick(button:UIButton) {
        guard let cancelButtonClickBlock = cancelButtonClickBlock else { return }
        cancelButtonClickBlock(button)
    }
            
    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(0)
        }
        
        self.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        self.addSubview(self.trCancelButton)
        self.trCancelButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-12)
            make.size.equalTo(32)
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
