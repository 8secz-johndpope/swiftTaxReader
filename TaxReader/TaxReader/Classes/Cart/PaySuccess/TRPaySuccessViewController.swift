//
//  TRPaySuccessViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/7/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRPaySuccessViewController: UIViewController {
    var orderID: String?
    convenience init(orderID: String?) {
        self.init()
        self.orderID = orderID
    }
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "支付成功"
        view.rightButton.isHidden = false
        view.rightButton.setTitle("完成", for: .normal)
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.navRightButtonClick = {[weak self](button) in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var payImageView: UIImageView = {
        let view = UIImageView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.image = UIImage.init(named: "LX单选选中绿色")
        
        return view
    }()
    
    lazy var payLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.text = "支付成功"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 20)
        
        return view
    }()
    
    lazy var payOrderButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = TRThemeColor
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.setTitle("查看订单", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 22.0
        button.addTarget(self, action: #selector(payOrderButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func payOrderButtonClick(button:UIButton) {
        self.pushToOrderDetailVc(button: button)
    }
        
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(180)
        }
        
        self.contentView.addSubview(self.payImageView)
        self.payImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview().offset(-30)
            make.size.equalTo(32)
        }
        
        self.contentView.addSubview(self.payLabel)
        self.payLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.payImageView.snp.right).offset(12)
            make.centerY.equalTo(self.payImageView.snp.centerY)
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(self.payOrderButton)
        self.payOrderButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.payLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(128)
            make.height.equalTo(44)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = LXTableViewBackgroundColor
        
        setupLayout()
    }
}

extension TRPaySuccessViewController {
    func pushToOrderDetailVc(button: UIButton) {
        let nextVc = TROrderDetailViewController(orderID: "")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
