//
//  TRBuyActionContentView.swift
//  TaxReader
//
//  Created by asdc on 2020/6/26.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

typealias TRBuyActionContentViewBlock = (_ valueModelArray: [TRProductGetIssueNumberDataBatchModel]?) ->Void

class TRBuyActionContentView: UIView {
    
    var selectedItemValueModelArrayBlock: TRBuyActionContentViewBlock?
    
    lazy var trContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.green
        
        return view
    }()
    
    lazy var trContentPianView: TRBuyActionContentPianView = {
        let view = TRBuyActionContentPianView.init(frame: .zero)
        view.backgroundColor = UIColor.red
        
        return view
    }()
        
    lazy var trContentBenView: TRBuyActionContentBenView = {
        let view = TRBuyActionContentBenView.init(frame: .zero)
        view.buttonClickBlock = {[unowned self](button) in
            self.blockButtonActionSegmentBen(button: button)
        }
        
        return view
    }()

    lazy var trContentDanView: TRBuyActionContentDanView = {
        let view = TRBuyActionContentDanView.init(frame: .zero)
        view.selectedItemValueModelArrayBlock = {[unowned self](valueModelArray) in
            guard let selectedItemValueModelArrayBlock = self.selectedItemValueModelArrayBlock else { return }
            selectedItemValueModelArrayBlock(valueModelArray)
        }
        return view
    }()

    lazy var trContentNianView: TRBuyActionContentNianView = {
        let view = TRBuyActionContentNianView.init(frame: .zero)
        view.buttonClickBlock = {[unowned self](button) in
            self.blockButtonActionSegmentNian(button: button)
        }
        
        return view
    }()

    
    func setupLayout() {
        self.addSubview(self.trContentView)
        self.trContentView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trContentNianView)
        self.trContentNianView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }

        self.trContentView.addSubview(self.trContentDanView)
        self.trContentDanView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }

        self.trContentView.addSubview(self.trContentBenView)
        self.trContentBenView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trContentView.addSubview(self.trContentPianView)
        self.trContentPianView.snp.makeConstraints { (make) in
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
    
    var segButtonTag: Int? {
        didSet {
            guard let buttonTag = segButtonTag else {
                return
            }
            
            switch buttonTag {
            case 0:
                self.trContentPianView.isHidden = false
                self.trContentBenView.isHidden = true
                self.trContentDanView.isHidden = true
                self.trContentNianView.isHidden = true
            case 1:
                self.trContentBenView.isHidden = false
                self.trContentPianView.isHidden = true
                self.trContentDanView.isHidden = true
                self.trContentNianView.isHidden = true
            case 2:
                self.trContentDanView.isHidden = false
                self.trContentPianView.isHidden = true
                self.trContentBenView.isHidden = true
                self.trContentNianView.isHidden = true
            case 3:
                self.trContentNianView.isHidden = false
                self.trContentPianView.isHidden = true
                self.trContentBenView.isHidden = true
                self.trContentDanView.isHidden = true
            default:
                print("default")
            }
        }
    }
    
    var productIssueNumberModel: TRProductGetIssueNumberDataModel? {
        didSet {
            guard let model = productIssueNumberModel else {
                return
            }
            self.trContentPianView.productIssueNumberModel = model
            self.trContentBenView.currentModel = model.CurrProduct
            self.trContentDanView.dataArrayDan = model.BatchProduct
            self.trContentNianView.yearModel = model.YearProduct
        }
    }
    
    var isHasCurrentPian: Bool? {
        didSet {
            guard let isHasCurrentPian = isHasCurrentPian else {
                return
            }
            
            if !isHasCurrentPian {
                self.trContentPianView.isHidden = true
            }
        }
    }
    
}

extension TRBuyActionContentView {
    func blockButtonActionSegmentBen(button: UIButton) {
        //print(button.tag)
    }
    
    func blockButtonActionSegmentNian(button: UIButton) {
        //print(button.tag)
    }
}
