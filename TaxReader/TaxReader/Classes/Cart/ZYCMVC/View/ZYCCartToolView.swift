//
//  ZYCCartToolView.swift
//  TaxReader
//
//  Created by asdc on 2020/5/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

@objc protocol ZYCCartToolViewDelegate {
    func selectedAllBtnDidPress(button:UIButton,isSel:Bool)
    func accountBtnDidPress(button:UIButton,isSel:Bool)
    func favorBtnDidPress(button:UIButton,isSel:Bool)
    func deleteBtnDidPress(button:UIButton,isSel:Bool)
}

class ZYCCartToolView: UIView {
    
    weak var footDelegate:ZYCCartToolViewDelegate?
    
    /** 全选按钮点击 */
    var isSelectAll:Bool = false
    /** 选中商品的个数 */
    var selectCount:NSInteger?
    
    // 全选
    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    var trSelectAllButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        button.addTarget(self, action: #selector(selectButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func selectButtonClick(button:UIButton) {
        if self.isSelectAll {
            self.trSelectAllButton.setImage(UIImage.init(named: "LX圆环"), for: .normal)
            self.isSelectAll = false
        }else{
            self.trSelectAllButton.setImage(UIImage.init(named: "LX选中"), for: .normal)
            self.isSelectAll = true
        }
        if (self.footDelegate != nil) {
            self.footDelegate?.selectedAllBtnDidPress(button: button, isSel: self.isSelectAll)
        }
    }
    
    private lazy var trSelectAllLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.text = "全选"
        label.textColor = UIColor.lightGray
        
        return label
    }()
    
    // 结算
    lazy var trTotalBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    var trTotalPriceButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.red
        button.setTitle("结算", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20.0
        button.addTarget(self, action: #selector(totalPriceButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func totalPriceButtonClick(button:UIButton) {
        if (self.footDelegate != nil) {
            self.footDelegate?.accountBtnDidPress(button: button, isSel: self.isSelectAll)
        }
    }
    
    private lazy var trTotalPriceLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.text = "总计：￥1100"
        label.textColor = UIColor.red
        
        let att:NSAttributedString = NSAttributedString(string: "合计：", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
        let att1:NSAttributedString = NSAttributedString(string: "¥0.00", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.red, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        attributedStrM.append(att)
        attributedStrM.append(att1)
        self.addSubview(label)
        label.backgroundColor = UIColor.white
        label.attributedText = attributedStrM
        
        return label
    }()
    
    // 编辑
    lazy var trEditBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white

        return view
    }()
    
    var trEditDeleteButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("删除", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.cornerRadius = 20.0
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2.0
        button.addTarget(self, action: #selector(editDeleteButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func editDeleteButtonClick(button:UIButton) {
        if (self.footDelegate != nil) {
            self.footDelegate?.deleteBtnDidPress(button: button, isSel: self.isSelectAll)
        }
    }

    var trEditToFavorButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("移到收藏", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 20.0
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 2.0
        button.addTarget(self, action: #selector(editToFavorButtonClick(button:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func editToFavorButtonClick(button:UIButton) {
        if (self.footDelegate != nil) {
            self.footDelegate?.favorBtnDidPress(button: button, isSel: self.isSelectAll)
        }
    }

    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0.5, left: 0, bottom: 0.5, right: 0))
        }
        
        self.addSubview(self.trSelectAllButton)
        self.trSelectAllButton.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
        
        self.addSubview(self.trSelectAllLabel)
        self.trSelectAllLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectAllButton.snp.right).offset(4)
            make.centerY.equalTo(self.trSelectAllButton.snp.centerY)
        }
        
        // 编辑功能
        self.addSubview(self.trEditBackView)
        self.trEditBackView.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectAllLabel.snp.right).offset(12)
            make.bottom.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        
        self.trEditBackView.addSubview(self.trEditDeleteButton)
        self.trEditDeleteButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(120)
        }
        
        self.trEditBackView.addSubview(self.trEditToFavorButton)
        self.trEditToFavorButton.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.equalTo(self.trEditDeleteButton.snp.left).offset(-12)
            make.width.equalTo(120)
        }
        
        // 结算功能
        self.addSubview(self.trTotalBackView)
        self.trTotalBackView.snp.makeConstraints { (make) in
            make.left.equalTo(self.trSelectAllLabel.snp.right).offset(12)
            make.bottom.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        
        self.trTotalBackView.addSubview(self.trTotalPriceButton)
        self.trTotalPriceButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(120)
        }
        
        self.trTotalBackView.addSubview(self.trTotalPriceLabel)
        self.trTotalPriceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.trTotalPriceButton.snp.left).offset(-12)
            make.centerY.equalToSuperview()
        }

        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** 数据 */
    private var _xshopModel:YCOrderShopModel?
    var shopModel:YCOrderShopModel?{
        get{
            return _xshopModel
        }
        set{
            _xshopModel = newValue
            if _xshopModel!.shopIsAllSelected {
                
            }
        }
    }
    
    //更新
    func updateArr(selectedArr:NSArray, dataArr:NSArray){
        //计算价格
        var sumPrice:Float = 0
        //选中商品总数
        var sumCount:NSInteger = 0
        //总的商品数量
        var allCount:NSInteger = 0
        
        for index in 0..<dataArr.count {
            let shopmodel:YCOrderShopModel = dataArr[index] as! YCOrderShopModel
            allCount += shopmodel.goodsArr!.count
        }
        
        for xindex in 0..<selectedArr.count {
            let selArr:NSMutableArray = selectedArr[xindex] as! NSMutableArray
            let count:NSInteger = selArr.count
            sumCount += count
            if count > 0 {
                for jindex in 0..<count {
                    let goodmodel:YCOrderGoodsModel = selArr[jindex] as! YCOrderGoodsModel
                    let price:String = String(describing: goodmodel.Product?.ProdIOSPrice)
                    //let priceNum:Float = Float(price)!
                    let priceNum:Float = Float((goodmodel.Product?.ProdIOSPrice)!)
                    let ccount:Int = goodmodel.goodsCount!
                    sumPrice += priceNum*Float(ccount)
                }
            }
        }
        let att:NSAttributedString = NSAttributedString(string: "合计：", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
        let ss:String = String.init(format: "￥%.2f", sumPrice)
        let att1:NSAttributedString = NSAttributedString(string: ss, attributes: [NSAttributedString.Key.foregroundColor  : UIColor.red, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)])
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        attributedStrM.append(att)
        attributedStrM.append(att1)
        self.trTotalPriceLabel.attributedText = attributedStrM
        
        self.selectCount = sumCount
        
        let accountBtnTile = sumCount > 0 ? String.init(format: "去结算(%ld)", sumCount) : "去结算"
        self.trTotalPriceButton.setTitle(accountBtnTile, for: .normal)
        
        self.isSelectAll = sumCount == allCount ? true : false;
        
        if !self.isSelectAll {
            self.trSelectAllButton.setImage(UIImage.init(named: "LX圆环"), for: .normal)
            self.isSelectAll = false
        }else{
            self.trSelectAllButton.setImage(UIImage.init(named: "LX选中"), for: .normal)
            self.isSelectAll = true
        }
    }
}





