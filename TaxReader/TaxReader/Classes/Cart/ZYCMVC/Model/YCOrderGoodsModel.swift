//
//  YCOrderGoodsModel.swift
//  learnSwift
//
//  Created by zyc on 2019/12/23.
//  Copyright © 2019 张言超. All rights reserved.
//

import UIKit

class YCOrderGoodsModel: NSObject {
    
    var CartItemID:Int?
    var ProductCount:Int?
    var Product: TROrderProductModel?
    
    /** 商品名字 */
    var goodsName:String?
    /** 商品价格 */
    var goodsPrice:String?
    /** 商品描述 */
    var goodsDescription:String?
    
    /** 是否是选中状态 */
    var goodsIsSelect:Bool = false
    /** 商品的个数 */
    var goodsCount:Int?
    
    // 新添加的商店名字
    var shopName:String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
    
    override func value(forUndefinedKey key: String) -> Any? {
        return nil
    }
    
    
    
    /*
    /** 商品名字 */
    var goodsName:String?
    /** 商品价格 */
    var goodsPrice:String?
    /** 商品描述 */
    var goodsDescription:String?
    
    /** 是否是选中状态 */
    var goodsIsSelect:Bool = false
    /** 商品的个数 */
    var goodsCount:Int?
    
    // 新添加的商店名字
    var shopName:String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
    
    override func value(forUndefinedKey key: String) -> Any? {
        return nil
    }
 */
}
