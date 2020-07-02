//
//  ZYCCartViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/5/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class ZYCCartViewController: UIViewController {
    
    private var page: Int = 1
    
    
    /** 数据源 */
    var dataArr:NSMutableArray = NSMutableArray.init()
    /** 选择的数据 */
    var selectedArr:NSMutableArray = NSMutableArray.init()
    
    var valueGoodsModelArr:NSMutableArray = NSMutableArray.init()
    
    lazy var msgContentView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var msgContentLabel: UILabel = {
        let view = UILabel.init(frame: .zero)
        view.backgroundColor = UIColor.white
        view.text = "请先添加数据到购物车"
        
        return view
    }()
    
    lazy var navView: UIView = {
        let view = LXNavigationBarView.init(frame: .zero)
        view.titleString = "购物车"
        view.isFirstView = true
        view.rightBarTitleNormal = "编辑"
        view.rightBarTitleSelected = "完成"
        view.navRightButtonClick = {[weak self](button) in
            view.rightButton.isSelected = !view.rightButton.isSelected
            self?.toolView.trEditBackView.isHidden = view.rightButton.isSelected ? false : true
            self?.toolView.trTotalBackView.isHidden = view.rightButton.isSelected ? true : false
        }
        
        return view
    }()
    
    private let ZYCCartHeaderViewID = "ZYCCartHeaderView"
    private let TRCartFooterViewID = "TRCartFooterView"
    private let ZYCCartTableViewCellID = "ZYCCartTableViewCell"
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        tableView.register(ZYCCartHeaderView.self, forHeaderFooterViewReuseIdentifier: ZYCCartHeaderViewID)
        tableView.register(TRCartFooterView.self, forHeaderFooterViewReuseIdentifier: TRCartFooterViewID)
        tableView.register(ZYCCartTableViewCell.self, forCellReuseIdentifier: ZYCCartTableViewCellID)
        
        return tableView
    }()
    
    lazy var toolView: ZYCCartToolView = {
        let view = ZYCCartToolView.init(frame: .zero)
        view.backgroundColor = UIColor.lightGray
        view.footDelegate = self
        
        return view
    }()
    
    func setupLayout() {
        self.view.addSubview(self.navView)
        self.navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(LXNavBarHeight)
        }
        
        self.view.addSubview(self.msgContentView)
        self.msgContentView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        self.msgContentView.addSubview(self.msgContentLabel)
        self.msgContentLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.dataArr.removeAllObjects()
        self.selectedArr.removeAllObjects()
        self.valueGoodsModelArr.removeAllObjects()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        
        // initData()
        NetworkCartInfo(more: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    lazy var networkViewModel: TaxReaderViewModel = {
        return TaxReaderViewModel()
    }()
    
    lazy var networkBodyViewModel: TaxReaderHttpBodyViewModel = {
        return TaxReaderHttpBodyViewModel()
    }()
}

extension ZYCCartViewController {
    func NetworkCartInfo(more: Bool) {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.cartInfoModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.cartInfoModel?.msg ?? "", view: self.view)
                return
            }
            
            let dataArrString = self.networkViewModel.cartInfoJson?["data"].description
            let dataArr:NSArray = self.getArrayFromJSONString(jsonString: dataArrString ?? "") as! NSMutableArray
            
            if dataArr.count == 0 {
                self.toolView.isHidden = true
                self.tableView.isHidden = true
                self.msgContentView.isHidden = false
            } else {
                self.toolView.isHidden = false
                self.tableView.isHidden = false
                self.msgContentView.isHidden = true
                
                for index in 0..<dataArr.count {
                    let dict:NSDictionary = dataArr[index] as! NSDictionary
                    let shopModel = YCOrderShopModel.init()
                    shopModel.setValue(dict["data"], forKey: "data")
                    shopModel.setValue(dict["addDate"], forKey: "addDate")
                    self.dataArr.add(shopModel)
                }
                self.tableView.reloadData()
                
                //初始化选择的数组
                for _ in 0..<self.dataArr.count {
                    let tempArr = NSMutableArray.init()
                    self.selectedArr.add(tempArr)
                }
            }
        }
        
        networkViewModel.refreshDataSource_cartInfo(PageIndex: "", PageSize: "")
    }
    
    func NetworkCartUpdateNumber(CartItemID: String?, Number: String?) {
        networkViewModel.updateBlock = {[unowned self] in
            if self.networkViewModel.cartUpdateNumbeModel?.ret == false {
                MBProgressHUD.showWithText(text: self.networkViewModel.cartUpdateNumbeModel?.msg ?? "", view: self.view)
                return
            }
        }
        
        networkViewModel.refreshDataSource_cartUpdateNumber(CartItemID: CartItemID ?? "", Number: Number ?? "")
    }
}

