//
//  LXNavigationController.swift
//  demoSwift
//
//  Created by asdc on 2019/12/26.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit

class LXNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UIBarButtonItem.appearance()
        appearance.setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: 0.0, vertical: -60), for: .default)
        self.navigationBar.isTranslucent = true
        self.navigationBar.barTintColor = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 0.8)
        self.navigationBar.tintColor = UIColor.init(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)
        self.navigationItem.title = "Example"
    }
}

extension LXNavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
