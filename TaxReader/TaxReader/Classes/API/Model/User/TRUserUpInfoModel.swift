//
//  TRUserUpInfoModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRUserUpInfoModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: TRUserUpInfoData?
}

struct TRUserUpInfoData: HandyJSON {
    var UserName: String?
    var UserNickName: String?
    var UserRealName: String?
    var UserMobileAreaCode: Int = 0
    var UserGender: Int = 0
    var UserBirthDate: String?
    var UserMobile: String?
    var AreaFullName: String?
}
