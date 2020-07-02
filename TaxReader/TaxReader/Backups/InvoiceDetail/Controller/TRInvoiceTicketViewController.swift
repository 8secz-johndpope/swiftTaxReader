//
//  TRInvoiceTicketViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRInvoiceTicketViewController: UIViewController {
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "查看发票"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var trImageView: UIImageView = {
        let view = UIImageView.init(frame: .zero)
        view.image = UIImage.init(named: "LX查看发票")
        
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
            make.top.equalTo(self.navView.snp.bottom).offset(8)
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.height.equalTo(269)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupLayout()
    }
}
