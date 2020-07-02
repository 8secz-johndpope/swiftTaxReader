//
//  SceneDelegate.swift
//  TaxReader
//
//  Created by asdc on 2020/3/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import SwiftDate

class SceneDelegate: UIResponder, UIWindowSceneDelegate{

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // 转交给 SceneDelegate 的willConnectTo Session:方法进行根控制器设置
        //self.window?.rootViewController = UINavigationController.init(rootViewController: TRWLoginViewController())
        self.window?.backgroundColor = UIColor.white
        
//        // expire_time 在此时间内，则直接进入首页 越过登录页面
//        let expire_time = UserDefaults.LoginInfo.string(forKey: .expire_time)
//        let dateExpire = expire_time?.toDate()!.date
//
//        if expire_time?.isBlank ?? true {
//            self.window?.rootViewController = TRWLoginViewController()
//            self.window?.makeKeyAndVisible()
//
//            return
//        }
//        let dateNow = Date()
//        print("\(dateNow) \(String(describing: dateExpire))")
//        let isAscending = dateNow.compare(dateExpire!) == .orderedAscending // // date1 < date2 升序排列
//        self.window?.rootViewController = !isAscending ? TRWLoginViewController() : LXTabbarProvider.TRsystemStyle()
        
        self.window?.rootViewController = TRWLoginViewController()
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
