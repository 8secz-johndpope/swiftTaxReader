//
//  TROrderDetailViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TROrderDetailViewController: UIViewController {
//    // bendi
//    var orderModel: TROrderModel?
//    var dataArr: [TROrderDataModel]? = []
    
    var orderID: String?
    convenience init(orderID: String?) {
        self.init()
        self.orderID = orderID
    }
    
    // network
    var orderFindDetailModel: TROrderFindDetailModel?
    var dataArr: [TROrderFindDetailDataOrderDetailModel]? = []
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "订单详情"
        view.navBackButtonClick = {[weak self]() in
            self?.navigationController?.popViewController(animated: true)
        }
        
        return view
    }()
    
    private var page: Int = 1
    private let TROrderDetailHeaderViewID = "TROrderDetailHeaderView"
    private let TROrderDetailFooterViewID = "TROrderDetailFooterView"
    private let TROrderTableViewCellID = "TROrderTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        tableView.register(TROrderDetailHeaderView.self, forHeaderFooterViewReuseIdentifier: TROrderDetailHeaderViewID)
        tableView.register(TROrderDetailFooterView.self, forHeaderFooterViewReuseIdentifier: TROrderDetailFooterViewID)
        tableView.register(TROrderTableViewCell.self, forCellReuseIdentifier: TROrderTableViewCellID)
        
        return tableView
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        setupLayout()
        NetworkOrderFindDetail(more: false)
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
}

extension TROrderDetailViewController {
    func NetworkOrderFindDetail(more: Bool) {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.orderFindDetailModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.orderFindDetailModel?.msg ?? "", view: self.view)
                return
            }
            self.orderFindDetailModel = self.networkViewModel.orderFindDetailModel
            self.dataArr = self.networkViewModel.orderFindDetailModel?.data?.OrderDetail
            self.tableView.reloadData()
        }
        
        networkViewModel.refreshDataSource_OrderFindDetail(OrderID: self.orderID ?? "", PageIndex: "", PageSize: "")
    }
}

extension TROrderDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataModel: TROrderFindDetailDataModel = self.orderFindDetailModel?.data ?? TROrderFindDetailDataModel.init()
        let detailModel: TROrderFindDetailDataOrderDetailModel = self.dataArr?[indexPath.row] ?? TROrderFindDetailDataOrderDetailModel.init()
        
        let cell: TROrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: TROrderTableViewCellID, for: indexPath) as! TROrderTableViewCell
        cell.findDetailDataModel = dataModel
        cell.findDetailDataDetailModel = detailModel
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        //self.cellDidSelectRowAt(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90 + 104 + 64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model: TROrderFindDetailDataModel = self.orderFindDetailModel?.data ?? TROrderFindDetailDataModel.init()
        let headerView: TROrderDetailHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TROrderDetailHeaderViewID) as! TROrderDetailHeaderView
        headerView.titleString = model.OrderDate
        headerView.findDetailDataModel = model
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.lightGray
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let model: TROrderFindDetailDataModel = self.orderFindDetailModel?.data ?? TROrderFindDetailDataModel.init()
        return model.OrderStatus == 1 ? 66 + 134 : 30 + 134
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: TROrderDetailFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TROrderDetailFooterViewID) as! TROrderDetailFooterView
        
       let model: TROrderFindDetailDataModel = self.orderFindDetailModel?.data ?? TROrderFindDetailDataModel.init()
        footerView.isHasActionPayView = model.OrderStatus == 1 ? true : false
        footerView.delegate = self
        footerView.findDetailDataDetailModelArray = model.OrderDetail
        footerView.findDetailDataModel = model
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = UIColor.white
    }
}

extension TROrderDetailViewController: TROrderTableViewCellDelegate{
    func cellInvoiceButtonDidSelected(button: UIButton, cell: TROrderTableViewCell) {
        let nextVc = TRInvoiceTicketViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    func cellCodeButtonDidSelected(button: UIButton, cell: TROrderTableViewCell) {
        
        let nextVc = TROrderCodeViewController(orderDetailID: "\(cell.detailModel?.OrderDetailID ?? 0)")
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension TROrderDetailViewController: TROrderDetailFooterViewDelegate{
    func viewCancelOrderButtonDidSelected(button: UIButton, view: TROrderDetailFooterView) {
        print("取消订单")
    }
    
    func viewPayButtonDidSelected(button: UIButton, view: TROrderDetailFooterView) {
        print("去支付")
    }
    
    func cellDidSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVc = TROrderDetailViewController()
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
