//
//  TRActiveCodeResultViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRActiveCodeResultViewController: UIViewController {
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "激活码"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var trImageView: UIImageView = {
        let view = UIImageView.init(frame: .zero)
        view.image = UIImage.init(named: "LX激活码成功")
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.trImageView)
        self.trImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(144)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
    }
}
