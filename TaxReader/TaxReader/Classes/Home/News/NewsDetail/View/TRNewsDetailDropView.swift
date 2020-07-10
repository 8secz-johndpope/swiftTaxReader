//
//  TRNewsDetailDropView.swift
//  TaxReader
//
//  Created by asdc on 2020/4/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRNewsDetailDropView: UIView {
    
    lazy var trTitleButton: UIButton = {
        let view = UIButton.init(type: .custom)
        view.setTitle("往期浏览", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        
        return view
    }()
    
    func setUpLayout(){
        self.addSubview(self.trTitleButton)
        self.trTitleButton.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
