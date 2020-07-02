//
//  TRCartTableViewCell.swift
//  TaxReader
//
//  Created by asdc on 2020/4/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRCartTableViewCellDelegate: NSObjectProtocol {
    /**cell点击了*/
    func cellDidSelected(model:TRDataRowModel, cell:TRCartTableViewCell)
    /**加号按钮点击了*/
    func cellAddButtonDidSelected(model:TRDataRowModel, cell:TRCartTableViewCell)
    /**减号按钮点击了*/
    func cellReduceButtonDidSelected(model:TRDataRowModel, cell:TRCartTableViewCell)
    /**左侧选择按钮点击了*/
    func cellLeftButtonDidSelected(model:TRDataRowModel, cell:TRCartTableViewCell, isSelected:Bool)
}

class TRCartTableViewCell: UITableViewCell {
    
    /** 左侧按钮 */
    var isLeftBtnSelected: Bool = false
    
    weak var delegate: TRCartTableViewCellDelegate?
    
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
        button.addTarget(self, action: #selector(selectButtonClick(button:)), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(numberReduceButtonClick(button:)), for: .touchUpInside)
        button.tag = 2
        
        return button
    }()
    
    lazy var trNumberAddButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.white
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(numberAddButtonClick(button:)), for: .touchUpInside)
        button.tag = 3
        
        return button
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
    
    // 模型数据赋值
    var productModel:TRDataProductModel? {
        didSet {
            guard let model = productModel else {return}
            self.trNameLabel.text = model.ProdName
            
//            let prodImageName = model.ProdImg ?? ""
//            let prodImageURL = "\(appAPI)\(prodImageName)"
//            self.trLeftImageView.sd_setImage(with: URL(string: prodImageURL), placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
    
    var dataRowModel: TRDataRowModel? {
        didSet {
            guard let model = dataRowModel else {return}
            
            if model.rowIsSelected {
                self.setButtonImage(imageName: "LX选中", button: self.trSelectButton)
                self.isLeftBtnSelected = true
            }else{
                self.setButtonImage(imageName: "LX圆环", button: self.trSelectButton)
                self.isLeftBtnSelected = false
            }
            self.trNameLabel.text = model.Product?.ProdName
        }
    }
    
    //MARK: -- activity
    /** 左侧选择的按钮点击了 */
    @objc func selectButtonClick(button:UIButton) {
        if self.isLeftBtnSelected {
            self.setButtonImage(imageName: "LX圆环", button: self.trSelectButton)
            self.isLeftBtnSelected = false
        }else{
            self.setButtonImage(imageName: "LX选中", button: self.trSelectButton)
            self.isLeftBtnSelected = true
        }
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("selectButtonClick")))) != nil) {
            self.delegate?.cellLeftButtonDidSelected(model: self.dataRowModel!, cell: self, isSelected: self.isLeftBtnSelected)
        }
    }
    
    /** 减号按钮点击了 */
    @objc func numberReduceButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("numberReduceButtonClick")))) != nil) {
            self.delegate?.cellReduceButtonDidSelected(model: self.dataRowModel!, cell: self)
        }
    }

    /** 加号按钮点击了 */
    @objc func numberAddButtonClick(button:UIButton) {
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("numberAddButtonClick")))) != nil) {
            self.delegate?.cellAddButtonDidSelected(model: self.dataRowModel!, cell: self)
        }
    }
    
    /** cell点击 */
    @objc func cellDidPress(tap:UITapGestureRecognizer){
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("cellDidPress")))) != nil) {
            self.delegate?.cellDidSelected(model: self.dataRowModel!, cell: self)
        }
    }

    //MARK: -- tool_func
    func setButtonImage(imageName:String, button:UIButton){
        button.setImage(UIImage.init(named: imageName), for: .normal)
    }
}
