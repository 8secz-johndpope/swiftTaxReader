//
//  TRAddInvoicePersonView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRAddInvoicePersonViewDelegate: NSObjectProtocol {
    func footerViewResetButtonAction(button:UIButton, view:TRAddInvoicePersonView)
    func footerViewCommitButtonAction(button:UIButton, view:TRAddInvoicePersonView)
}

class TRAddInvoicePersonView: UIView {
    
    weak var delegate: TRAddInvoicePersonViewDelegate?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        
        return view
    }()
        
    lazy var backViewMessage: UIView = {
        let view = UIView.init()
        
        return view
    }()
    
    lazy var topLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var backViewInput: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var backViewButton: UIView = {
        let view = UIView.init()
        view.backgroundColor = LXTableViewBackgroundColor
        
        return view
    }()
        
    // 单行
    lazy var tipLabel: UILabel = {
        let view = UILabel.init()
        view.text = "收票人信息"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18.0)
        
        return view
    }()
    
    lazy var nameView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.trTextField.placeholder = "请填写收货人姓名"
        
        return view
    }()
    
    lazy var phoneView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.trTextField.placeholder = "请填写收货人手机"
        
        return view
    }()

    lazy var emailView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.isHasStarImageView = false
        view.trTextField.placeholder = "请填写收货人邮箱"
        
        return view
    }()
    
    lazy var footerView: LXFooterButtonTwoView = {
        let view = LXFooterButtonTwoView.init(frame: .zero)
        view.contentView.backgroundColor = LXTableViewBackgroundColor
        view.backView.backgroundColor = LXTableViewBackgroundColor
        view.backView1.backgroundColor = LXTableViewBackgroundColor
        view.backView2.backgroundColor = LXTableViewBackgroundColor
        view.footerButtonClick = {[weak self](button) in
            if button.tag == 1{
                if self?.delegate != nil && ((self?.delegate?.responds(to: Selector.init(("ButtonClick")))) != nil) {
                    self?.delegate?.footerViewResetButtonAction(button: button, view: self!)
                }
            }
            
            if button.tag == 2 {
                if self?.delegate != nil && ((self?.delegate?.responds(to: Selector.init(("ButtonClick")))) != nil) {
                    self?.delegate?.footerViewCommitButtonAction(button: button, view: self!)
                }
            }
        }
        
        return view
    }()

    func setupLayout() {
        self.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.contentView.addSubview(self.backViewMessage)
        self.backViewMessage.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(250)
        }
        
        self.contentView.addSubview(self.backViewButton)
        self.backViewButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.backViewMessage.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        
        self.backViewMessage.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.backViewMessage.addSubview(self.bottomLineView)
        self.bottomLineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }

        self.backViewMessage.addSubview(self.backViewInput)
        self.backViewInput.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLineView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomLineView.snp.top)
        }
        
        // 单行 添加到 backView
        self.backViewInput.addSubview(self.tipLabel)
        self.tipLabel.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.left.equalTo(30)
            make.height.equalTo(44)
        }
        
        self.backViewInput.addSubview(self.nameView)
        self.nameView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tipLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }
        
        self.backViewInput.addSubview(self.phoneView)
        self.phoneView.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }

        self.backViewInput.addSubview(self.emailView)
        self.emailView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }
        
        self.backViewButton.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(itemInfoHeight + 100)
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