/*
class ZYCCartToolView: UIView {
    /** 全选按钮 */
    var selectAllBtn:UIButton?
    /** 价格label */
    var sumLabel:UILabel?
    /** 结算按钮 */
    var accountBtn:UIButton?
    /** 全选按钮点击 */
    var isSelectAll:Bool = false
    /** 选中商品的个数 */
    var selectCount:NSInteger?
    //代理
    weak var footDelegate:ZYCCartToolViewDelegate?
//    //判断是否全选
//    var isAllSel:Bool?
    /** 数据 */
    private var _xshopModel:YCOrderShopModel?
    var shopModel:YCOrderShopModel?{
        get{
            return _xshopModel
        }
        set{
            _xshopModel = newValue
            if _xshopModel!.shopIsAllSelected {
                
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customFootViewUI()
    }
    let selectBtnWH:CGFloat = 70
    let boardWidth:CGFloat = 10
    let viewHeight:CGFloat = 70
    func customFootViewUI(){
        
        self.backgroundColor = UIColor.white
        //左侧按钮
        self.selectAllBtn = UIButton.init(frame: CGRect(x: 0, y: (viewHeight - selectBtnWH)*0.5, width: selectBtnWH, height: selectBtnWH))
        self.selectAllBtn?.setImage(UIImage.init(named: "GameCenterNewWhite"), for: .normal)
        self.selectAllBtn?.setTitle("全选", for: .normal)
        self.selectAllBtn?.setTitleColor(UIColor.lightGray, for: .normal)
        self.selectAllBtn?.addTarget(self, action: #selector(leftSelectAllBtnDidPress(button:)), for: .touchUpInside)
        self.addSubview(self.selectAllBtn!)
        self.selectAllBtn?.backgroundColor = UIColor.green
        
        // 结算按钮
        self.accountBtn = UIButton.init(frame: CGRect(x: LXScreenWidth - (kScreenWidth/3.0 - boardWidth), y: boardWidth, width: LXScreenWidth/3.0 - 2*boardWidth, height: viewHeight - 2 * boardWidth))
        self.accountBtn?.backgroundColor = UIColor.red
        self.accountBtn?.setTitle("去结算", for: .normal)
        self.accountBtn?.setTitleColor(.white, for: .normal)
        self.accountBtn?.setTitleColor(.lightGray, for: .highlighted)
        self.accountBtn?.addTarget(self, action: #selector(accountBtnAllBtnDidPress(button:)), for: .touchUpInside)
        self.addSubview(self.accountBtn!)
        
        //价格label
        self.sumLabel = UILabel.init(frame: CGRect(x: (self.selectAllBtn?.yc_right())! + boardWidth, y: (viewHeight - selectBtnWH)*0.5, width: kScreenWidth - 3*boardWidth - self.selectAllBtn!.yc_width() - (self.accountBtn?.yc_width())!, height: selectBtnWH))
 
        let att:NSAttributedString = NSAttributedString(string: "合计：", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)])
        let att1:NSAttributedString = NSAttributedString(string: "¥0.00", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.red, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)])
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        attributedStrM.append(att)
        attributedStrM.append(att1)
        self.addSubview(self.sumLabel!)
        self.sumLabel?.backgroundColor = UIColor.yellow
        self.sumLabel?.attributedText = attributedStrM
    }
    
    /** 全选按钮点击了 */
    @objc func leftSelectAllBtnDidPress(button:UIButton){
        if self.isSelectAll {
            self.selectAllBtn?.setImage(UIImage.init(named: "GameCenterNewWhite"), for: .normal)
            self.isSelectAll = false
        }else{
            self.selectAllBtn?.setImage(UIImage.init(named: "GameCenterNewAppTag"), for: .normal)
            self.isSelectAll = true
        }
        if (self.footDelegate != nil) {
            self.footDelegate?.selectedAllBtnDidPress(button: button, isSel: self.isSelectAll)
        }
    }
    
    /** lx全选按钮点击了 */
    @objc func accountBtnAllBtnDidPress(button:UIButton){
        if (self.footDelegate != nil) {
            self.footDelegate?.accountBtnDidPress(button: button, isSel: self.isSelectAll)
        }
    }

    
    //更新
    func updateArr(selectedArr:NSArray, dataArr:NSArray){
        //计算价格
        var sumPrice:Float = 0
        //选中商品总数
        var sumCount:NSInteger = 0
        //总的商品数量
        var allCount:NSInteger = 0
        
        for index in 0..<dataArr.count {
            let shopmodel:YCOrderShopModel = dataArr[index] as! YCOrderShopModel
            allCount += shopmodel.goodsArr!.count
        }
        
        for xindex in 0..<selectedArr.count {
            let selArr:NSMutableArray = selectedArr[xindex] as! NSMutableArray
            let count:NSInteger = selArr.count
            sumCount += count
            if count > 0 {
                for jindex in 0..<count {
                    let goodmodel:YCOrderGoodsModel = selArr[jindex] as! YCOrderGoodsModel
                    let price:String = goodmodel.goodsPrice!
                    let priceNum:Float = Float(price)!
                    let ccount:Int = goodmodel.goodsCount!
                    sumPrice += priceNum*Float(ccount)
                }
            }
        }
        let att:NSAttributedString = NSAttributedString(string: "合计：", attributes: [NSAttributedString.Key.foregroundColor  : UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)])
        let ss:String = String.init(format: "￥%.2f", sumPrice)
        let att1:NSAttributedString = NSAttributedString(string: ss, attributes: [NSAttributedString.Key.foregroundColor  : UIColor.red, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)])
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        attributedStrM.append(att)
        attributedStrM.append(att1)
        self.sumLabel?.attributedText = attributedStrM
        
        self.selectCount = sumCount
        
        let accountBtnTile = sumCount > 0 ? String.init(format: "去结算(%ld)", sumCount) : "去结算"
        self.accountBtn?.setTitle(accountBtnTile, for: .normal)
        
        self.isSelectAll = sumCount == allCount ? true : false;
        
        if !self.isSelectAll {
            self.selectAllBtn?.setImage(UIImage.init(named: "GameCenterNewWhite"), for: .normal)
            self.isSelectAll = false
        }else{
            self.selectAllBtn?.setImage(UIImage.init(named: "GameCenterNewAppTag"), for: .normal)
            self.isSelectAll = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 */