extension ZYCCartViewController {
    func initData(){
        /*
        let plistPath: String = Bundle.main.path(forResource: "Cart2", ofType: "plist")!
        let dataDict:NSDictionary = NSDictionary(contentsOfFile:plistPath) ?? [:]
        let dataArr:NSArray = dataDict["data"] as! NSArray
         */
        
        let path = Bundle.main.path(forResource: "Cart2", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url)
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            let json = JSON(jsonData)
            print("jsonData = \(json)")
            
            let dataArrString = json["data"].description
            let dataArr:NSArray = getArrayFromJSONString(jsonString: dataArrString) as! NSMutableArray
            
            for index in 0..<dataArr.count {
                let dict:NSDictionary = dataArr[index] as! NSDictionary
                let shopModel = YCOrderShopModel.init()
                shopModel.setValue(dict["data"], forKey: "data")
                shopModel.setValue(dict["addDate"], forKey: "addDate")
                self.dataArr.add(shopModel)
            }
            self.tableView.reloadData()
            
            //初始化选择的数组
            for _ in 0..<self.dataArr.count {
                let tempArr = NSMutableArray.init()
                self.selectedArr.add(tempArr)
            }
            
            
        } catch let error as Error? {
            print("读取本地数据出现错误!",error!)
        }
    }
    
    func getArrayFromJSONString(jsonString:String) ->NSArray{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return array as! NSArray
    }
}

extension ZYCCartViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let shopModel:YCOrderShopModel = self.dataArr[section] as! YCOrderShopModel
        return shopModel.goodsArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ZYCCartTableViewCell = tableView.dequeueReusableCell(withIdentifier: ZYCCartTableViewCellID, for: indexPath) as! ZYCCartTableViewCell
        cell.backgroundColor = UIColor.colorWithCustom(r: 242, g: 242, b: 242)
        let shopModel:YCOrderShopModel = self.dataArr[indexPath.section] as! YCOrderShopModel
        
        let goodsModel:YCOrderGoodsModel = shopModel.goodsArr?[indexPath.row] ?? YCOrderGoodsModel()
        goodsModel.shopName = shopModel.shopName
        
        cell.xgoodModel = shopModel.goodsArr?[indexPath.row]
        cell.YCcellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let model:YCOrderShopModel = self.dataArr[section] as! YCOrderShopModel
        return model.goodsArr!.count > 0 ? 50 : 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model:YCOrderShopModel = self.dataArr[section] as! YCOrderShopModel
        let headerview = ZYCCartHeaderView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 50))
        headerview.shopModel = model
        headerview.index = section
        headerview.YCHeaderDelegate = self
        return model.goodsArr!.count > 0 ? headerview : nil
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController.init(title: "您确定要删除这个商品吗?", message: "", preferredStyle: .alert)
            let confirmaction = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) in
                let shopmodel:YCOrderShopModel = self.dataArr[indexPath.section] as! YCOrderShopModel
                let arr:[YCOrderGoodsModel] = shopmodel.goodsArr!
                if arr.count > 0{
                    let goodmodel:YCOrderGoodsModel = arr[indexPath.row]
                    
                    // 单个接口进行删除
                    var dataArrayDeleteCartItems: [String] = []
                    dataArrayDeleteCartItems.append("\(goodmodel.CartItemID ?? 0)")
                    self.cartDeleteWithCartItemsArray(dataArrayDeleteCartItems: dataArrayDeleteCartItems)
                    
                    //删除选中的数组
                    if goodmodel.goodsIsSelect {
                        let xxtempArr:NSMutableArray = self.selectedArr[indexPath.section] as! NSMutableArray
                        if xxtempArr.contains(goodmodel) {
                            xxtempArr.remove(goodmodel)
                        }
                    }
                    //删除数据源
                    var tempArr:[YCOrderGoodsModel] = NSMutableArray.init(array: arr) as! [YCOrderGoodsModel]
                    let xxIndex:Int = tempArr.firstIndex(of: goodmodel)!
                    tempArr.remove(at: xxIndex)
                    shopmodel.goodsArr = tempArr
                }
                //更新数据
                self.updateData()
            }
            let cancleAction = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
            alert.addAction(confirmaction)
            alert.addAction(cancleAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
}



