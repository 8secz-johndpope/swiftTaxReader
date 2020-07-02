//
//  TRAllOrderViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import DNSPageView

class TRAllOrderViewController: UIViewController {
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "订单"
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
        style.titleViewBackgroundColor = UIColor.white
        style.isContentScrollEnabled = true
        
        let titles = ["全部订单", "未支付", "已完成"]
        let viewControllers:[UIViewController] = [TRAllPayViewController(),
                                                  TRNoPayViewController(),
                                                  TRHadPayViewController()]
        for vc in viewControllers {
            self.addChild(vc)
        }
        
        let pageView = DNSPageView(frame: CGRect(x: 0,
                                                 y: LXNavBarHeight,
                                                 width: LXScreenWidth,
                                                 height: LXScreenHeight - LXNavBarHeight),
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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.pageView)
        
        self.view.addSubview(self.backViewForFooterButton)
        self.backViewForFooterButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.pageView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
