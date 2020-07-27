//
//  TRAddressInfoModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/3.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRAddressInfoModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRAddressInfoDataModel]?
}

struct TRAddressInfoDataModel: HandyJSON {
    var UserID: Int = 0
    var UserAddrID: Int = 0
    var UserAddressManGender: Int = 0
    
    var UserAddressMan: String?
    var UserAddressMobile: String?
    var UserAddressPhone: String?
    var UserAddressZIPCode: String?
    var UserAddressProv: String?
    var UserAddressCity: String?
    var UserAddressDistrict: String?
    var UserAddressDetail: String?
    var UserAddressIsDefault: Int = 0
}

/*
    addressInfo = {
      "msg" : "查询成功",
      "ret" : true,
      "msgCode" : "200",
      "data" : [
        {
          "UserAddressManGender" : 0,
          "UserAddressProv" : "北京市",
          "UserAddressCity" : "北京市",
          "UserID" : 4459,
          "UserAddressMobile" : "86-17310271995",
          "UserAddressDistrict" : "东城区",
          "UserAddressPhone" : "86-010-88888888",
          "UserAddressIsDefault" : 1,
          "UserAddressCountry" : "中国",
          "UserAddressZIPCode" : "430000",
          "UserAddressDetail" : "北京市石景山区111",
          "UserAddressMan" : "董明龙",
          "UserAddressStreet" : "null",
          "UserAddrID" : 4
        },
        {
          "UserAddressManGender" : 0,
          "UserAddressProv" : "北京市",
          "UserAddressCity" : "北京市",
          "UserID" : 4459,
          "UserAddressMobile" : "86-17310271995",
          "UserAddressDistrict" : "北京市",
          "UserAddressPhone" : "86-010-121",
          "UserAddressIsDefault" : 0,
          "UserAddressCountry" : "中国",
          "UserAddressZIPCode" : null,
          "UserAddressDetail" : "北京市石景山区",
          "UserAddressMan" : "董明龙",
          "UserAddressStreet" : "东城区",
          "UserAddrID" : 6
        }
      ]
    }

 */
