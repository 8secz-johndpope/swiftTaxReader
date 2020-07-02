//
//  TRBuyActionSheetViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/24.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

protocol TRBuyActionSheetViewControllerDelegate: NSObjectProtocol {
    func sheetViewBuyButtonDidSelected(dataArrayShopModel:[YCOrderShopModel]?)
}

class TRBuyActionSheetViewController: UIViewController {
    
    var isHasCurrentPian: Bool?
    
    weak var delegate: TRBuyActionSheetViewControllerDelegate?
    
    var productIssueNumberDataModel: TRProductGetIssueNumberDataModel?
    
    fileprivate var coverVeiw = UIView()
    fileprivate var contentView = UIView()
    fileprivate var contentViewHeight: CGFloat {
        return 44 * 2 + 76 + 53
    }
    
    lazy var titleView: TRBuyActionTitleView = {
        let view = TRBuyActionTitleView.init(frame: .zero)
        view.trCancelButton.addTarget(self, action: #selector(cancelButtonClick(button:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc func cancelButtonClick(button:UIButton) {
        sheetViewDismiss()
    }
    
    lazy var segmentView: TRBuyActionSegmentView = {
        let view = TRBuyActionSegmentView.init(frame: .zero)
        view.isHasCurrentPian = self.isHasCurrentPian
        view.footerButtonClickBlock = {[unowned self](button) in
            self.blockButtonActionSegment(button: button)
        }
        
        return view
    }()
    
    lazy var buyContentView: TRBuyActionContentView = {
        let view = TRBuyActionContentView.init(frame: .zero)
        view.isHasCurrentPian = self.isHasCurrentPian
        
        return view
    }()
    
    lazy var toolView: TRBuyActionToolView = {
        let view = TRBuyActionToolView.init(frame: .zero)
        view.footerButtonClick = {[unowned self](button) in
            if button.tag == 1 {
                self.blockButtonActionToCart(button: button)
            }
            
            if button.tag == 2 {
                self.blockButtonActionToBuy(button: button)
            }
        }
        
        return view
    }()
    
    func setupLayout() {
        self.contentView.addSubview(self.titleView)
        self.titleView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.contentView.addSubview(self.segmentView)
        self.segmentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleView.snp.bottom).offset(0.5)
            make.left.right.equalToSuperview()
            make.height.equalTo(52)
        }
        
