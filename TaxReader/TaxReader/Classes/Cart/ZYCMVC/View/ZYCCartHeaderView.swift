//
//  ZYCCartHeaderView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol ZYCCartHeaderViewDelegate: NSObjectProtocol {
    func headerViewDidPress(index:NSInteger, shopmodel:YCOrderShopModel,isSel:Bool)
}

class ZYCCartHeaderView: UITableViewHeaderFooterView {
    
    /** 代理 */
    weak var YCHeaderDelegate:ZYCCartHeaderViewDelegate?
    
    /** 序号 */
    var index:NSInteger?
    var isLeftBtnSel:Bool = false
    
    /** 数据 */
    private var _xshopModel:YCOrderShopModel?
    var shopModel:YCOrderShopModel?{
        get{
            return _xshopModel
        }
        set{
            _xshopModel = newValue
            if (_xshopModel?.shopIsAllSelected)! {
                self.trSelectButton.setImage(UIImage.init(named: "LX选中"), for: .normal)
                self.isLeftBtnSel = true
            }else{
                self.trSelectButton.setImage(UIImage.init(named: "LX圆环"), for: .normal)
                self.isLeftBtnSel = false
            }
            self.trTitleLabel.text = _xshopModel?.shopName
        }
    }

    
    
    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    var trSelectButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        button.setImage(UIImage.init(named: "LX选中"), for: .selected)
        button.addTarget(self, action: #selector(selectButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func selectButtonClick(button:UIButton) {
        if self.isLeftBtnSel {
            self.trSelectButton.setImage(UIImage.init(named: "LX圆环"), for: .normal)
            self.isLeftBtnSel = false
        }else{
            self.trSelectButton.setImage(UIImage.init(named: "LX选中"), for: .normal)
            self.isLeftBtnSel = true
        }
        if (self.YCHeaderDelegate != nil){
            self.YCHeaderDelegate?.headerViewDidPress(index: self.index!, shopmodel: self.shopModel!, isSel: self.isLeftBtnSel)
        }
    }
    
    private lazy var trTitleLabel: UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 18.0)
        
        return label
    }()
        
    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0.5)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-0.5)
        }
        
        self.addSubview(self.trSelectButton)
        self.trSelectButton.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
        
        self.addSubview(self.trTitleLabel)
        self.trTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectButton.snp.right).offset(12)
            make.centerY.equalTo(self.trSelectButton.snp.centerY)
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleString: String? {
        didSet {
            guard let titleString = titleString else {
                return
            }
            
            self.trTitleLabel.text = titleString
        }
    }
    
    var isHasSelectButton: Bool? {
        didSet {
            guard let isHasSelectButton = isHasSelectButton else {
                return
            }
            
            self.trSelectButton.isHidden = isHasSelectButton ? false : true
            if !isHasSelectButton {
                self.trSelectButton.snp.updateConstraints { (make) in
                    make.size.equalTo(0)
                }
            }
        }
    }
}


/*
class YCOrderHeaderView: UIView {

    /** 代理 */
    weak var YCHeaderDelegate:YC_headerViewDelegate?
    /** 数据 */
    private var _xshopModel:YCOrderShopModel?
    var shopModel:YCOrderShopModel?{
        get{
            return _xshopModel
        }
        set{
            _xshopModel = newValue
            if (_xshopModel?.shopIsAllSelected)! {
                self.leftSelBtn.setImage(UIImage.init(named: "GameCenterNewAppTag"), for: .normal)
                self.isLeftBtnSel = true
            }else{
                self.leftSelBtn.setImage(UIImage.init(named: "GameCenterNewWhite"), for: .normal)
                self.isLeftBtnSel = false
            }
            self.shopNameLabel.text = _xshopModel?.shopName
        }
    }
    /** 序号 */
    var index:NSInteger?
    
    let boardWidth:CGFloat = 10
    let headerHeight:CGFloat = 50
    let leftSelBtnWH:CGFloat = 30
    
    var leftSelBtn = UIButton.init()
    var shopNameLabel = UILabel.init()
    var isLeftBtnSel:Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        let leftBtn = UIButton.init(frame: CGRect(x: boardWidth, y: (headerHeight - leftSelBtnWH)*0.5, width: leftSelBtnWH, height: leftSelBtnWH))
        leftBtn.addTarget(self, action: #selector(leftSelBtnDidPress(btn:)), for: .touchUpInside)
        self.leftSelBtn = leftBtn
        self.addSubview(leftBtn)
        
        self.shopNameLabel = UILabel.init(frame: CGRect(x: (boardWidth+boardWidth+leftSelBtnWH), y: leftBtn.yc_top(), width: (LXScreenWidth - 3*boardWidth - leftBtn.yc_width()), height: leftSelBtnWH))
        self.shopNameLabel.text = "今年本月旗舰店"
        self.shopNameLabel.font = UIFont.systemFont(ofSize: 19)
        self.shopNameLabel.textColor = .black
        self.addSubview(self.shopNameLabel)
    }
    
    @objc func leftSelBtnDidPress(btn:UIButton){
        if self.isLeftBtnSel {
            self.leftSelBtn.setImage(UIImage.init(named: "GameCenterNewWhite"), for: .normal)
            self.isLeftBtnSel = false
        }else{
            self.leftSelBtn.setImage(UIImage.init(named: "GameCenterNewAppTag"), for: .normal)
            self.isLeftBtnSel = true
        }
        if (self.YCHeaderDelegate != nil){
            self.YCHeaderDelegate?.headerViewDidPress(index: self.index!, shopmodel: self.shopModel!, isSel: self.isLeftBtnSel)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
 */