//MARK: -- YCOrderShopCartCellDelegate
extension ZYCCartViewController:ZYCCartTableViewCellDelegate{
    func shopCellDidPress(goodModel: YCOrderGoodsModel, cell: ZYCCartTableViewCell) {
        print("点击cell，跳转商品详情")
    }
    
    func addBtnDidPress(goodModel: YCOrderGoodsModel, cell: ZYCCartTableViewCell) {
        self.disposeShopData(goodModel: goodModel, cell: cell, isAdd: true)
    }
    
    func minusBtnDidPress(goodModel: YCOrderGoodsModel, cell: ZYCCartTableViewCell) {
        self.disposeShopData(goodModel: goodModel, cell: cell, isAdd: false)
    }
    
    func leftSelBtnDidPress(goodModel: YCOrderGoodsModel, cell: ZYCCartTableViewCell, isSel: Bool) {
        var shopModelIndex:Int?
        var goodModelIndex:Int?
        for shop_Index in 0..<self.dataArr.count {
            let shopmodel:YCOrderShopModel = self.dataArr[shop_Index] as! YCOrderShopModel
            let arr:[YCOrderGoodsModel] = shopmodel.goodsArr!
            if arr.count > 0 {
                for good_index in 0..<arr.count {
                    let good_model:YCOrderGoodsModel = arr[good_index]
                    if good_model == goodModel {
                        good_model.goodsIsSelect = isSel
                        shopModelIndex = self.dataArr.index(of: shopmodel)
                        goodModelIndex = arr.firstIndex(of: good_model)
                        
                        let tempArr:NSMutableArray = self.selectedArr[shopModelIndex!] as! NSMutableArray
                        if isSel {
                            //装入数组
                            if !tempArr.contains(goodModel) {
                                tempArr.add(goodModel)
                                if tempArr.count == shopmodel.goodsArr?.count {
                                    shopmodel.shopIsAllSelected = true
                                }else{
                                    shopmodel.shopIsAllSelected = false
                                }
                            }
                            
                        }else{
                            if tempArr.contains(goodModel) {
                                tempArr.remove(goodModel)
                                shopmodel.shopIsAllSelected = false
                            }
                        }
                    }
                }
            }
        }
        self.updateData()
    }
    
    func disposeShopData(goodModel:YCOrderGoodsModel, cell:ZYCCartTableViewCell, isAdd:Bool){
        var shopModelIndex:Int?
        var goodModelIndex:Int?
        for shop_Index in 0..<self.dataArr.count {
            let shopmodel:YCOrderShopModel = self.dataArr[shop_Index] as! YCOrderShopModel
            let arr:[YCOrderGoodsModel] = shopmodel.goodsArr!
            if arr.count > 0 {
                for good_index in 0..<arr.count {
                    let good_model:YCOrderGoodsModel = arr[good_index]
                    if good_model == goodModel {
                        shopModelIndex = self.dataArr.index(of: shopmodel)
                        goodModelIndex = arr.firstIndex(of: good_model)
                        
                        let tempArr:NSMutableArray = self.selectedArr[shopModelIndex!] as! NSMutableArray
                        //是选中的那个
                        var count:Int = good_model.ProductCount!
                        if isAdd {
                            if count == 99 {
                                return
                            }
                            count += 1
                        }else{
                            if count == 1{
                                return
                            }
                            count -= 1
                        }
                        
                        // 调用更新数据接口
                        print("\(goodModel.CartItemID ?? 0) \(count)")
                        NetworkCartUpdateNumber(CartItemID: "\(good_model.CartItemID ?? 0)", Number: "\(count)")
                        
                        //更新选中数组中的个数
                        if !tempArr.contains(good_model){
                            //如果没有加入的，加入选中数组
                            goodModel.goodsIsSelect = true
                            tempArr.add(goodModel)
                            if tempArr.count == shopmodel.goodsArr?.count {
                                shopmodel.shopIsAllSelected = true
                            }
                        }
                        let xxindex:Int = tempArr.index(of: good_model)
                        let good:YCOrderGoodsModel = tempArr[xxindex] as! YCOrderGoodsModel
                        good.ProductCount = count
                    }
                }
            }
        }
        self.updateData()
    }
    
}

