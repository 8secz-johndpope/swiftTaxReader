//
//  TRTicketTypeBottomView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRTicketTypeBottomViewButtonClickBlock = (_ button: UIButton) ->Void

class TRTicketTypeBottomView: UIView {
    
    var footerButtonClickBlock: TRTicketTypeBottomViewButtonClickBlock?
    
    private lazy var trContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.orange
        
        return view
    }()
    
    lazy var footerView: UIView = {
        let view = LXFooterButtonView.init(frame: .zero)
        view.footerButton.setTitle("确定", for: UIControl.State.normal)
        view.backgroundColor = UIColor.white
        view.footerButtonClick = {[weak self](button) in
            guard let footerButtonClickBlock = self?.footerButtonClickBlock else { return }
            footerButtonClickBlock(button)
        }
        
        return view
    }()

    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
