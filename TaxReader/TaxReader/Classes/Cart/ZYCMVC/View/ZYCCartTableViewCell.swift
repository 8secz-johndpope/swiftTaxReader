//
//  ZYCCartTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/5/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol ZYCCartTableViewCellDelegate: NSObjectProtocol {
    /**cell点击了*/
    func shopCellDidPress(goodModel:YCOrderGoodsModel, cell:ZYCCartTableViewCell)
    /**加号按钮点击了*/
    func addBtnDidPress(goodModel:YCOrderGoodsModel, cell:ZYCCartTableViewCell)
    /**减号按钮点击了*/
    func minusBtnDidPress(goodModel:YCOrderGoodsModel, cell:ZYCCartTableViewCell)
    /**左侧选择按钮点击了*/
    func leftSelBtnDidPress(goodModel:YCOrderGoodsModel, cell:ZYCCartTableViewCell, isSel:Bool)
}

class ZYCCartTableViewCell: UITableViewCell {
    
    /** 左侧按钮 */
    var isLeftBtnSel:Bool = false
        
    private lazy var trBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var trSelectButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setImage(UIImage.init(named: "LX圆环"), for: .normal)
        button.setImage(UIImage.init(named: "LX选中"), for: .selected)
        button.addTarget(self, action: #selector(leftSelBtnDidPress(button:)), for: .touchUpInside)
        button.tag = 1
        
        return button
    }()
        
    lazy var trLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellow
        imageView.kf.setImage(with: URL(string: "http://app.ctax.org.cn/uploadfiles/magazines/b09fd794-62b6-4ffe-8c37-6954f4596857.jpg"))
        
