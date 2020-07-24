//
//  TRCartHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

// 创建闭包 - OC中的block
typealias TRCartHeaderViewSelectedButtonClick = (_ button: UIButton) ->Void

class TRCartHeaderView: UITableViewHeaderFooterView {
    
    var headerSelectButtonClick : TRCartHeaderViewSelectedButtonClick?
    
    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    var trSelectButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        button.setImage(UIImage.init(named: "LX选中"), for: .selected)
        button.addTarget(self, action: #selector(selectButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func selectButtonClick(button:UIButton) {
        guard let headerSelectButtonClick = headerSelectButtonClick else { return }
        headerSelectButtonClick(button)
    }
    
    private lazy var trTitleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 18.0)
        
        return label
    }()
        
    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.5)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-0.5)
        }
        
        self.addSubview(self.trSelectButton)
        self.trSelectButton.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
        
        self.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectButton.snp.right).offset(12)
            make.centerY.equalTo(self.trSelectButton.snp.centerY)
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
    
    var isHasSelectButton: Bool? {
        didSet {
            guard let isHasSelectButton = isHasSelectButton else {
                return
            }
            
            self.trSelectButton.isHidden = isHasSelectButton ? false : true
            if !isHasSelectButton {
                self.trSelectButton.snp.updateConstraints { (make) in
                    make.size.equalTo(0)
                }
            }
        }
    }
}
