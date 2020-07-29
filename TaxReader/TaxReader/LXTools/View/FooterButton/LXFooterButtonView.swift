//
//  LXFooterButtonView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

// 创建闭包 - OC中的block
typealias LXFooterButtonClick = (_ button: UIButton) ->Void

class LXFooterButtonView: UIView {
    
    var footerButtonClick: LXFooterButtonClick?
        
    lazy var footerButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = TRThemeColor
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.setTitle("保存(待)", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 25.0
        button.addTarget(self, action: #selector(footerButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick(button:UIButton) {
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }

    func setupLayout() {
        self.addSubview(self.footerButton)
        self.footerButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(LXScreenWidth - 40)
            make.height.equalTo(50)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
