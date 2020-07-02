//
//  TRCommonModel.swift
//  TaxReader
//
//  Created by asdc on 2020/5/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRCommonModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var data: String?
}

/*
   mobileSMS = {
     "msgCode" : "200",
     "ret" : true,
     "data" : "4767",
     "msg" : "验证码获取成功"
   }
*/
