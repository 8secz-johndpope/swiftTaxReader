//
//  TRLoginLogoView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/11.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRLoginLogoView: UIView {
    lazy var logoImageView: UIImageView = {
        let view = UIImageView.init()
        view.image = UIImage.init(named: "logo")
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    lazy var logoLabel: UILabel = {
        let view = UILabel.init()
        view.text = "税务期刊交流平台"
        view.textColor = UIColor.white
        view.font = UIFont.systemFont(ofSize: 18.0)
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.logoImageView)
        self.logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(LXScreenWidth - 100*scaleHeightSE2nd)
        }
        
        self.addSubview(self.logoLabel)
        self.logoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoImageView.snp.bottom).offset(-6)
            make.centerX.equalToSuperview()
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
