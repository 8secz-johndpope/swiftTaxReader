//
//  LXTabbarProvider.swift
//  demoSwift
//
//  Created by asdc on 2019/12/26.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit
import ESTabBarController_swift

enum LXTabbarProvider {
    static func TRsystemStyle() -> UINavigationController {
        let tabBarController = UITabBarController()
        let v1 = TRHomeViewController()
        let v2 = ExampleViewController()
        let v3 = TRFavorViewController()
        let v4 = ZYCCartViewController() // ExampleViewController TRCartViewController ZYCCartViewController
        let v5 = TRMeViewController()
        
        v1.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home_1"))
        // v2.tabBarItem = UITabBarItem.init(title: "分类", image: UIImage(named: "Category"), selectedImage: UIImage(named: "Category_1"))
        v3.tabBarItem = UITabBarItem.init(title: "收藏", image: UIImage(named: "Favor"), selectedImage: UIImage(named: "Favor_1"))
        v4.tabBarItem = UITabBarItem.init(title: "购物车", image: UIImage(named: "Cart"), selectedImage: UIImage(named: "Cart_1"))
        v5.tabBarItem = UITabBarItem.init(title: "我的", image: UIImage(named: "Me"), selectedImage: UIImage(named: "Me_1"))
        
        tabBarController.tabBar.shadowImage = nil
            
        // tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        tabBarController.viewControllers = [v1, v3, v4, v5]
        
        let navigationController = UINavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        
        return navigationController
    }
    
    static func systemStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        let v1 = ExampleViewController()
        let v2 = ExampleViewController()
        let v3 = ExampleViewController()
        let v4 = ExampleViewController()
        let v5 = ExampleViewController()
        
        v1.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.tabBar.shadowImage = nil
            
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }
    
    static func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> LXNavigationController {
          let tabBarController = ESTabBarController()
          tabBarController.delegate = delegate
          tabBarController.title = "Irregularity"
          tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
          tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
          tabBarController.shouldHijackHandler = {
              tabbarController, viewController, index in
              if index == 2 {
                  return true
              }
              return false
          }
          tabBarController.didHijackHandler = {
              [weak tabBarController] tabbarController, viewController, index in
              
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                  let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                  let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                  alertController.addAction(takePhotoAction)
                  let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                  alertController.addAction(selectFromAlbumAction)
                  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                  alertController.addAction(cancelAction)
                  tabBarController?.present(alertController, animated: true, completion: nil)
              }
          }

          let v1 = ExampleViewController()
          let v2 = ExampleViewController()
          let v3 = ExampleViewController()
          let v4 = ExampleViewController()
          let v5 = ExampleViewController()
          
          v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
          v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
          v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
          v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
          v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
          
          tabBarController.viewControllers = [v1, v2, v3, v4, v5]
          // 388.37
          let navigationController = LXNavigationController.init(rootViewController: tabBarController)
          tabBarController.title = "Example"
          return navigationController
      }
}
