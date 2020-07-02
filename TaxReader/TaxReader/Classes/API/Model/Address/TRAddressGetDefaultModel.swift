//
//  TRAddressGetDefaultModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRAddressGetDefaultModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: TRAddressGetDefaultDataModel?
}

struct TRAddressGetDefaultDataModel: HandyJSON {
    var ret: Bool? = false
    var UserAddrID: Int = 0
    var UserAddressMan: String?
    var UserAddressMobile: String?
    var UserAddressDetail: String?
}

/*
 {
   "data" : {
     "UserAddressProv" : "天津市",
     "UserAddressMan" : "秒阿娇肯德基",
     "UserAddressCountry" : "中国",
     "UserAddrID" : 2005,
     "UserAddressDetail" : "中国 天津市 和平区 而而哦",
     "UserAddressDistrict" : "天津市",
     "UserAddressPhone" : "010-1911986",
     "UserAddressZIPCode" : null,
     "UserAddressStreet" : "和平区",
     "UserAddressCity" : "天津市",
     "UserAddressIsDefault" : 1,
     "UserID" : 4460,
     "UserAddressMobile" : "18301228765",
     "UserAddressManGender" : 0
   },
   "msgCode" : "200",
   "ret" : true,
   "msg" : "查询成功"
 }
 */
