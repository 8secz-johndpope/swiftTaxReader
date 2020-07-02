//
//  TRForeignAddressPickerPresentAnimated.swift
//  TaxReader
//
//  Created by asdc on 2020/5/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

//enum EWAddressPickerPresentAnimateType {
//    case present//被推出时
//    case dismiss//取消时
//}

//EWAddressPickerViewController的推出和取消动画
class TRForeignAddressPickerPresentAnimated: NSObject,UIViewControllerAnimatedTransitioning {

    var type: EWAddressPickerPresentAnimateType = .present

    init(type: EWAddressPickerPresentAnimateType) {
        self.type = type
    }
    /// 动画时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    /// 动画效果
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        switch type {
        case .present:
            guard let toVC: TRAreaInlandViewController = transitionContext.viewController(forKey: .to) as? TRAreaInlandViewController else {
                return
            }
            let toView = toVC.view

            let containerView = transitionContext.containerView
            containerView.addSubview(toView!)

            toVC.containV.transform = CGAffineTransform(translationX: 0, y: (toVC.containV.frame.height))

            UIView.animate(withDuration: 0.25, animations: {
                /// 背景变色
                toVC.backgroundView.alpha = 1.0
                /// addresspicker向上推出
                toVC.containV.transform =  CGAffineTransform(translationX: 0, y: -10)
            }) { (_) in
                UIView.animate(withDuration: 0.2, animations: {
                    /// transform初始化
                    toVC.containV.transform = CGAffineTransform.identity
                }, completion: { (_) in
                    transitionContext.completeTransition(true)
                })
            }
        case .dismiss:
            guard let toVC: TRAreaForeignViewController = transitionContext.viewController(forKey: .from) as? TRAreaForeignViewController else {
                return
            }

            UIView.animate(withDuration: 0.25, animations: {
                toVC.backgroundView.alpha = 0.0
                /// addresspicker向下推回
                toVC.containV.transform =  CGAffineTransform(translationX: 0, y: (toVC.containV.frame.height))
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
    }
}
