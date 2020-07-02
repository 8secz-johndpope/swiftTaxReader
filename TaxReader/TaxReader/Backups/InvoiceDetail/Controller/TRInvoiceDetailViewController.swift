//
//  TRInvoiceDetailViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

import TPKeyboardAvoiding

class TRInvoiceDetailViewController: UIViewController {
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "发票详情"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var scrollView: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView.init(frame: .zero)
        scrollView.backgroundColor = LXTableViewBackgroundColor
        scrollView.contentSize = CGSize.init(width: LXScreenWidth, height: LXScreenHeight)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
    
    // 单行
    lazy var detailOrderView: TRInvoiceDetailOrderView = {
        let view = TRInvoiceDetailOrderView.init(frame: .zero)
        
        return view
    }()

    
    lazy var detailContentView: TRInvoiceDetailContentView = {
        let view = TRInvoiceDetailContentView.init(frame: .zero)
        view.footerButtonClick = {[weak self](button) in
            self?.blockDetailContentViewInvoiceButtonClick(button: button)
        }
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
                
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom).offset(10)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(1000)
        }
        
        // 单行
        self.contentView.addSubview(self.detailOrderView)
        self.detailOrderView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        
        self.contentView.addSubview(self.detailContentView)
        self.detailContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.detailOrderView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(225)
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.contentView.snp.updateConstraints { (make) in
            make.height.equalTo((self.detailContentView.frame.origin.y + self.detailContentView.frame.size.height))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = LXTableViewBackgroundColor
        setupLayout()
    }
}

extension TRInvoiceDetailViewController {
    func blockDetailContentViewInvoiceButtonClick(button: UIButton) {
        let nextVc = TRInvoiceTicketViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
}
