//
//  TRNoPayViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TRNoPayViewController: UIViewController {
//    // bendi
//    var orderModel: TROrderModel?
//    var dataArr: [TROrderDataModel]? = []
    
    // network
    var orderFindModel: TROrderFindModel?
    var dataArr: [TROrderFindDataModel]? = []
    var payModelSelectedItem: String? = "0"
    
    private var page: Int = 1
    
    private let TROrderHeaderViewID = "TROrderHeaderView"
    private let TROrderFooterViewID = "TROrderFooterView"
    private let TROrderTableViewCellID = "TROrderTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        tableView.register(TROrderHeaderView.self, forHeaderFooterViewReuseIdentifier: TROrderHeaderViewID)
        tableView.register(TROrderFooterView.self, forHeaderFooterViewReuseIdentifier: TROrderFooterViewID)
        tableView.register(TROrderTableViewCell.self, forCellReuseIdentifier: TROrderTableViewCellID)
        tableView.uHead = URefreshHeader{ [weak self] in
            self?.NetworkOrderFind(more: false)
        }
        
        tableView.uFoot = URefreshFooter{ [weak self] in
            self?.NetworkOrderFind(more: true)
        }
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        setupLayout()
        NetworkOrderFind(more: false)
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TRNoPayViewController {
    func NetworkOrderFind(more: Bool) {
        networkViewModel.updateBlock = {[unowned self] in
            self.tableView.uHead.endRefreshing()
            if self.dataArr?.count == self.networkViewModel.orderFindModel?.totalCount {
                self.tableView.uFoot.endRefreshingWithNoMoreData()
            }else {
                self.tableView.uFoot.endRefreshing()
            }
            
            if more == false { self.dataArr?.removeAll() }
            self.dataArr?.append(contentsOf: self.networkViewModel.orderFindModel?.data ?? [])
            self.tableView.reloadData()
        }
        
        page = (more ? ( page + 1) : 1)
        print("page = \(page)")
        networkViewModel.refreshDataSource_OrderFind(OrderStatus: "1", PageIndex: "\(page)", PageSize: "5")
    }
}

extension TRNoPayViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model: TROrderFindDataModel = self.dataArr?[section] ?? TROrderFindDataModel.init()
        return model.OrderDetail?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataModel: TROrderFindDataModel = self.dataArr?[indexPath.section] ?? TROrderFindDataModel.init()
        let detailModel: TROrderFindDataDetailModel = dataModel.OrderDetail?[indexPath.row] ?? TROrderFindDataDetailModel.init()
        
        let cell: TROrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: TROrderTableViewCellID, for: indexPath) as! TROrderTableViewCell
        cell.dataModel = dataModel
        cell.detailModel = detailModel
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        self.cellDidSelectRowAt(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model: TROrderFindDataModel = self.dataArr?[section] ?? TROrderFindDataModel.init()
        let headerView: TROrderHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TROrderHeaderViewID) as! TROrderHeaderView
        headerView.titleString = model.OrderDate
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.lightGray
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let model: TROrderFindDataModel = self.dataArr?[section] ?? TROrderFindDataModel.init()
        var cellHeight = 30
        if model.OrderStatus == NetDataOrderStatus {// 立即支付按钮
            cellHeight += 36
        }
        
        if model.OrderInvoiceStatus == NetDataOrderInvoiceStatus { // 补开发票按钮
            cellHeight += 36
        }
        
        return CGFloat(cellHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: TROrderFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TROrderFooterViewID) as! TROrderFooterView
        
        let model: TROrderFindDataModel = self.dataArr?[section] ?? TROrderFindDataModel.init()
        footerView.isHasActionPayView = model.OrderStatus == NetDataOrderStatus ? true : false
        footerView.isHasActionInvoiceView = model.OrderInvoiceStatus == NetDataOrderInvoiceStatus ? true : false
        footerView.delegate = self
        footerView.detailModelArray = model.OrderDetail
        footerView.orderFindDataModel = model
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = UIColor.white
    }
}

extension TRNoPayViewController: TROrderTableViewCellDelegate{
    func cellInvoiceButtonDidSelected(button: UIButton, cell: TROrderTableViewCell) {
        let nextVc = TRInvoiceTicketViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    func cellCodeButtonDidSelected(button: UIButton, cell: TROrderTableViewCell) {
        let nextVc = TROrderCodeViewController(orderDetailID: "\(cell.detailModel?.OrderDetailID ?? 0)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension TRNoPayViewController: TROrderFooterViewDelegate{
    func cellDidSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataModel: TROrderFindDataModel = self.dataArr?[indexPath.section] ?? TROrderFindDataModel.init()
        //let detailModel: TROrderFindDataDetailModel = dataModel.OrderDetail?[indexPath.row] ?? TROrderFindDataDetailModel.init()
        
        let nextVc = TROrderDetailViewController(orderID: "\(dataModel.OrderID)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
        
    func viewCancelOrderButtonDidSelected(button: UIButton, view: TROrderFooterView) {
        print("取消订单")
    }
    
    func viewPayButtonDidSelected(button: UIButton, view: TROrderFooterView, model: TROrderFindDataModel?) {
        let nextVc = TROrderPaytypeViewController()
        nextVc.presentBackCommitBlock = {[unowned self](payModelSelectedItem) in
            self.payModelSelectedItem = payModelSelectedItem
            
            // 调用二次创建订单接口，开始支付
            let model: TROrderFindDataModel = self.dataArr?[button.tag] ?? TROrderFindDataModel.init()
            let patModel = self.payModelSelectedItem == "0" ? PayModelAliLKL : PayModelWeixin
            self.NetworkOrderSecpay(payModel: patModel, orderID: "\(model.OrderID)")
        }
        
        self.present(nextVc, animated: true, completion: nil)
    }
    
    func viewInvoiceButtonDidSelected(button: UIButton, view: TROrderFooterView, model: TROrderFindDataModel?) {
        let nextVc = TROrderTicketTypeViewController()
        nextVc.presentBackCommitBlock = {[unowned self](userInvoiceID, selectedInvoiceType) in
            self.NetworkOrderRebuildInvoice(OrderID: "\(model?.OrderID ?? 0)", UserInvoiceID: userInvoiceID)
        }
        let nextNavc = UINavigationController(rootViewController: nextVc)
        self.present(nextNavc, animated: true, completion: nil)
    }
}

extension TRNoPayViewController{
    // 补开发票
    func NetworkOrderRebuildInvoice(OrderID: String!, UserInvoiceID: String!) {
        networkViewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.networkViewModel.orderRebuildInvoiceModel?.msg ?? "", view: self.view)
            if self.networkViewModel.orderRebuildInvoiceModel?.ret == false {
                return
            }
        }
        
        networkViewModel.refreshDataSource_OrderRebuildInvoice(OrderID: OrderID,
                                                               PayModel: "",
                                                               OrderForm: "",
                                                               UserAddressID: "",
                                                               UserInvoiceID: UserInvoiceID)
    }
    
    func NetworkOrderSecpay(payModel: String, orderID: String) {
        networkViewModel.updateBlock = {[unowned self] in
            if payModel == PayModelAliLKL {
                self.payAliLKL(orderCreateData: self.networkViewModel.orderCreateModel?.data ?? TROrderCreateDataModel.init())
            }
            if payModel == PayModelWeixin {
                self.payWeixin(orderCreateData: self.networkViewModel.orderCreateModel?.data ?? TROrderCreateDataModel.init())
            }
        }
        
        networkViewModel.refreshDataSource_OrderSecpay(OrderForm: OrderForm, PayModel: payModel, OrderID: orderID)
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



