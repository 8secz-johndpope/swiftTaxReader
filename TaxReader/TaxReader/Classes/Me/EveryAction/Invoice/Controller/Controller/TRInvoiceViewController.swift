//
//  TRInvoiceViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/25.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import DNSPageView

class TRInvoiceViewController: UIViewController {
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "开票信息"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var pageView: DNSPageView = {
        let style = DNSPageStyle()
        style.isTitleViewScrollEnabled = false
        style.isTitleScaleEnabled = false
        style.isShowBottomLine = true
        style.titleSelectedColor = TRThemeColor
        style.titleColor = UIColor.black
        style.bottomLineColor = TRThemeColor
        style.bottomLineHeight = 4
        style.titleViewHeight = 49
        style.titleViewBackgroundColor = LXSlightGrayColor
        style.isContentScrollEnabled = false
        
        let titles = ["全部", "个人", "企业"]
        let viewControllers:[UIViewController] = [TRInvoiceAllViewController(),
                                                  TRInvoicePersonViewController(),
                                                  TRInvoiceCompanyViewController()]
        for vc in viewControllers {
            self.addChild(vc)
        }
        
        let pageView = DNSPageView(frame: CGRect(x: 0,
                                                 y: LXNavBarHeight,
                                                 width: LXScreenWidth,
                                                 height: LXScreenHeight - LXNavBarHeight - 64 - 49),
                                   style: style,
                                   titles: titles,
                                   childViewControllers: viewControllers)
        pageView.contentView.backgroundColor = UIColor.blue

        return pageView
    }()
    
    lazy var backViewForFooterButton: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    lazy var footerView: UIView = {
        let view = LXFooterButtonView.init(frame: .zero)
        view.footerButton.setTitle("+ 添加开票信息", for: UIControl.State.normal)
        view.footerButtonClick = {[weak self](button) in
            self?.blockFooterButtonClick(button: button)
        }
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.backViewForFooterButton)
        self.backViewForFooterButton.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.backViewForFooterButton.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        self.view.addSubview(self.pageView)
        self.pageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.backViewForFooterButton.snp.top)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
    }
}

extension TRInvoiceViewController {
    func blockFooterButtonClick(button: UIButton) {
        let nextVc = TRAddInvoiceViewController(navTitle: "添加开票信息", invoiceInfoDataModel: TRInvoiceInfoDataModel())
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
