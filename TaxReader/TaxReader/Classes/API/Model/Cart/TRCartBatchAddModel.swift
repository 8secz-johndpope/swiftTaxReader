//
//  TRCartBatchAddModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRCartBatchAddModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var data: [String]?
}

/*
    {
      "msgCode" : "200",
      "ret" : true,
      "msg" : "购物车添加成功",
      "data" : [
        61
      ]
    }
 
 {
   "msg" : "购物车添加成功",
   "data" : [
     61,
     62,
     63
   ],
   "ret" : true,
   "msgCode" : "200"
 }
 */
