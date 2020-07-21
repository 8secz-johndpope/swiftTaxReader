//
//  TRSeniorSearchView.swift
//  TaxReader
//
//  Created by asdc on 2020/7/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding

class TRSeniorSearchView: UIView {
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10.0
        
        return view
    }()
    
    lazy var scrollView: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView.init(frame: .zero)
        scrollView.backgroundColor = UIColor.white
        scrollView.contentSize = CGSize.init(width: LXScreenWidth, height: LXScreenHeight)
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trTitleLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.text = "高级搜索"
        view.textColor = UIColor.black
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16.0)
        
        return view
    }()
    
    lazy var trFooterView: LXFooterButtonView = {
        let view = LXFooterButtonView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.footerButton.setTitle("检索", for: UIControl.State.normal)
        view.footerButtonClick = {[weak self](button) in
            print("\(button.titleLabel?.text ?? "")")
        }
        
        return view
    }()
    
    lazy var trInputBackgroundView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trVerLineView: UIView = {
        let view = UIView.init(frame: .zero)
        
        return view
    }()
    
    
    lazy var trLanmuView: TRSeniorSearchInputView = {
        let view = TRSeniorSearchInputView.init(frame: .zero)
        view.titleLabelText = "栏目"
        
        return view
    }()
    
    lazy var trPianmingView: TRSeniorSearchInputView = {
        let view = TRSeniorSearchInputView.init(frame: .zero)
        view.titleLabelText = "篇名"
        
        return view
    }()
    
    lazy var trAuthorView: TRSeniorSearchInputView = {
        let view = TRSeniorSearchInputView.init(frame: .zero)
        view.titleLabelText = "作者"
        
        return view
    }()
    
    lazy var trkeywordsView: TRSeniorSearchInputView = {
        let view = TRSeniorSearchInputView.init(frame: .zero)
        view.titleLabelText = "关键词"
        
        return view
    }()
    
    lazy var trQuanwenView: TRSeniorSearchInputView = {
        let view = TRSeniorSearchInputView.init(frame: .zero)
        view.titleLabelText = "全文"
        
        return view
    }()
    
    lazy var trKanmingView: TRSeniorSearchInputView = {
        let view = TRSeniorSearchInputView.init(frame: .zero)
        view.titleLabelText = "刊名"
        view.textFieldPlaceHolder = "全部刊名"
        
        return view
    }()
    
    lazy var trYearView: TRSeniorSearchYearView = {
        let view = TRSeniorSearchYearView.init(frame: .zero)
        
        return view
    }()
    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(408)
        }
        
        self.contentView.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.contentView.addSubview(self.trFooterView)
        self.trFooterView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.contentView.addSubview(self.trInputBackgroundView)
        self.trInputBackgroundView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.trTitleLabel.snp.bottom)
            make.bottom.equalTo(self.trFooterView.snp.top)
        }
        
        self.trInputBackgroundView.addSubview(self.trVerLineView)
        self.trVerLineView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
        
        
        // 单行
        self.trInputBackgroundView.addSubview(self.trLanmuView)
        self.trLanmuView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(self.trVerLineView.snp.left).offset(-20)
            make.height.equalTo(60)
        }
        
        self.trInputBackgroundView.addSubview(self.trPianmingView)
        self.trPianmingView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trLanmuView.snp.top)
            make.left.equalTo(self.trVerLineView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(self.trLanmuView.snp.height)
        }
        
        self.trInputBackgroundView.addSubview(self.trAuthorView)
        self.trAuthorView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trLanmuView.snp.bottom).offset(10)
            make.left.equalTo(self.trLanmuView.snp.left)
            make.right.equalTo(self.trLanmuView.snp.right)
            make.height.equalTo(self.trLanmuView.snp.height)
        }

        self.trInputBackgroundView.addSubview(self.trkeywordsView)
        self.trkeywordsView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trAuthorView.snp.top)
            make.left.equalTo(self.trVerLineView.snp.right).offset(20)
            make.right.equalTo(self.trPianmingView.snp.right)
            make.height.equalTo(self.trLanmuView.snp.height)
        }
        
        self.trInputBackgroundView.addSubview(self.trQuanwenView)
        self.trQuanwenView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trAuthorView.snp.bottom).offset(10)
            make.left.equalTo(self.trLanmuView.snp.left)
            make.right.equalTo(self.trLanmuView.snp.right)
            make.height.equalTo(self.trLanmuView.snp.height)
        }

        self.trInputBackgroundView.addSubview(self.trKanmingView)
        self.trKanmingView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trQuanwenView.snp.top)
            make.left.equalTo(self.trVerLineView.snp.right).offset(20)
            make.right.equalTo(self.trPianmingView.snp.right)
            make.height.equalTo(self.trLanmuView.snp.height)
        }
        
        self.trInputBackgroundView.addSubview(self.trQuanwenView)
        self.trQuanwenView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trAuthorView.snp.bottom).offset(10)
            make.left.equalTo(self.trLanmuView.snp.left)
            make.right.equalTo(self.trLanmuView.snp.right)
            make.height.equalTo(self.trLanmuView.snp.height)
        }
        
        self.trInputBackgroundView.addSubview(self.trKanmingView)
        self.trKanmingView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trQuanwenView.snp.top)
            make.left.equalTo(self.trVerLineView.snp.right).offset(20)
            make.right.equalTo(self.trPianmingView.snp.right)
            make.height.equalTo(self.trLanmuView.snp.height)
        }
        
        self.trInputBackgroundView.addSubview(self.trYearView)
        self.trYearView.snp.makeConstraints { (make) in
            make.top.equalTo(self.trQuanwenView.snp.bottom).offset(10)
            make.left.equalTo(self.trLanmuView.snp.left)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(self.trLanmuView.snp.height)
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
