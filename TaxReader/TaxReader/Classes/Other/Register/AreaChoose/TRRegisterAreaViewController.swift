//
//  TRRegisterAreaViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/18.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import DNSPageView

///设置协议
protocol TRRegisterAreaVCDelegate {
    ///代理方法
    func delegateAreaReverseValue(address:String?, areaTreePath:String?)
}

class TRRegisterAreaViewController: UIViewController {
    ///增加代理属性
    var delegate: TRRegisterAreaVCDelegate?
    
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
        //style.isContentScrollEnabled = false
        
        let titles = ["国内","国外"]
        
//        // 返回选择数据,地址,省,市,区
//        let inlandVc = TRAreaInlandViewController()
//        inlandVc.backLocationStringController = { (address,province,city,area) in
//            var valueAddress = "中国" + province + city + area
//            if city=="辖区" || city=="县" {
//                valueAddress = province + area
//            }
//
//            DispatchQueue.main.async {
//                ///判断是否有遵循的代理
//                guard let customDelegate = self.delegate else {
//                    return
//                }
//                customDelegate.delegateAreaReverseValue(address: valueAddress)
//                self.presentingViewController?.dismiss(animated: true, completion: nil)
//            }
//        }
        
        // 返回选择数据,地址,省,市,区
        let inlandVc = TRLAreaInlandViewController()
        inlandVc.backValueblock = {[weak self](titleAddress, areaTreePath) in
            ///判断是否有遵循的代理
            guard let customDelegate = self?.delegate else {
                return
            }
            customDelegate.delegateAreaReverseValue(address: titleAddress, areaTreePath: areaTreePath)
        }
        
        let foreignVc = TRLAreaForeignViewController()
        foreignVc.foreignBackValueblock = {[weak self](titleAddress, areaTreePath) in
            ///判断是否有遵循的代理
            guard let customDelegate = self?.delegate else {
                return
            }
            customDelegate.delegateAreaReverseValue(address: titleAddress, areaTreePath: areaTreePath)
            self?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        
//        foreignVc.backLocationStringController = { (address,province,city,area) in
//            var valueAddress = province + city + area
//            if city=="辖区" || city=="县" {
//                valueAddress = province + area
//            }
//
//            DispatchQueue.main.async {
//                ///判断是否有遵循的代理
//                guard let customDelegate = self.delegate else {
//                    return
//                }
//                customDelegate.delegateAreaReverseValue(address: valueAddress, areaTreePath: "")
//                self.presentingViewController?.dismiss(animated: true, completion: nil)
//            }
//        }
        
        let viewControllers:[UIViewController] = [inlandVc,foreignVc]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout() {
        self.view.addSubview(self.pageView)
    }
}


//class TRRegisterAreaViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        view.backgroundColor = UIColor.cyan
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
//    }
//}
