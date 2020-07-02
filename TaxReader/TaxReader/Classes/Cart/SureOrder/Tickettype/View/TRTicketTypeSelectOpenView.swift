//
//  TRTicketTypeSelectOpenView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRTicketTypeSelectOpenViewButtonClickBlock = (_ button: UIButton) ->Void

class TRTicketTypeSelectOpenView: UIView {
    
    var footerButtonClick : TRTicketTypeSelectOpenViewButtonClickBlock?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
        
    var footerButton1:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("开发票", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.setImage(UIImage.init(named: "LX选中"), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        button.tag = 1
        button.addTarget(self, action: #selector(footerButtonClick1(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick1(button:UIButton) {
        if !button.isSelected {
            button.setImage(UIImage.init(named: "LX选中"), for: .normal)
            self.footerButton2.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        } else {
            button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
            self.footerButton1.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        }
        
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
        
    var footerButton2:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setTitle("不开发票", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        button.tag = 2
        button.addTarget(self, action: #selector(footerButtonClick2(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func footerButtonClick2(button:UIButton) {
        if !button.isSelected {
            button.setImage(UIImage.init(named: "LX选中"), for: .normal)
            self.footerButton1.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        } else {
            button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
            self.footerButton2.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        }
        
        // 功能点的改变
        guard let footerButtonClick = footerButtonClick else { return }
        footerButtonClick(button)
    }
    
    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.addSubview(self.footerButton1)
        self.footerButton1.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(110)
            make.height.equalTo(44)
        }

        self.addSubview(self.footerButton2)
        self.footerButton2.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.footerButton1.snp.right).offset(16)
            make.width.equalTo(110)
            make.height.equalTo(44)
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
