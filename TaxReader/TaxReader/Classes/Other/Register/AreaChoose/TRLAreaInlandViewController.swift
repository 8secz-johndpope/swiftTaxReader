//
//  TRLAreaInlandViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRLAreaInlandVCBackVlaueBlock = (_ fullAddress: String, _ areaTreePath: String) ->Void

class TRLAreaInlandViewController: UIViewController, ZHFAddTitleAddressViewDelegate {
    
    var backValueblock : TRLAreaInlandVCBackVlaueBlock?
    
    lazy var addTitleAddressView : ZHFAddTitleAddressView = {
        let view = ZHFAddTitleAddressView()
        view.delegate = self
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan
        
        addTitleAddressView.defaultHeight = ScreenHeight
        addTitleAddressView.isChangeAddress = false
        self.view.addSubview(addTitleAddressView.initAddressView())
        addTitleAddressView.addAnimate()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension TRLAreaInlandViewController {
    func cancelBtnClick(titleAddress: String, titleID: String, areaTreePath: String){
        print("打印的对应省市县的id = \(titleAddress) \(areaTreePath) \(titleID)")
        
        guard let backValueblock = backValueblock else { return }
        backValueblock(titleAddress,areaTreePath)
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
}
