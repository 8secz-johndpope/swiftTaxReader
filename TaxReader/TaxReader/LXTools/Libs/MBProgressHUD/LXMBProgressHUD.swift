//
//  LXMBProgressHUD.swift
//  demoSwift
//
//  Created by asdc on 2020/1/3.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension MBProgressHUD {
    class func showWithText(text: String, view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.text;
        hud.label.text = text;
        hud.label.numberOfLines = 0;
        hud.label.textAlignment = NSTextAlignment.left;
        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor;
        hud.contentColor = UIColor.white;
        hud.bezelView.backgroundColor = UIColor.black.withAlphaComponent(0.7);
        hud.removeFromSuperViewOnHide = true;
        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    class func showWithStatus(text: String, view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.indeterminate;
        hud.label.text = text;
        hud.label.numberOfLines = 0;
        hud.label.textAlignment = NSTextAlignment.left;
        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor;
        hud.contentColor = UIColor.white;
        hud.bezelView.backgroundColor = UIColor.black.withAlphaComponent(0.7);
        hud.removeFromSuperViewOnHide = true;
    }
    
    class func showSuccessWithStatus(text: String, view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.customView;
        
        /*
        // Set an image view with a checkmark.  Checkmark
        NSString *imageNameStr = [NSString stringWithFormat:@"MBProgressHUD.bundle/%@", iconName];
        UIImage *image = [[UIImage imageNamed:imageNameStr] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        */
        
        let image = UIImage.init(named: "success.png")?.withRenderingMode(.alwaysTemplate)
        hud.customView = UIImageView.init(image: image)
        
        hud.label.text = text;
        hud.label.numberOfLines = 0;
        hud.label.textAlignment = NSTextAlignment.left;
        hud.bezelView.style = MBProgressHUDBackgroundStyle.solidColor;
        hud.contentColor = UIColor.white;
        hud.bezelView.backgroundColor = UIColor.black.withAlphaComponent(0.7);
        hud.removeFromSuperViewOnHide = true;
        hud.hide(animated: true, afterDelay: 1.5)
    }
}