//MARK: -- headerViewDelegate
extension ZYCCartViewController:ZYCCartHeaderViewDelegate{
    func headerViewDidPress(index: NSInteger, shopmodel: YCOrderShopModel, isSel: Bool) {
        let selmodel:YCOrderShopModel = self.dataArr[index] as! YCOrderShopModel
        selmodel.shopIsAllSelected = isSel
        let arr:[YCOrderGoodsModel] = selmodel.goodsArr!
        for xindex in 0..<arr.count {
            let goodmodel:YCOrderGoodsModel = arr[xindex]
            goodmodel.goodsIsSelect = isSel
        }
        //存入选择数组
        let saveArr:NSMutableArray = self.selectedArr[index] as! NSMutableArray
        if isSel {
            saveArr.setArray(arr)
        }else{
            saveArr.removeAllObjects()
        }
        self.updateData()
    }
}
//MARK: -- FootViewDelegate
extension ZYCCartViewController:ZYCCartToolViewDelegate{
    func favorBtnDidPress(button: UIButton, isSel: Bool) {
        var dataArrayFavorSourceIds: [String] = []
        for lindex in 0..<self.dataArr.count {
            let shopmodel:YCOrderShopModel = self.dataArr[lindex] as! YCOrderShopModel
            let arr:[YCOrderGoodsModel] = shopmodel.goodsArr!
            if arr.count > 0{
                for jindex in 0..<arr.count {
                    let arr1:[YCOrderGoodsModel] = shopmodel.goodsArr!
                    let goodmodel:YCOrderGoodsModel = arr[jindex]
                    if goodmodel.goodsIsSelect {
                        print(goodmodel.goodsName ?? "")
                        
                        for kindex in 0..<self.selectedArr.count {
                            
                            // 删除选中的数组
                            let xxtempArr:NSMutableArray = self.selectedArr[kindex] as! NSMutableArray
                            if xxtempArr.contains(goodmodel) {
                                dataArrayFavorSourceIds.append(goodmodel.Product?.ReadSourceID ?? "")
                            }
                        }
                    }
                }
            }
        }
        
        // 调用接口进行批量添加收藏
        self.favorBatchAddWithSourceIdsArray(dataArrayFavorSourceIds: dataArrayFavorSourceIds)
    }
    
