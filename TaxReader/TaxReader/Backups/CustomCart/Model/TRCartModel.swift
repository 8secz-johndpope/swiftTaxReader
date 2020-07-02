//
//  TRCartModel.swift
//  TaxReader
//
//  Created by asdc on 2020/5/27.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRCartModel: HandyJSON {
    var pageSize: Int = 0
    var pageIndex: Int = 0
    var totalCount: Int = 0
    var ret: Int = 0
    var msg: String?
    var msgCode: String?
    var data: [TRDataModel]?
}

struct TRDataModel: HandyJSON {
    var addDate: String?
    var data: [TRDataRowModel]?
    
    /** 是否是全部选中状态 */
    var shopIsAllSelected:Bool = false
}

struct TRDataRowModel: HandyJSON {
    var CartItemID: Int = 0
    var ProductCount: Int = 0
    var Product: TRDataProductModel?
    
    /** 是否是选中状态 */
    var rowIsSelected: Bool = false
    /** 商品的个数 */
    var goodsCount: Int?
}

struct TRDataProductModel: HandyJSON {
    var ProdID: Int = 0
    var ProdName: String?
    var ProdYear: Int = 0
    
    var ProdImg: String?
}


