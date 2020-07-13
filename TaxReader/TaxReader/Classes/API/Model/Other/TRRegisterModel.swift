//
//  TRRegisterModel.swift
//  TaxReader
//
//  Created by asdc on 2020/5/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRRegisterModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var data: String?
}

/*
    register = {
      "data" : {
        "UserStatus" : 10,
        "UserNickName" : "15711351022",
        "UserAnswer" : "",
        "UserGender" : 3,
        "UserRegTime" : "2020-06-01 04:13:07",
        "UserID" : 4461,
        "UserValidStartTime" : null,
        "UserLastLoginTime" : null,
        "UserMobile" : "15711351022",
        "UserLevel" : 0,
        "UserLoginCount" : 0,
        "UserRegIP" : "192.168.1.132",
        "AreaID" : 3,
        "UserEmail" : "",
        "UserTitle" : "",
        "UserQuestion" : "",
        "UserPost" : "",
        "UserRealName" : "",
        "UserImage" : "",
        "UserUpdateTime" : null,
        "UseFrom" : 20,
        "UserCreateTime" : "2020-06-01 04:13:07",
        "UnitID" : 0,
        "UserBirthDate" : null,
        "UserName" : "15711351022",
        "UserValidFinishTime" : null,
        "UserLastLoginIP" : ""
      },
      "msgCode" : "200",
      "msg" : "注册成功",
      "ret" : true
    }
 */
