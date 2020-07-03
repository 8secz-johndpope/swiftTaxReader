//
//  TRCartSureOrderViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRCartSureOrderViewController: UIViewController {
    
    var dataArrayShopModel: [YCOrderShopModel]?
    var totolNumberText: Int = 0
    var totolPriceText: Double = 0.00
    convenience init(dataArrayShopModel: [YCOrderShopModel]?) {
        self.init()
        self.dataArrayShopModel = dataArrayShopModel
        
//        let shopModel:YCOrderShopModel = self.dataArrayShopModel?[indexPath.section] ?? YCOrderShopModel.init()
//        let _:YCOrderGoodsModel = shopModel.goodsArr?[indexPath.row] ?? YCOrderGoodsModel()
        
        var totolNumberText: Int = 0
        var totolPriceText: Double = 0.00
        if self.dataArrayShopModel?.count ?? 0 > 0 {
            for lindex in 0..<self.dataArrayShopModel!.count {
                let shopModel:YCOrderShopModel = self.dataArrayShopModel?[lindex] ?? YCOrderShopModel.init()
                if shopModel.goodsArr?.count ?? 0 > 0 {
                    for jlindex in 0..<shopModel.goodsArr!.count {
                        let goodsModel:YCOrderGoodsModel = shopModel.goodsArr?[jlindex] ?? YCOrderGoodsModel()
                        totolNumberText = totolNumberText + (goodsModel.ProductCount ?? 0)
                        let ProductCountDouble = Double(goodsModel.ProductCount ?? 0)
                        totolPriceText = Double(totolPriceText + ((goodsModel.Product?.ProdIOSPrice ?? 0.00) * ProductCountDouble))
                    }
                }
            }
        }
        
        self.totolNumberText = totolNumberText
        self.totolPriceText = totolPriceText
    }
    
    var userAddressId: String? = "0"
    var userInvoiceId: String? = "0"
    var payModelSelectedItem: String? = "0"
    var selectedInvoiceType: String? = "0"
    var dataArrayCartItems: NSMutableArray = NSMutableArray.init()
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "确认订单"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    lazy var dingAddressView: TRCartDingAddressView = {
        let view = TRCartDingAddressView.init(frame: .zero)
        view.coverButtonClickBlock = {[unowned self](button) in
            let nextVc = TRAddressViewController()
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
        
        return view
    }()
    
    private let TRCartHeaderViewID = "TRCartHeaderView"
    private let TRCartFooterViewID = "TRCartFooterView"
    private let TRCartPayFooterViewID = "TRCartPayFooterView"
    private let ZYCCartTableViewCellID = "ZYCCartTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        tableView.register(TRCartHeaderView.self, forHeaderFooterViewReuseIdentifier: TRCartHeaderViewID)
        tableView.register(TRCartFooterView.self, forHeaderFooterViewReuseIdentifier: TRCartFooterViewID)
        tableView.register(TRCartPayFooterView.self, forHeaderFooterViewReuseIdentifier: TRCartPayFooterViewID)
        tableView.register(ZYCCartTableViewCell.self, forCellReuseIdentifier: ZYCCartTableViewCellID)
        
        return tableView
    }()
    
    lazy var dingFooterView: TRCartDingFooterView = {
        let view = TRCartDingFooterView.init(frame: .zero)
        view.totolNumberText = "\(self.totolNumberText)"
        view.totolPrice = Float(self.totolPriceText)
        view.footerButtonClickBlock = {[weak self](button) in
            self?.blockPay(button: button)
        }

        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.dingAddressView)
        self.dingAddressView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(104)
        }
        
        self.view.addSubview(self.dingFooterView)
        self.dingFooterView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(64)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.dingAddressView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.dingFooterView.snp.top)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        NetworkAddressGetDefault()
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
    
    lazy var networkBodyViewModel: TaxReaderHttpBodyViewModel = {
        return TaxReaderHttpBodyViewModel()
    }()
}

extension TRCartSureOrderViewController {
    func NetworkAddressGetDefault() {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.addressGetDefaultModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.addressGetDefaultModel?.msg ?? "", view: self.view)
                return
            }
            
            if ((self.networkViewModel.addressGetDefaultModel?.data) != nil) {
                self.dingAddressView.isHasDefaultAddress = true
                self.dingAddressView.getDefaultAddressDataModel = self.networkViewModel.addressGetDefaultModel?.data
                
                let addressID = self.networkViewModel.addressGetDefaultModel?.data?.UserAddrID
                self.userAddressId = "\(addressID ?? 0)"
            }else {
                self.dingAddressView.isHasDefaultAddress = false
            }
        }
        
        networkViewModel.refreshDataSource_AddressGetDefault()
    }
}

