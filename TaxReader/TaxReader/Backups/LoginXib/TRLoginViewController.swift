//
//  TRLoginViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/3/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import MBProgressHUD

class TRLoginViewController: UIViewController {
    
    @IBOutlet weak var viewHeightCon: NSLayoutConstraint!

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        self.viewHeightCon.constant = LXScreenHeight
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        let tabBar = LXTabbarProvider.TRsystemStyle()
        let keyWindow = UIApplication.shared.windows.first
        if let window = keyWindow {
            window.rootViewController = tabBar
        }
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        let nextVc = TRRegisterViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