        self.contentView.addSubview(self.toolView)
        self.toolView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.contentView.addSubview(self.buyContentView)
        self.buyContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.segmentView.snp.bottom).offset(0.5)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.toolView.snp.top)
        }
    }

    
    required init?(model: TRProductGetIssueNumberDataModel?) {
        super.init(nibName: nil, bundle: nil)
        // 初始化
        self.productIssueNumberDataModel = model;
        self.isHasCurrentPian = model?.isHasCurrentPian
        
        view.backgroundColor = UIColor.clear
        self.providesPresentationContextTransitionStyle = true
        self.definesPresentationContext = true
        self.modalPresentationStyle = .custom
        
        // 初始化UI
        setupUIViews()
        setupNetworkData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.25) {
            var frame = self.contentView.frame
            frame.origin.y = kScreenHeight - self.contentViewHeight
            self.contentView.frame = frame
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    lazy var networkBodyViewModel: TaxReaderHttpBodyViewModel = {
        return TaxReaderHttpBodyViewModel()
    }()
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

// MARK: 初始化UI
extension TRBuyActionSheetViewController {
    func setupUIViews() {
        coverVeiw = UIView(frame: CGRect(x: 0, y: 0, width:kScreenWidth, height: kScreenHeight))
        coverVeiw.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.addSubview(coverVeiw)
        
        contentView = UIView.init(frame: CGRect.init(x: 0, y: kScreenHeight, width: kScreenWidth, height: contentViewHeight))
        contentView.backgroundColor = UIColor.lightGray
        coverVeiw.addSubview(contentView)
        
        setupLayout()
    }
    
    func setupNetworkData() {
        let model: TRProductGetIssueNumberDataModel? = self.productIssueNumberDataModel
        self.buyContentView.productIssueNumberModel = model
    }
}

// MARK: 点击屏幕弹出退出
extension TRBuyActionSheetViewController {
    func sheetViewDismiss() {
        UIView.animate(withDuration: 0.25, animations: {
            var frame = self.contentView.frame
            frame.origin.y = kScreenHeight
            self.contentView.frame = frame
            self.coverVeiw.alpha = 0
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        sheetViewDismiss()
//    }
    
    @objc func cancelBtnDidClick(btn: UIButton) {
        sheetViewDismiss()
    }
}





extension TRBuyActionSheetViewController {
    func blockButtonActionSegment(button: UIButton) {
        self.buyContentView.segButtonTag = button.tag
        print("button = \(button.tag)")
        
        self.toolView.isOnlyCartButton = button.tag == 2 ? true : false
    }
    
    func blockButtonActionToCart(button: UIButton) {
        cartBatchAdd(isBuy: false)
    }
    
    func blockButtonActionToBuy(button: UIButton) {
        cartBatchAdd(isBuy: true)
    }
    
    func cartBatchAdd(isBuy: Bool?) {
        let segTag = self.buyContentView.segButtonTag ?? 1
        
        var dataArrayProductID: [String]? = []
        var dataArrayProductCount: [String]? = []
        let dataModel: TRProductGetIssueNumberDataModel? = self.productIssueNumberDataModel
        switch segTag {
        case 0:
            let ProductID = "\(dataModel?.ProID ?? 0)"
            let ProductCount = "1"
            dataArrayProductID?.append(ProductID)
            dataArrayProductCount?.append(ProductCount)
        case 1:
            let model: TRProductGetIssueNumberDataCurrentModel? = dataModel?.CurrProduct
            let ProductID = "\(model?.ProdID ?? 0)"
            let ProductCount = self.buyContentView.trContentBenView.trNumberLabel.text ?? ""
            dataArrayProductID?.append(ProductID)
            dataArrayProductCount?.append(ProductCount)
        case 2:
            let dataArrBatchModel: [TRProductGetIssueNumberDataBatchModel]? = dataModel?.BatchProduct
            for lindex in 0..<dataArrBatchModel!.count {
                let model: TRProductGetIssueNumberDataBatchModel? = dataArrBatchModel?[lindex]
                let ProductID = "\(model?.ProdID ?? 0)"
                let ProductCount = "1"
                dataArrayProductID?.append(ProductID)
                dataArrayProductCount?.append(ProductCount)
            }
        case 3:
            let model: TRProductGetIssueNumberDataYearModel? = dataModel?.YearProduct
            let ProductID = "\(model?.ProdID ?? 0)"
            let ProductCount = self.buyContentView.trContentNianView.trNumberLabel.text ?? ""
            dataArrayProductID?.append(ProductID)
            dataArrayProductCount?.append(ProductCount)
            
        default:
            let model: TRProductGetIssueNumberDataCurrentModel? = dataModel?.CurrProduct
            let ProductID = "\(model?.ProdID ?? 0)"
            let ProductCount = self.buyContentView.trContentBenView.trNumberLabel.text ?? ""
            dataArrayProductID?.append(ProductID)
            dataArrayProductCount?.append(ProductCount)
        }
        
        // 数组中的数据
        let urlstring = "/v1/Cart/BatchAdd"
        let cartArray:NSMutableArray = NSMutableArray.init()
        for lindex in 0..<dataArrayProductID!.count {
            let ProductID = dataArrayProductID?[lindex]
            let ProductCount = dataArrayProductCount?[lindex]
            let productParms:NSMutableDictionary = NSMutableDictionary.init()
            productParms.setValue(ProductID, forKey: "ProductID")
            productParms.setValue(ProductCount, forKey: "ProductCount")
            productParms.setValue("1", forKey: "Type")
            cartArray.add(productParms)
        }
        print("responseObject = \(cartArray)")
        networkBodyViewModel.updateBlock = {[unowned self] in
            print(self.networkBodyViewModel.cartBatchAddModel?.msg ?? "")
            
            // 购买
            if isBuy ?? false {
                let dataArrayBatchAdd = self.networkBodyViewModel.cartBatchAddModel?.data
                let dataString = dataArrayBatchAdd?.joined(separator: ",")
                self.cartGetByID(CartItemIDS: dataString ?? "")
            }else {
                MBProgressHUD.showWithText(text: self.networkBodyViewModel.cartBatchAddModel?.msg ?? "", view: self.view)
                self.sheetViewDismiss()
            }
        }
        networkBodyViewModel.refreshDataSource_CartBatchAdd(URLPath: urlstring, parmetersArray: cartArray)
    }
    
    func cartGetByID(CartItemIDS: String?) {
        self.networkViewModel.getCartByIDUpdateBlock = {[unowned self] in
            if self.networkViewModel.cartGetByIDModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.cartGetByIDModel?.msg ?? "", view: self.view)
                return
            }
            
            self.sheetViewDismiss()
            
            let dataArrayModel: [TRCartGetCartByIDDataModel]? = self.networkViewModel.cartGetByIDModel?.data
            self.pushToCartSureVcWithShopModel(dataArrayModel: dataArrayModel)
        }
        self.networkViewModel.refreshDataSource_CartGetCartByID(CartItemIDS: CartItemIDS ?? "")
    }
    
    func pushToCartSureVcWithShopModel(dataArrayModel: [TRCartGetCartByIDDataModel]?) {
        
        var shopArray: [YCOrderShopModel]? = []
        
        let shopModel = YCOrderShopModel.init()
        shopModel.shopName = Date().getCurrentDay()
        
        var goodsArray: [YCOrderGoodsModel]? = []
        
        for lindex in 0..<dataArrayModel!.count {
            let model: TRCartGetCartByIDDataModel? = dataArrayModel?[lindex]
            let netProductModel: TRCartGetCartByIDDataProductModel? = model?.Product
            
            let goodsModel = YCOrderGoodsModel.init()
            goodsModel.CartItemID = model?.CartItemID
            goodsModel.ProductCount = model?.ProductCount
            goodsModel.shopName = shopModel.shopName
            
            let productModel = TROrderProductModel.init()
            productModel.ProdName = netProductModel?.ProdName
            productModel.ProdPrice = netProductModel?.ProdPrice
            productModel.ProdIOSPrice = netProductModel?.ProdIOSPrice
            productModel.ProdYear = netProductModel?.ProdYear

            goodsModel.Product = productModel
            
            goodsArray?.append(goodsModel)
            
            shopModel.goodsArr = goodsArray
        }
        
        shopArray?.append(shopModel)
        
        if delegate != nil && ((self.delegate?.responds(to: Selector.init(("cellDidPress")))) != nil) {
            self.delegate?.sheetViewBuyButtonDidSelected(dataArrayShopModel: shopArray)
        }
    }
}