extension TRCartSureOrderViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArrayShopModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let shopmodel:YCOrderShopModel = self.dataArrayShopModel?[section] ?? YCOrderShopModel.init()
        return shopmodel.goodsArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ZYCCartTableViewCell = tableView.dequeueReusableCell(withIdentifier: ZYCCartTableViewCellID, for: indexPath) as! ZYCCartTableViewCell
        
        let shopModel:YCOrderShopModel = self.dataArrayShopModel?[indexPath.section] ?? YCOrderShopModel.init()
        let _:YCOrderGoodsModel = shopModel.goodsArr?[indexPath.row] ?? YCOrderGoodsModel()
        cell.xgoodModel = shopModel.goodsArr?[indexPath.row]
        
        cell.isHasSelectButton = false
        cell.isHasOripriceLabel = false
        cell.isHasNumberAction = false
        cell.isHasNumberView = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 49
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: TRCartHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRCartHeaderViewID) as! TRCartHeaderView
        let shopmodel:YCOrderShopModel = self.dataArrayShopModel?[section] ?? YCOrderShopModel.init()
        headerView.titleString = shopmodel.shopName
        headerView.isHasSelectButton = false
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.lightGray
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == ((self.dataArrayShopModel?.count ?? 0) - 1) ? 88 : 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == ((self.dataArrayShopModel?.count ?? 0) - 1) {
            let footerView: TRCartPayFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRCartPayFooterViewID) as! TRCartPayFooterView
            footerView.itemCoverViewTapBlock = {[weak self](isPayType, isTicketType) in
                if isPayType {
                    let nextVc = TROrderPaytypeViewController()
                    nextVc.presentBackCommitBlock = {[unowned self](payModelSelectedItem) in
                        footerView.payTypeView.trDetailTitleText = payModelSelectedItem == "0" ? "支付宝支付" : "微信支付"
                        self?.payModelSelectedItem = payModelSelectedItem
                    }
                    self?.present(nextVc, animated: true, completion: nil)
                }
                
                if isTicketType {
                    let nextVc = TROrderTicketTypeViewController()
                    nextVc.presentBackCommitBlock = {[unowned self](userInvoiceID, selectedInvoiceType) in
                        self?.userInvoiceId = userInvoiceID
                        self?.selectedInvoiceType = selectedInvoiceType
                        footerView.ticketTypeView.trDetailTitleText = selectedInvoiceType
                    }
                    let nextNavc = UINavigationController(rootViewController: nextVc)
                    self?.present(nextNavc, animated: true, completion: nil)
                }
            }
            
            return footerView
        } else {
            let footerView: TRCartFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRCartFooterViewID) as! TRCartFooterView
            
            return footerView
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if section == ((self.dataArrayShopModel?.count ?? 0) - 1) {
            let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
            footerView.contentView.backgroundColor = UIColor.red
        } else {
            let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
            footerView.contentView.backgroundColor = UIColor.lightGray
        }
    }
}

