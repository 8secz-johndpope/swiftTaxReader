//
//  TRHadPayViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TRHadPayViewController: UIViewController {
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

extension TRHadPayViewController {
    func NetworkOrderFind(more: Bool) {
        networkViewModel.updateBlock = {[unowned self] in
            
            if self.networkViewModel.orderFindModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.orderFindModel?.msg ?? "", view: self.view)
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.orderFindModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkOrderFind(more: more)
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            
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
        networkViewModel.refreshDataSource_OrderFind(OrderStatus: "3", PageIndex: "\(page)", PageSize: "5")
    }
}

extension TRHadPayViewController: UITableViewDataSource, UITableViewDelegate {
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

extension TRHadPayViewController: TROrderTableViewCellDelegate {
    func cellInvoiceButtonDidSelected(button: UIButton, cell: TROrderTableViewCell) {
        let nextVc = TRInvoiceTicketViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    func cellCodeButtonDidSelected(button: UIButton, cell: TROrderTableViewCell) {
        let nextVc = TROrderCodeViewController(orderDetailID: "\(cell.detailModel?.OrderDetailID ?? 0)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension TRHadPayViewController: TROrderFooterViewDelegate{
    func viewCancelOrderButtonDidSelected(button: UIButton, view: TROrderFooterView) {
        print("取消订单")
    }
        
    func cellDidSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataModel: TROrderFindDataModel = self.dataArr?[indexPath.section] ?? TROrderFindDataModel.init()
        //let detailModel: TROrderFindDataDetailModel = dataModel.OrderDetail?[indexPath.row] ?? TROrderFindDataDetailModel.init()
        
        let nextVc = TROrderDetailViewController(orderID: "\(dataModel.OrderID)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    func viewPayButtonDidSelected(button: UIButton, view: TROrderFooterView, model: TROrderFindDataModel?) {
        
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

extension TRHadPayViewController{
    // 补开发票
    func NetworkOrderRebuildInvoice(OrderID: String!, UserInvoiceID: String!) {
        networkViewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.networkViewModel.orderRebuildInvoiceModel?.msg ?? "", view: self.view)
            if self.networkViewModel.orderRebuildInvoiceModel?.ret == false {
                
                // 3000 authorization参数不能为空
                if self.networkViewModel.orderRebuildInvoiceModel?.msgCode == NetDataAuthorizationNull {
                    let alertController = LXAlertController.alertAlert(title: TokenNullTitle, message: TokenNullDetailTitle, okTitle: TokenNullActionDefault, cancelTitle: TokenNullActionCancel) {
                        let popoverView = TRWLoginViewController()
                        popoverView.modalPresentationStyle = .custom
                        popoverView.isTypeShowFromTokenNull = true
                        popoverView.loginReloadBlock = {[unowned self] in
                            self.NetworkOrderRebuildInvoice(OrderID: OrderID, UserInvoiceID: UserInvoiceID)
                        }
                        self.present(popoverView, animated: true, completion: nil)
                    }
                    self.present(alertController, animated: true, completion: nil)
                }

                
                return
            }
        }
        
        networkViewModel.refreshDataSource_OrderRebuildInvoice(OrderID: OrderID,
                                                               PayModel: "",
                                                               OrderForm: "",
                                                               UserAddressID: "",
                                                               UserInvoiceID: UserInvoiceID)
    }
}



