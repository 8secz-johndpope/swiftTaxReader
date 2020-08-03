//
//  TRReadNavigationView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

enum TRReadNavigationViewButtonType {
    case buttonBack
    case buttonFavor
    case buttonBuy
    case buttonShare
}

typealias TRReadNavigationViewBackButtonClickBlock = (_ button: UIButton, _ buttonType: TRReadNavigationViewButtonType) ->Void

class TRReadNavigationView: UIView {
    
    var navBackButtonClick : TRReadNavigationViewBackButtonClickBlock?
    
    // 背景
    private lazy var bgImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "首页背景")
        
        return imageView
    }()
        
    // 返回
    private lazy var backButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setBackgroundImage(UIImage.init(named: "返回白"), for: .normal)
        button.addTarget(self, action: #selector(navBackButtonClick(backButton:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func navBackButtonClick(backButton:UIButton) {
        guard let navBackButtonClick = navBackButtonClick else { return }
        navBackButtonClick(backButton, .buttonBack)
    }
    
    
    
    
    
    private lazy var trActionBackgroundView: UIView = {
        let view = UIView.init()
        
        return view
    }()
    
    lazy var trFavorButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "期刊收藏01"), for: .normal)
        button.setImage(UIImage.init(named: "期刊收藏02"), for: .selected)
        button.addTarget(self, action: #selector(favorButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func favorButtonClick(button:UIButton) {
        guard let navBackButtonClick = navBackButtonClick else { return }
        navBackButtonClick(button, .buttonFavor)
    }

    
    private lazy var buyButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "期刊订阅01"), for: .normal)
        button.addTarget(self, action: #selector(buyButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func buyButtonClick(button:UIButton) {
        guard let navBackButtonClick = navBackButtonClick else { return }
        navBackButtonClick(button, .buttonBuy)
    }

    
    private lazy var downloadButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "期刊下载01"), for: .normal)
        button.addTarget(self, action: #selector(downloadButtonClick(button:)), for: .touchUpInside)

        return button
    }()

    @objc func downloadButtonClick(button:UIButton) {
        guard let navBackButtonClick = navBackButtonClick else { return }
        navBackButtonClick(backButton, .buttonShare)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    func setupLayout() {
        self.addSubview(self.bgImageView)
        self.bgImageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
                
        self.addSubview(self.backButton)
        self.backButton.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.bottom.equalTo(-8)
            make.size.equalTo(36)
        }
        
        self.addSubview(self.trActionBackgroundView)
        self.trActionBackgroundView.snp.makeConstraints { (make) in
            make.bottom.right.equalTo(0)
            make.width.equalTo(44*3)
            make.height.equalTo(44)
        }
        
        self.trActionBackgroundView.addSubview(self.trFavorButton)
        self.trFavorButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.width.equalTo(44)
        }
        
        self.trActionBackgroundView.addSubview(self.buyButton)
        self.buyButton.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(self.trFavorButton.snp.right)
            make.width.equalTo(44)
        }

        self.trActionBackgroundView.addSubview(self.downloadButton)
        self.downloadButton.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(self.buyButton.snp.right)
            make.width.equalTo(44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