extension TRCartSureOrderViewController {
    func blockPay(button: UIButton) {
        if self.dataArrayShopModel?.count ?? 0 > 0 {
            for lindex in 0..<self.dataArrayShopModel!.count {
                let shopModel:YCOrderShopModel = self.dataArrayShopModel?[lindex] ?? YCOrderShopModel.init()
                if shopModel.goodsArr?.count ?? 0 > 0 {
                    for jindex in 0..<shopModel.goodsArr!.count {
                        let goodModel:YCOrderGoodsModel = shopModel.goodsArr?[jindex] ?? YCOrderGoodsModel()
                        dataArrayCartItems.add("\(goodModel.CartItemID ?? 0)")
                    }
                }
            }
        }
        
        // 创建订单
        let urlstring = "/v1/Order/Create"

        let cartItemsArray:NSMutableArray = NSMutableArray.init()
        for lindex in 0..<dataArrayCartItems.count {
            let cartItemID = dataArrayCartItems[lindex]
            let cartItemsParms:NSMutableDictionary = NSMutableDictionary.init()
            cartItemsParms.setValue(cartItemID, forKey: "CartItemID")
            cartItemsArray.add(cartItemsParms)
        }
        
        let payModel = self.payModelSelectedItem == "0" ? PayModelAliLKL : PayModelWeixin
        let parmeters:NSMutableDictionary = NSMutableDictionary.init()
        parmeters.setValue(self.userAddressId, forKey: "UserAddressID")
        parmeters.setValue(self.userInvoiceId, forKey: "UserInvoiceID")
        parmeters.setValue(OrderForm, forKey: "OrderForm") // 安卓20 iOS 30
        parmeters.setValue(payModel, forKey: "PayModel") // 支付宝 5
        parmeters.setValue(cartItemsArray, forKey: "CartItems")

        networkBodyViewModel.updateBlock = {[unowned self] in
            print(self.networkBodyViewModel.orderCreateModel?.msg ?? "")
            if payModel == PayModelAliLKL {
                self.payAliLKL(orderCreateData: self.networkBodyViewModel.orderCreateModel?.data ?? TROrderCreateDataModel.init())
            }
            if payModel == PayModelWeixin {
                self.payWeixin(orderCreateData: self.networkBodyViewModel.orderCreateModel?.data ?? TROrderCreateDataModel.init())
            }
        }
        networkBodyViewModel.refreshDataSource_OrderCreate(URLPath: urlstring, parmeters: parmeters)
    }
    
    func payAliLKL(orderCreateData: TROrderCreateDataModel) {
        /* demo的值
        {
            code = 000000;
            data =     {
                h5JumpUrl = "aHR0cHM6Ly9pbnRwYXkubGFrYWxhLmNvbS9sa2wvaHRtbC9zY2FucGF5L2luZGV4Lmh0bWw/a215UGpSSWc0UTBXS2dIbGxSeEp0ckRyQkNYMW5rd01zclFlcjFyNHNtTU93Y3k2VW5qOHY0d2h0eTcwNWwxcQ==";
                merchantId = 872100010015005;
                orderId = "d9885d11-310c-407d-8";
                returnCode = 000000;
                returnMessage = SUCCESS;
                secretKey = "<null>";
                success = 1;
                token = 20200624RPM0020200624725381024422436864;
                tradeNo = 20200624725381024422436864;
                tradeType = ALIPAYAPP;
                xcxReqpath = "<null>";
                xcxUsername = "<null>";
            };
            message = "\U4ea4\U6613\U6210\U529f";
        }
         */
        
        /* 后台数据拼接的
            {
                code = 000000;
                data =     {
                    h5JumpUrl = "aHR0cHM6Ly9pbnRwYXkubGFrYWxhLmNvbS9sa2wvaHRtbC9zY2FucGF5L2luZGV4Lmh0bWw/anB0b1g5Q1UyZ0RBZGk1bXpaclYyWmxpdlZ2RmJxVHBpZ25taytUY2RHR25ieGZJKzY1aHI1RmdReXAyeVFYOQ==";
                    merchantId = 872100016015000;
                    orderId = 637292215182073679;
                    returnCode = 0;
                    returnMessage = SUCCESS;
                    success = 1;
                    token = 20200701RPM0020200701727939483168808960;
                    tradeNo = 20200701727939483168808960;
                    tradeType = ALIPAYAPP;
                    xcxReqpath = "";
                    xcxUsername = "";
                };
                message = "\U4ea4\U6613\U6210\U529f";
            }
         */
        let dataObject:NSMutableDictionary = NSMutableDictionary.init()
        dataObject.setValue(orderCreateData.h5JumpUrl, forKey: "h5JumpUrl")
        dataObject.setValue(orderCreateData.merchantId, forKey: "merchantId")
        dataObject.setValue(orderCreateData.orderId, forKey: "orderId")
        dataObject.setValue("\(orderCreateData.returnCode)", forKey: "returnCode")
        dataObject.setValue(orderCreateData.returnMessage, forKey: "returnMessage")
        dataObject.setValue(orderCreateData.secretKey, forKey: "secretKey")
        dataObject.setValue("1", forKey: "success")
        dataObject.setValue(orderCreateData.token, forKey: "token")
        dataObject.setValue(orderCreateData.tradeNo, forKey: "tradeNo")
        dataObject.setValue("ALIPAYAPP", forKey: "tradeType")
        dataObject.setValue("", forKey: "xcxReqpath")
        dataObject.setValue("", forKey: "xcxUsername")
        
        let responseObject:NSMutableDictionary = NSMutableDictionary.init()
        responseObject.setValue("000000", forKey: "code")
        responseObject.setValue(dataObject, forKey: "data")
        responseObject.setValue("交易成功", forKey: "message")
        
        print("responseObject = \(responseObject)")
        PaymaxSDK.pay(withAliToken: responseObject as! [AnyHashable : Any], viewController: self) { (result) in
            print("resultType = \(Int(result.type.rawValue))")
            switch result.type {
            case .PAYMAX_CODE_SUCCESS:
                break
            case .PAYMAX_CODE_FAIL_CANCEL:
                break
            case .PAYMAX_CODE_ERROR_DEAL:
                break
            case .PAYMAX_CODE_FAILURE:
                break
            case .PAYMAX_CODE_ERROR_CONNECT:
                break
            case .PAYMAX_CODE_CHANNEL_WRONG:
                break
            case .PAYMAX_CODE_ERROR_CHARGE_PARAMETER:
                break
            case .PAYMAX_CODE_ERROR_WX_NOT_INSTALL:
                break
            case .PAYMAX_CODE_ERROR_WX_NOT_SUPPORT_PAY:
                break
            case .PAYMAX_CODE_ERROR_WX_UNKNOW:
                break
            @unknown default:
                break
            }
        }
        
        
        self.pushToPaySuccessVc()
    }
    