    func favorBatchAddWithSourceIdsArray(dataArrayFavorSourceIds: [String]) {
        networkBodyViewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.networkBodyViewModel.favorBatchAddModel?.msg ?? "", view: self.view)
        }
        
        let urlstring = "/v1/Favor/BatchAdd"
        let cartItemsArray:NSMutableArray = NSMutableArray.init()
        for lindex in 0..<dataArrayFavorSourceIds.count {
            let SourceID = dataArrayFavorSourceIds[lindex]
            let productParms:NSMutableDictionary = NSMutableDictionary.init()
            productParms.setValue(SourceID, forKey: "CartItemID")
            productParms.setValue(SourceID, forKey: "ReadParentID")
            productParms.setValue("20", forKey: "ReadFavoriteType")
            cartItemsArray.add(productParms)
        }
        print("responseObject = \(cartItemsArray)")
        networkBodyViewModel.refreshDataSource_FavorBatchAdd(URLPath: urlstring, parmetersArray: cartItemsArray)
    }
    
    func deleteBtnDidPress(button: UIButton, isSel: Bool) {
    //        // 删除全部
    //        self.selectedArr.removeAllObjects()
    //        self.dataArr.removeAllObjects()
    //        self.updateData()
            
    //        // 删除组
    //        //判断每个店铺是否全选状态
    //        let indexArr:NSMutableArray = NSMutableArray.init()
    //        for lindex in 0..<self.dataArr.count {
    //            let model:YCOrderShopModel = self.dataArr[lindex] as! YCOrderShopModel
    //            let selectarr:NSMutableArray = self.selectedArr[lindex] as! NSMutableArray
    //            model.shopIsAllSelected = model.goodsArr?.count == selectarr.count ? true : false
    //            if model.shopIsAllSelected {
    //                indexArr.add(lindex)
    //            }
    //        }
    //
    //        for index in 0..<indexArr.count {
    //            self.dataArr.removeObject(at: (indexArr[index] as! Int) - index)
    //            self.selectedArr.removeObject(at: (indexArr[index] as! Int) - index)
    //
    //        }
    //        self.updateData()
        
        var dataArrayDeleteCartItems: [String] = []
        for lindex in 0..<self.dataArr.count {
            let shopmodel:YCOrderShopModel = self.dataArr[lindex] as! YCOrderShopModel
            let arr:[YCOrderGoodsModel] = shopmodel.goodsArr!
            if arr.count > 0{
                for jindex in 0..<arr.count {
                    let arr1:[YCOrderGoodsModel] = shopmodel.goodsArr!
                    let goodmodel:YCOrderGoodsModel = arr[jindex]
                    if goodmodel.goodsIsSelect {
                        print(goodmodel.goodsName ?? "")
                        
                        for kindex in 0..<self.selectedArr.count {
                            
                            // 删除选中的数组
                            let xxtempArr:NSMutableArray = self.selectedArr[kindex] as! NSMutableArray
                            if xxtempArr.contains(goodmodel) {
                                dataArrayDeleteCartItems.append("\(goodmodel.CartItemID ?? 0)")
                                xxtempArr.remove(goodmodel)
                            }
                                                        
                            //删除数据源
                            var tempArr:[YCOrderGoodsModel] = NSMutableArray.init(array: arr1) as! [YCOrderGoodsModel]
                            let xxIndex:Int = tempArr.firstIndex(of: goodmodel)!
                            tempArr.remove(at: xxIndex)
                            shopmodel.goodsArr = tempArr
                            
                            //更新数据
                            self.updateData()
                        }

                    }
                }
            }
        }
        
        // 调用接口进行删除
        self.cartDeleteWithCartItemsArray(dataArrayDeleteCartItems: dataArrayDeleteCartItems)
    }
    
    func cartDeleteWithCartItemsArray(dataArrayDeleteCartItems: [String]) {
        networkBodyViewModel.updateBlock = {[unowned self] in
            MBProgressHUD.showWithText(text: self.networkBodyViewModel.cartDeleteModel?.msg ?? "", view: self.view)
            
        }
        
        let urlstring = "/v1/Cart/Delete"
        let cartItemsArray:NSMutableArray = NSMutableArray.init()
        for lindex in 0..<dataArrayDeleteCartItems.count {
            let CartItemID = dataArrayDeleteCartItems[lindex]
            let productParms:NSMutableDictionary = NSMutableDictionary.init()
            productParms.setValue(CartItemID, forKey: "CartItemID")
            cartItemsArray.add(productParms)
        }
        print("responseObject = \(cartItemsArray)")
        networkBodyViewModel.refreshDataSource_CartDelete(URLPath: urlstring, parmetersArray: cartItemsArray)
    }
        
    func selectedAllBtnDidPress(button: UIButton, isSel: Bool) {
        for xindex in 0..<self.dataArr.count {
            let shopmodel:YCOrderShopModel = self.dataArr[xindex] as! YCOrderShopModel
            let goodarr:NSArray = shopmodel.goodsArr! as NSArray
            if goodarr.count > 0 {
                for jindex in 0..<goodarr.count {
                    let goodmodel:YCOrderGoodsModel = goodarr[jindex] as! YCOrderGoodsModel
                    goodmodel.goodsIsSelect = isSel
                }
            }
        }
        //添加到选择数组
        if isSel {
            for kindex in 0..<self.dataArr.count {
                let tempArr:NSMutableArray = self.selectedArr[kindex] as! NSMutableArray
                let model:YCOrderShopModel = self.dataArr[kindex] as! YCOrderShopModel
                let arr:NSArray = model.goodsArr! as NSArray
                tempArr.setArray(arr as! [Any])
            }
        }else {
            for kindex in 0..<self.selectedArr.count {
                let tempArr:NSMutableArray = self.selectedArr[kindex] as! NSMutableArray
                tempArr.removeAllObjects()
            }
        }
        self.updateData()
    }
    //更新数据 --价格总计--tableviewUI变化
    func updateData() -> Void {
        self.updatePrice()
        self.tableView.reloadData()
    }
    //更新价格
    func updatePrice() -> Void {
        //更新底部的价格
        self.toolView.updateArr(selectedArr: self.selectedArr, dataArr: self.dataArr)
        //判断每个店铺是否全选状态
        for lindex in 0..<self.dataArr.count {
            let model:YCOrderShopModel = self.dataArr[lindex] as! YCOrderShopModel
            let selectarr:NSMutableArray = self.selectedArr[lindex] as! NSMutableArray
            model.shopIsAllSelected = model.goodsArr?.count == selectarr.count ? true : false
        }
    }
    
    func accountBtnDidPress(button: UIButton, isSel: Bool) {
        print("\(String(describing: button.titleLabel?.text))")
        
        let dataArr11:NSMutableArray = self.dataArr
        for lindex in 0..<dataArr11.count {
            let shopmodel:YCOrderShopModel = self.dataArr[lindex] as! YCOrderShopModel
            let arr:[YCOrderGoodsModel] = shopmodel.goodsArr!
            if arr.count > 0{
                for jindex in 0..<arr.count {
                    let arr1:[YCOrderGoodsModel] = shopmodel.goodsArr!
                    let goodmodel:YCOrderGoodsModel = arr[jindex]
                    if !goodmodel.goodsIsSelect {
                        print(goodmodel.goodsName ?? "")

                        for kindex in 0..<self.selectedArr.count {

                            // 删除选中的数组
                            let xxtempArr:NSMutableArray = self.selectedArr[kindex] as! NSMutableArray
                            if xxtempArr.contains(goodmodel) {
                                xxtempArr.remove(goodmodel)
                            }

                            //删除数据源
                            var tempArr:[YCOrderGoodsModel] = NSMutableArray.init(array: arr1) as! [YCOrderGoodsModel]
                            let xxIndex:Int = tempArr.firstIndex(of: goodmodel)!
                            tempArr.remove(at: xxIndex)
                            shopmodel.goodsArr = tempArr
                        }

                    }
                }
            }
        }

        let dataArrValue:NSMutableArray = []
        for lindex in 0..<dataArr11.count {
            let shopmodel:YCOrderShopModel = self.dataArr[lindex] as! YCOrderShopModel
            if shopmodel.goodsArr!.count > 0 {
                print(shopmodel)
                dataArrValue.add(shopmodel)
            }
        }
        
        let nextVc = TRCartSureOrderViewController(dataArrayShopModel: dataArrValue as? [YCOrderShopModel])
        self.navigationController?.pushViewController(nextVc, animated: true)
        
        
        
//        var modelArr:[YCOrderGoodsModel] = []
//        for kindex in 0..<self.selectedArr.count {
//            let tempArr:NSMutableArray = self.selectedArr[kindex] as! NSMutableArray
//            for lindex in 0..<tempArr.count {
//                let model:YCOrderGoodsModel = tempArr[lindex] as! YCOrderGoodsModel
//                modelArr.append(model)
//            }
//        }

//        let groupArr:NSMutableArray = NSMutableArray.init()
//        if modelArr.count > 0 {
//            for lmodel: YCOrderGoodsModel in modelArr {
//                var itemArr:[YCOrderGoodsModel] = []
//                itemArr.append(lmodel)
//                modelArr.removeFirst()
//
//                if modelArr.count > 0 {
//                    for (jindex, jmodel) in modelArr.enumerated() {
//                        print(jmodel)
//                        if lmodel.shopName == jmodel.shopName {
//                            itemArr.append(jmodel)
//                            modelArr.remove(at: jindex)
//                        }
//                    }
//                }
//
//                groupArr.add(itemArr)
//            }
//        }
//
//        let temp = groupArr
//        print(temp)
        
//        let nextVc = TRCartSureOrderViewController()
//        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
