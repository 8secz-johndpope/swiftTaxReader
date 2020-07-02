//
//  TRCartViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/4/14.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRCartViewController: UIViewController {
    
    /** 数据源 */
    var dataArr:NSMutableArray = NSMutableArray.init()
    /** 选择的数据 */
    var selectedArr:NSMutableArray = NSMutableArray.init()
    /** 购物车中选择的商品，传值到确认订单页面*/
    var valueProductModelArr:NSMutableArray = NSMutableArray.init()
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "购物车"
        view.rightBarTitleNormal = "编辑"
        view.rightBarTitleSelected = "完成"
        view.navRightButtonClick = {[weak self](button) in
            view.rightButton.isSelected = !view.rightButton.isSelected
            self?.toolView.trEditBackView.isHidden = view.rightButton.isSelected ? false : true
            self?.toolView.trTotalBackView.isHidden = view.rightButton.isSelected ? true : false
        }
        
        return view
    }()
    
    private let TRCartHeaderViewID = "TRCartHeaderView"
    private let TRCartFooterViewID = "TRCartFooterView"
    private let TRCartTableViewCellID = "TRCartTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        tableView.register(TRCartHeaderView.self, forHeaderFooterViewReuseIdentifier: TRCartHeaderViewID)
        tableView.register(TRCartFooterView.self, forHeaderFooterViewReuseIdentifier: TRCartFooterViewID)
        tableView.register(TRCartTableViewCell.self, forCellReuseIdentifier: TRCartTableViewCellID)
        
        return tableView
    }()
    
    lazy var toolView: TRCartToolView = {
        let view = TRCartToolView.init(frame: .zero)
        view.backgroundColor = UIColor.lightGray
        
        return view
    }()
        
    // 数据
    lazy var viewModel: TRCartViewModel = {
        return TRCartViewModel()
    }()
    
    func loadNetData() {
        viewModel.updateBlock = {[unowned self] in
            
        }
        
        // viewModel.refreshDataSource(UserID: "", PageIndex: "", PageSize: "") // 网络
        viewModel.getLocalCartJson() // 本地
        
        // 初始化选择的数组
        for index in 0..<viewModel.cartDataArray!.count {
            let model:TRDataModel = (viewModel.cartDataArray?[index])!
            self.dataArr.add(model)
        }
        //self.dataArr = viewModel.cartDataArray as! NSMutableArray
        for _ in 0..<self.dataArr.count {
            let tempArr = NSMutableArray.init()
            self.selectedArr.add(tempArr)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        loadNetData()
    }
}

extension TRCartViewController {
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.toolView)
        self.toolView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-LXTabBarHeight)
            make.height.equalTo(64)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.bottom.equalTo(self.toolView.snp.top)
            make.left.right.equalToSuperview()
        }
    }
}

extension TRCartViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TRCartTableViewCell = tableView.dequeueReusableCell(withIdentifier: TRCartTableViewCellID, for: indexPath) as! TRCartTableViewCell
        cell.dataRowModel = viewModel.cartDataArray?[indexPath.section].data?[indexPath.row]
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let model:TRDataModel = self.dataArr[section] as! TRDataModel
        return model.data!.count > 0 ? 49 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: TRCartHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRCartHeaderViewID) as! TRCartHeaderView
        headerView.titleString = viewModel.cartDataArray?[section].addDate
        headerView.headerSelectButtonClick = {(button) in
            
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.lightGray
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: TRCartFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TRCartFooterViewID) as! TRCartFooterView
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footerView.contentView.backgroundColor = UIColor.lightGray
    }
}

extension TRCartViewController: TRCartTableViewCellDelegate {
    func cellDidSelected(model: TRDataRowModel, cell: TRCartTableViewCell) {
        print("点击cell，跳转商品详情")
    }
    
    func cellAddButtonDidSelected(model: TRDataRowModel, cell: TRCartTableViewCell) {
        print("点击 + ，跳转商品详情")
    }
    
    func cellReduceButtonDidSelected(model: TRDataRowModel, cell: TRCartTableViewCell) {
        print("点击 - ，跳转商品详情")
    }
    
    func cellLeftButtonDidSelected(model: TRDataRowModel, cell: TRCartTableViewCell, isSelected: Bool) {
        var shopModelIndex:Int?
        var goodModelIndex:Int?
        for shop_Index in 0..<self.dataArr.count {
            var shopmodel:TRDataModel = self.dataArr[shop_Index] as! TRDataModel
            let arr:[TRDataRowModel] = shopmodel.data!
            if arr.count > 0 {
                for good_index in 0..<arr.count {
                    var good_model:TRDataRowModel = arr[good_index]
                    if good_model.CartItemID == model.CartItemID {
                        good_model.rowIsSelected = isSelected
                        shopModelIndex = self.dataArr.index(of: shopmodel)
//                        goodModelIndex = arr.firstIndex(of: good_model)
                        
//                        let tempArr:NSMutableArray = self.selectedArr[shopModelIndex!] as! NSMutableArray
//                        if isSelected {
//                            //装入数组
//                            if !tempArr.contains(model) {
//                                tempArr.add(model)
//                                if tempArr.count == shopmodel.data?.count {
//                                    shopmodel.shopIsAllSelected = true
//                                }else{
//                                    shopmodel.shopIsAllSelected = false
//                                }
//                            }
//
//                        }else{
//                            if tempArr.contains(model) {
//                                tempArr.remove(model)
//                                shopmodel.shopIsAllSelected = false
//                            }
//                        }
                        
                    }
                }
            }
        }
        
//        self.updateData()
    }
}


