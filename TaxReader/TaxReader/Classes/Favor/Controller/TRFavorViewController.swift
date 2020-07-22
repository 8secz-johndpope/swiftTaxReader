//
//  TRFavorViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/13.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import DNSPageView

class TRFavorViewController: UIViewController {
    
    lazy var navView: UIView = {
        let view = LXNavigationBarSearchView.init(frame: .zero)
        view.isHasSeniorButton = false
        view.isFirstView = true
        view.navBackButtonClickBlock = {[weak self](button) in
            self?.navigationController?.popViewController(animated: true)
        }
        view.navTextFieldShouldReturnBlock = {[weak self](textField) in
            let nextVc = TRArticleSearchViewController(searchText: textField.text, seniorModel: TROwnSeniorSearchModel.init())
            self?.navigationController?.pushViewController(nextVc, animated: true)
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
        
        let titles = ["期刊收藏","文章收藏"]
        let viewControllers:[UIViewController] = [TRFavorPeriodicalViewController(),TRFavorArticleViewController()]
        for vc in viewControllers {
            self.addChild(vc)
        }
        
        let pageView = DNSPageView(frame: CGRect(x: 0,
                                                 y: LXNavBarHeight,
                                                 width: LXScreenWidth,
                                                 height: LXScreenHeight - LXNavBarHeight - LXTabBarHeight),
                                   style: style,
                                   titles: titles,
                                   childViewControllers: viewControllers)
        pageView.contentView.backgroundColor = UIColor.blue

        return pageView
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
    }
}
