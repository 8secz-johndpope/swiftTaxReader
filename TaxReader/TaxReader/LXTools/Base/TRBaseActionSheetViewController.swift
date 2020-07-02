//
//  TRBaseActionSheetViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/24.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRBaseActionSheetViewController: UIViewController {
    
    var dataArray = [String]()
    
    fileprivate var coverVeiw = UIView()
    fileprivate var contentView = UIView()
    fileprivate var contentViewHeight: CGFloat {
        return 280
    }
    
    required init?(dataArray: [String]!) {
        super.init(nibName: nil, bundle: nil)
        // 初始化
        self.dataArray = dataArray;
        
        view.backgroundColor = UIColor.clear
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .custom
        
        // 初始化UI
        setupUIViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            UIView.animate(withDuration: 0.25) {
                var frame = self.contentView.frame
                frame.origin.y = kScreenHeight - self.contentViewHeight
                self.contentView.frame = frame
//                self.contentView.alpha = 0.5
            }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: 初始化UI
extension TRBaseActionSheetViewController {
    func setupUIViews() {
        coverVeiw = UIView(frame: CGRect(x: 0, y: 0, width:kScreenWidth, height: kScreenHeight))
        coverVeiw.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.addSubview(coverVeiw)
        
        contentView = UIView.init(frame: CGRect.init(x: 0, y: kScreenHeight, width: kScreenWidth, height: contentViewHeight))
        contentView.backgroundColor = UIColor.orange
        coverVeiw.addSubview(contentView)
    }
}

// MARK: 点击屏幕弹出退出
extension TRBaseActionSheetViewController {
    
    func sheetViewDismiss() {
        UIView.animate(withDuration: 0.25, animations: {
            var frame = self.contentView.frame
            frame.origin.y = kScreenHeight
            self.contentView.frame = frame
            self.coverVeiw.alpha = 0
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sheetViewDismiss()
    }
    
    @objc func cancelBtnDidClick(btn: UIButton) {
        sheetViewDismiss()
    }
}