        return imageView
    }()
    
    lazy var trNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.blue
        label.text = "世界税收信息"
        
        return label
    }()
    
    lazy var trTimeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        label.text = "2020年 第2期 总第425期"
        
        return label
    }()
    
    lazy var trPriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.red
        label.text = "￥ 46.90"
        
        return label
    }()
    
    lazy var trOripriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        label.text = "￥ 460"
        
        return label
    }()
    
    // 数量加减
    lazy var trNumberBackView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.lightGray
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        
        return view
    }()
    
    lazy var trNumberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        label.text = "1"
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var trNumberReduceButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("-", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(minusBtnDidPress(button:)), for: .touchUpInside)
        button.tag = 2
        
        return button
    }()
    
    lazy var trNumberAddButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(addBtnDidPress(button:)), for: .touchUpInside)
        button.tag = 3
        
        return button
    }()
    
    lazy var trHasNumberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.text = "10"
        label.textAlignment = .center
        label.isHidden = true
        
        return label
    }()
    
    func setupLayout() {
        self.addSubview(self.trBackView)
        self.trBackView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        self.trBackView.addSubview(self.trSelectButton)
        self.trSelectButton.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
        
        self.trBackView.addSubview(self.trLeftImageView)
        self.trLeftImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(self.trSelectButton.snp.right).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(self.trLeftImageView.snp.height).dividedBy(3.1 / 2)
        }
        
        self.trBackView.addSubview(self.trNameLabel)
        self.trNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trLeftImageView.snp.top).offset(12)
            make.left.equalTo(self.trLeftImageView.snp.right).offset(8)
            make.right.equalTo(-8)
        }
        
        self.trBackView.addSubview(self.trTimeLabel)
        self.trTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.trNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.trNameLabel.snp.leading)
        }
        
        self.trBackView.addSubview(self.trPriceLabel)
        self.trPriceLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.trNameLabel.snp.leading).offset(12)
            make.bottom.equalTo(self.trLeftImageView.snp.bottom).offset(-12)
        }
        
        self.trBackView.addSubview(self.trOripriceLabel)
        self.trOripriceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.trPriceLabel.snp.right).offset(8)
            make.bottom.equalTo(self.trPriceLabel.snp.bottom)
        }
        
        self.trBackView.addSubview(self.trNumberBackView)
        self.trNumberBackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.trLeftImageView.snp.bottom)
            make.right.equalToSuperview().offset(-12)
            make.width.equalTo(114)
            make.height.equalTo(38)
        }
        
        self.trNumberBackView.addSubview(self.trNumberLabel)
        self.trNumberLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalToSuperview()
        }
        
        self.trNumberBackView.addSubview(self.trNumberReduceButton)
        self.trNumberReduceButton.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(self.trNumberLabel.snp.left).offset(-0.5)
        }
        
        self.trNumberBackView.addSubview(self.trNumberAddButton)
        self.trNumberAddButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(self.trNumberLabel.snp.right).offset(0.5)
        }
        
        self.trBackView.addSubview(self.trHasNumberLabel)
        self.trHasNumberLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.trLeftImageView.snp.bottom)
            make.right.equalToSuperview().offset(-12)
            make.width.equalTo(114)
            make.height.equalTo(38)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        
        //点击手势
        let sigleTap = UITapGestureRecognizer.init(target: self, action: #selector(cellDidPress(tap:)))
        self.addGestureRecognizer(sigleTap)
        self.setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    var isHasOripriceLabel: Bool? {
        didSet {
            guard let isHasOripriceLabel = isHasOripriceLabel else {
                return
            }
            
            self.trOripriceLabel.isHidden = isHasOripriceLabel ? false : true
        }
    }
    
    var isHasNumberAction: Bool? {
        didSet {
            guard let isHasNumberAction = isHasNumberAction else {
                return
            }
            
            self.trNumberBackView.isHidden = isHasNumberAction ? false : true
        }
    }
    
    var isHasNumberView: Bool? {
        didSet {
            guard let isHasNumberView = isHasNumberView else {
                return
            }
            
            self.trHasNumberLabel.isHidden = isHasNumberView ? false : true
        }
    }
    
    //代理
    weak var YCcellDelegate:ZYCCartTableViewCellDelegate?
    
    //数据模型
    private var _xgoodModel:YCOrderGoodsModel?
    var xgoodModel:YCOrderGoodsModel?{
        get{
            return _xgoodModel
        }
        set{
            _xgoodModel = newValue
            if _xgoodModel!.goodsIsSelect {
                self.setBtnImage(imageName: "LX选中", button: self.trSelectButton)
                self.isLeftBtnSel = true
            }else{
                self.setBtnImage(imageName: "LX圆环", button: self.trSelectButton)
                self.isLeftBtnSel = false
            }
            
            self.trLeftImageView.sd_setImage(with: URL(string: "\(appIp)\(_xgoodModel?.Product?.ProdImg ?? "")"),
                                        placeholderImage: UIImage.init(named: "DefaultS"),
                                        options: .allowInvalidSSLCertificates,
                                        context: nil)
            self.trNameLabel.text = _xgoodModel?.Product?.ProdName
            self.trTimeLabel.text = "\(_xgoodModel?.Product?.ProdYear ?? 0)"
            self.trOripriceLabel.text = "\(_xgoodModel?.Product?.ProdPrice ?? 0.0)"
            self.trPriceLabel.text = "\(_xgoodModel?.Product?.ProdIOSPrice ?? 0.0)"
            self.trNumberLabel.text = "\(_xgoodModel?.ProductCount ?? 0)"
            self.trHasNumberLabel.text = "\(_xgoodModel?.ProductCount ?? 0)"
        }
    }

    //MARK: -- activity
    /** 左侧选择的按钮点击了 */
    @objc func leftSelBtnDidPress(button:UIButton){
        if self.isLeftBtnSel {
            self.setBtnImage(imageName: "LX圆环", button: self.trSelectButton)
            self.isLeftBtnSel = false
        }else{
            self.setBtnImage(imageName: "LX选中", button: self.trSelectButton)
            self.isLeftBtnSel = true
        }
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.leftSelBtnDidPress(goodModel: self.xgoodModel!, cell: self, isSel: self.isLeftBtnSel)
        }
    }
    /** 减号按钮点击了 */
    @objc func minusBtnDidPress(button:UIButton){
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.minusBtnDidPress(goodModel: self.xgoodModel!, cell: self)
        }
    }
    /** 加号按钮点击了 */
    @objc func addBtnDidPress(button:UIButton){
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.addBtnDidPress(goodModel: self.xgoodModel!, cell: self)
        }
    }
    /** cell点击 */
    @objc func cellDidPress(tap:UITapGestureRecognizer){
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.shopCellDidPress(goodModel: self.xgoodModel!, cell: self)
        }
    }
    //MARK: -- tool_func
    func setBtnImage(imageName:String, button:UIButton){
        button.setImage(UIImage.init(named: imageName), for: .normal)
    }
}


