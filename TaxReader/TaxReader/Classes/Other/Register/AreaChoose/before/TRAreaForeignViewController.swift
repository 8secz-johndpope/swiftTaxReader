//
//  TRAreaForeignViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/19.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

/////默认选中颜色
//let defaultColor = UIColor(red: 79/255, green: 176/255, blue: 255/255, alpha: 1)

class TRAreaForeignViewController: UIViewController {

    public var backLocationStringController: ((String,String,String,String) -> Void)?
    ///title选中颜色
    public var selectColor: UIColor

    public lazy var containV: TRForeignAddressPickView = {
        let view = TRForeignAddressPickView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: LXScreenHeight),selectColor: selectColor)
        view.backOnClickCancel = {
            self.onClickCancel()
        }
        /// 成功选择后将数据回调,并推出视图
        view.backLocationString = { (address,province,city,area) in
            if self.backLocationStringController != nil {
                self.backLocationStringController!(address,province,city,area)
                self.onClickCancel()
            }
        }
        return view
    }()
    public var backgroundView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        return view
    }()

    init(selectColor: UIColor = defaultColor) {
        self.selectColor = selectColor
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        drawMyView()
        // Do any additional setup after loading the view.
    }
    private func drawMyView() {
        self.view.insertSubview(self.backgroundView, at: 0)
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .custom//viewcontroller弹出后之前控制器页面不隐藏 .custom代表自定义
        self.view.addSubview(self.containV)
        // 转场动画代理
        self.transitioningDelegate = self
    }

    ///点击推出
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let currentPoint = touches.first?.location(in: self.view)
        if !self.containV.frame.contains(currentPoint ?? CGPoint()) {
            self.dismiss(animated: true, completion: nil)
        }
    }

    // MARK: onClick
    @objc private func onClickCancel() {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - 转场动画delegate
extension TRAreaForeignViewController:UIViewControllerTransitioningDelegate {
    /// 推入动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animated = TRForeignAddressPickerPresentAnimated(type: .present)
        return animated
    }
    /// 推出动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animated = TRForeignAddressPickerPresentAnimated(type: .dismiss)
        return animated
    }
}
