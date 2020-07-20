//
//  TROrderProductModel.swift
//  TaxReader
//
//  Created by asdc on 2020/5/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TROrderProductModel: NSObject {
    
    var ProdID:Int?
    var ProdName:String?
    var ProdImg:String?
    var ProdCreateTime:String?
    var ProdUpdateDate:String?
    
    var ProdPrice:Double?
    var ProdIOSPrice:Double?
    
    var ProdYear:Int?
    var ProdIssue:Int?
    
    var ReadSourceID: String?
    var ReadSourceParentID: Int? = 0
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
    
    override func value(forUndefinedKey key: String) -> Any? {
        return nil
    }
    
}