/*
class ZYCCartTableViewCell: UITableViewCell {
    
    let cellHeight:CGFloat = 100//整体的高度
    let boardWidth:CGFloat = 10
    let backHeight:CGFloat = 90//背景内容的高度
    let backWidth:CGFloat =  LXScreenWidth-10 //内容的宽
    let smallBtnWH:CGFloat = 25 //右下角按钮尺寸
    let leftSelBtnWH:CGFloat = 30
    
    /** 背景View */
    var backView:UIView?
    /** 左侧选择的按钮 */
    var leftSelBtn:UIButton?
    /** 商品的图片 */
    var commodityImageView:UIImageView?
    /** 商品名字 */
    var commodityNameLabel:UILabel?
    /** 商品详情label */
    var commodityDetailLabel:UILabel?
    /** 价格label */
    var priceLabel:UILabel?
    /** 减号按钮 */
    var minusBtn:UIButton?
    /** 数量label */
    var countLabel:UILabel?
    /** 加号按钮 */
    var addBtn:UIButton?
    
    /** 左侧按钮 */
    var isLeftBtnSel:Bool = false

    
    //代理
    weak var YCcellDelegate:ZYCCartTableViewCellDelegate?
    
    //数据模型
    private var _xgoodModel:YCOrderGoodsModel?
    var xgoodModel:YCOrderGoodsModel?{
        get{
            return _xgoodModel
        }
        set{
            _xgoodModel = newValue
            if _xgoodModel!.goodsIsSelect {
                self .setBtnImage(imageName: "sight_moments_mute_selected", button: self.leftSelBtn!)
                self.isLeftBtnSel = true
            }else{
                self .setBtnImage(imageName: "sight_moments_mute_select", button: self.leftSelBtn!)
                self.isLeftBtnSel = false
            }
            self.commodityNameLabel?.text = _xgoodModel?.goodsName
            self.countLabel?.text = "\(_xgoodModel?.goodsCount ?? 0)"
            self.priceLabel?.text = _xgoodModel?.goodsPrice
            self.commodityDetailLabel?.text = _xgoodModel?.goodsDescription
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //背景
        self.backView = UIView.init(frame: CGRect(x: 0, y: boardWidth*0.5, width: LXScreenWidth - boardWidth, height: cellHeight-boardWidth))
        self.backView?.backgroundColor = .white
        self.contentView.addSubview(self.backView!)
        
        //左侧选中按钮
        self.leftSelBtn = UIButton.init()
        self.leftSelBtn?.addTarget(self, action: #selector(leftSelBtnDidPress(button:)), for: .touchUpInside)
        self.backView?.addSubview(self.leftSelBtn!)
        
        //商品imageview
        self.commodityImageView = UIImageView.init()
        self.commodityImageView?.image = UIImage.init(named: "CreditCard_ShoppingBag")
        self.backView?.addSubview(self.commodityImageView!)
        
        //商品标题label
        self.commodityNameLabel = UILabel.init()
        self.commodityNameLabel?.textColor = .black
        self.commodityNameLabel?.font = UIFont.systemFont(ofSize: 18)
        self.backView?.addSubview(self.commodityNameLabel!)
        
        //商品详情描述label
        self.commodityDetailLabel = UILabel.init()
        self.commodityDetailLabel?.font = UIFont.systemFont(ofSize: 15)
        self.commodityDetailLabel?.textColor = .black
        self.commodityDetailLabel?.numberOfLines = 0
        self.backView?.addSubview(self.commodityDetailLabel!)
        
        //价格label
        self.priceLabel = UILabel.init()
        self.priceLabel?.textColor = UIColor.colorWithCustom(r: 245, g: 61, b: 28)
        self.priceLabel?.font = UIFont.systemFont(ofSize: 18)
        self.priceLabel?.textAlignment = .right
        self.backView?.addSubview(self.priceLabel!)
        
        //减号按钮
        self.minusBtn = UIButton.init()
        self.minusBtn?.setImage(UIImage.init(named: "RemoveGroupMemberBtn"), for: .normal)
        self.minusBtn?.setImage(UIImage.init(named: "RemoveGroupMemberBtnHL"), for: .highlighted)
        self.minusBtn?.addTarget(self, action: #selector(minusBtnDidPress(button:)), for: .touchUpInside)
        self.backView?.addSubview(self.minusBtn!)
        
        //中间数量label
        self.countLabel = UILabel.init()
        self.countLabel?.textAlignment = .center
        self.countLabel?.textColor = .black
        self.countLabel?.font = UIFont.systemFont(ofSize: 18)
        self.backView?.addSubview(self.countLabel!)
        
        //加号按钮
        self.addBtn = UIButton.init()
        self.addBtn?.setImage(UIImage.init(named: "AlbumAddBtn"), for: .normal)
        self.addBtn?.setImage(UIImage.init(named: "AlbumAddBtnHL"), for: .highlighted)
        self.addBtn?.addTarget(self, action: #selector(addBtnDidPress(button:)), for: .touchUpInside)
        self.backView?.addSubview(self.addBtn!)
        
        //点击手势
        let sigleTap = UITapGestureRecognizer.init(target: self, action: #selector(cellDidPress(tap:)))
        self.addGestureRecognizer(sigleTap)
        self.setNeedsDisplay()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.leftSelBtn?.frame = CGRect(x: boardWidth, y: (backHeight - leftSelBtnWH)*0.5, width: leftSelBtnWH, height: leftSelBtnWH)
        
        self.commodityImageView?.frame = CGRect(x: 2*boardWidth+leftSelBtnWH, y: boardWidth*0.5, width: backHeight - boardWidth, height: backHeight - boardWidth)
        
        self.priceLabel?.frame = CGRect(x: backWidth - 80 - boardWidth, y: boardWidth, width: 80, height: 30)
        
        self.commodityNameLabel?.frame = CGRect(x: (self.commodityImageView?.yc_right())! + boardWidth, y: boardWidth, width: backWidth - 5*boardWidth - leftSelBtnWH - self.commodityImageView!.yc_width() - self.priceLabel!.yc_width(), height: 25)
        
        self.addBtn?.frame = CGRect(x: backWidth - boardWidth - smallBtnWH, y: (self.backView?.yc_bottom())! - boardWidth - smallBtnWH, width: smallBtnWH, height: smallBtnWH)
        
        self.countLabel?.frame = CGRect(x: (self.addBtn?.yc_originX())! - boardWidth*0.5-smallBtnWH, y: (self.addBtn?.yc_originY())!, width: smallBtnWH, height: smallBtnWH)
        
        self.minusBtn?.frame = CGRect(x: (self.countLabel?.yc_originX())! - boardWidth*0.5 - smallBtnWH, y: (self.addBtn?.yc_originY())!, width: smallBtnWH, height: smallBtnWH)
        
        self.commodityDetailLabel?.frame = CGRect(x: (self.commodityImageView?.yc_right())! + boardWidth, y: (self.commodityNameLabel?.yc_bottom())! + boardWidth*0.5, width: backWidth - 5.5 * boardWidth - (self.leftSelBtn?.yc_width())! - (self.commodityImageView!.yc_width()) - smallBtnWH*3, height: backHeight - boardWidth * 2 - (self.commodityNameLabel?.yc_height())!)
    }

    //MARK: -- activity
    /** 左侧选择的按钮点击了 */
    @objc func leftSelBtnDidPress(button:UIButton){
        if self.isLeftBtnSel {
            self.setBtnImage(imageName: "sight_moments_mute_select", button: self.leftSelBtn!)
            self.isLeftBtnSel = false
        }else{
            self.setBtnImage(imageName: "sight_moments_mute_selected", button: self.leftSelBtn!)
            self.isLeftBtnSel = true
        }
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.leftSelBtnDidPress(goodModel: self.xgoodModel!, cell: self, isSel: self.isLeftBtnSel)
        }
    }
    /** 减号按钮点击了 */
    @objc func minusBtnDidPress(button:UIButton){
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.minusBtnDidPress(goodModel: self.xgoodModel!, cell: self)
        }
    }
    /** 加号按钮点击了 */
    @objc func addBtnDidPress(button:UIButton){
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.addBtnDidPress(goodModel: self.xgoodModel!, cell: self)
        }
    }
    /** cell点击 */
    @objc func cellDidPress(tap:UITapGestureRecognizer){
        if (self.YCcellDelegate != nil) {
            self.YCcellDelegate?.shopCellDidPress(goodModel: self.xgoodModel!, cell: self)
        }
    }
    //MARK: -- tool_func
    func setBtnImage(imageName:String, button:UIButton){
        button.setImage(UIImage.init(named: imageName), for: .normal)
    }
}
 */