    func payWeixin(orderCreateData: TROrderCreateDataModel) {
        /*
            {
              "msgCode" : "200",
              "data" : {
                "sign" : "616CB993AE38C77E006D4A683C58F7E4",
                "appid" : "wx8592574799e9e9ba",
                "nonce_str" : "pAjStTPcv2UcgSLF",
                "timeStamp" : "1593653755",
                "prepay_id" : "wx020935347180998538f31f461986871100",
                "result_code" : "SUCCESS",
                "trade_type" : "APP",
                "orderPKID" : 341,
                "mch_id" : "1503726251",
                "OrderID" : "637292793551217531"
              },
              "ret" : true,
              "msg" : "订单创建成功"
            }
         */
        
//        let req = WXApiRequestHandler.jumpToBizPay()
//        print("req = \(req ?? "")")
        
//        /** 商家向财付通申请的商家id */
//        @property (nonatomic, retain) NSString *partnerId;
//        /** 预支付订单 */
//        @property (nonatomic, retain) NSString *prepayId;
//        /** 随机串，防重发 */
//        @property (nonatomic, retain) NSString *nonceStr;
//        /** 时间戳，防重发 */
//        @property (nonatomic, assign) UInt32 timeStamp;
//        /** 商家根据财付通文档填写的数据和签名 */
//        @property (nonatomic, retain) NSString *package;
//        /** 商家根据微信开放平台文档对数据做的签名 */
//        @property (nonatomic, retain) NSString *sign;
        
        if !WXApi.isWXAppInstalled() {
            MBProgressHUD.showWithText(text: "没有安装微信", view: self.view)
            return
        }
        
        if !WXApi.isWXAppSupport() {
            MBProgressHUD.showWithText(text: "不支持微信支付", view: self.view)
            return
        }
        
        //调起微信支付
        let req = PayReq.init()
        req.partnerId = orderCreateData.mch_id
        req.prepayId = orderCreateData.prepay_id
        req.nonceStr = orderCreateData.nonce_str
        req.timeStamp = UInt32(Date().timeStamp) ?? 0
        req.package = "Sign=WXPay"
        
        let appid = orderCreateData.appid ?? ""
        let noncestr = orderCreateData.nonce_str ?? ""
        let package = "Sign=WXPay"
        let partnerid = orderCreateData.mch_id ?? ""
        let prepayid = orderCreateData.prepay_id ?? ""
        let timestamp = "\(req.timeStamp)"
        let keyString = "key=zhongguoshuiwuzazhishe63886786KF"
        
        let signString = "appid=\(appid)&noncestr=\(noncestr)&package=\(package)&partnerid=\(partnerid)&prepayid=\(prepayid)&timestamp=\(timestamp)&\(keyString)"
        let sign = signString.md5Encrypt()
        req.sign = sign
        
        WXApi.send(req)
    }
    
    func pushToPaySuccessVc() {
        let nextVc = TRPaySuccessViewController(orderID: "")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
