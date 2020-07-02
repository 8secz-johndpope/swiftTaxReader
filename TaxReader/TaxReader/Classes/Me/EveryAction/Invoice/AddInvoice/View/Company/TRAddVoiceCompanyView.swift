//
//  TRAddVoiceCompanyView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRAddVoiceCompanyViewDelegate: NSObjectProtocol {
    func footerViewResetButtonAction(button:UIButton, view:TRAddVoiceCompanyView)
    func footerViewCommitButtonAction(button:UIButton, view:TRAddVoiceCompanyView)
}

class TRAddVoiceCompanyView: UIView {
    
    weak var delegate: TRAddVoiceCompanyViewDelegate?
    
    lazy var contentView: UIView = {
        let view = UIView.init()
        
        return view
    }()
    
    lazy var section1View: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.orange
        
        return view
    }()
    
    lazy var topLineView1: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var backView1: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var bottomLineView1: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    
    lazy var section2View: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.orange
        
        return view
    }()
    
    lazy var topLineView2: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    lazy var backView2: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var bottomLineView2: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
    
    // 单行
    lazy var tipLabel: UILabel = {
        let view = UILabel.init()
        view.text = "收票信息"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18.0)
        
        return view
    }()
    
    lazy var nameView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.trTextField.placeholder = "企业名称"
        
        return view
    }()
    
    lazy var codeView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.trTextField.placeholder = "纳税人识别码"
        
        return view
    }()

    lazy var addressView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.isHasStarImageView = false
        view.trTextField.placeholder = "请填写注册地址"
        
        return view
    }()
    
    lazy var phoneView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.isHasStarImageView = false
        view.trTextField.placeholder = "请填写注册电话"
        
        return view
    }()
    
    lazy var bankView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.isHasStarImageView = false
        view.trTextField.placeholder = "请填写开户银行"
        
        return view
    }()

    lazy var bankNumberView: TRStarInputView = {
        let view = TRStarInputView.init()
        view.isHasStarImageView = false
        view.trTextField.placeholder = "请填写企业银行账号"
        
        return view
    }()
    
    
    // 2
    lazy var tipLabel2: UILabel = {
        let view = UILabel.init()
        view.text = "收票人信息"
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18.0)
        
        return view
    }()
        
    lazy var phoneView2: TRStarInputView = {
        let view = TRStarInputView.init()
        view.trTextField.placeholder = "请填写手机"
        
        return view
    }()

    lazy var emailView2: TRStarInputView = {
        let view = TRStarInputView.init()
        view.isHasStarImageView = false
        view.trTextField.placeholder = "请填写邮箱"
        
        return view
    }()
    
    // footer
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
        
        self.contentView.addSubview(self.section1View)
        self.section1View.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(435)
        }
        
        self.section1View.addSubview(self.topLineView1)
        self.topLineView1.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.section1View.addSubview(self.bottomLineView1)
        self.bottomLineView1.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }

        self.section1View.addSubview(self.backView1)
        self.backView1.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLineView1.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomLineView1.snp.top)
        }
        
        
        
        
        self.contentView.addSubview(self.section2View)
        self.section2View.snp.makeConstraints { (make) in
            make.top.equalTo(self.section1View.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(180)
        }
        
        self.section2View.addSubview(self.topLineView2)
        self.topLineView2.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.section2View.addSubview(self.bottomLineView2)
        self.bottomLineView2.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }

        self.section2View.addSubview(self.backView2)
        self.backView2.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLineView2.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.bottomLineView2.snp.top)
        }
        
        // 单行 添加到 backView
        self.backView1.addSubview(self.tipLabel)
        self.tipLabel.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.left.equalTo(30)
            make.height.equalTo(44)
        }
        
        self.backView1.addSubview(self.nameView)
        self.nameView.snp.makeConstraints { (make) in
            make.top.equalTo(self.tipLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }
        
        self.backView1.addSubview(self.codeView)
        self.codeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }

        self.backView1.addSubview(self.addressView)
        self.addressView.snp.makeConstraints { (make) in
            make.top.equalTo(self.codeView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }
        
        self.backView1.addSubview(self.phoneView)
        self.phoneView.snp.makeConstraints { (make) in
            make.top.equalTo(self.addressView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }

        self.backView1.addSubview(self.bankView)
        self.bankView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }

        self.backView1.addSubview(self.bankNumberView)
        self.bankNumberView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bankView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }
        
        // 2
        self.backView2.addSubview(self.tipLabel2)
        self.tipLabel2.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.left.equalTo(30)
            make.height.equalTo(44)
        }
        
        self.backView2.addSubview(self.phoneView2)
        self.phoneView2.snp.makeConstraints { (make) in
            make.top.equalTo(self.tipLabel2.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }
        
        self.backView2.addSubview(self.emailView2)
        self.emailView2.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneView2.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(starInputViewHeight)
        }
        
        // footer
        self.contentView.addSubview(self.footerView)
        self.footerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bottomLineView2.snp.bottom)
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
