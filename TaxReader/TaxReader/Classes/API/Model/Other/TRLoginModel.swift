//
//  TRLoginModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRLoginModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: TRLoginData?
    var expire_time: String?
    var access_token: String?
}

struct TRLoginData: HandyJSON {
    var UserID: Int = 0
    var AreaID: Int = 0
    var UnitID: Int = 0
    var UserName: String?
    var UserMobile: Int = 0
    var UserImage: String?
    
    // 用上的时候再加入
}

/*
    login = {
      "ret" : true,
      "msgCode" : "200",
      "access_token" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI0NDYxIiwibGF0IjoxNTkwOTcwNDgyMTc3fQ.8cZLBgeETO3gKnDlFJH7pvfkU01tsDpnzX--ulKtuj8",
      "expire_time" : "2020-06-06 04:14:42",
      "msg" : "登录成功",
      "data" : {
        "UserLevel" : 0,
        "AreaID" : 3,
        "UserMobileAreaCode" : "+86",
        "OrganTreePath" : "",
        "CityId" : 0,
        "UserRegTime" : "2020-06-01 04:13:07",
        "UserPass" : "",
        "UserUpdateTime" : null,
        "OrganName" : null,
        "UserActivity" : 0,
        "UserValidStartTime" : null,
        "UserTitle" : "",
        "AreaTreePath" : "4000-1-3",
        "UserID" : 4461,
        "UserName" : "15711351022",
        "UserCreateTime" : "2020-06-01 04:13:07",
        "AreaFullName" : " 北京市 西城区",
        "UserRegIP" : "192.168.1.132",
        "UserValidFinishTime" : null,
        "UserEmail" : "",
        "UserLoginCount" : 0,
        "CountryId" : 0,
        "UserQuestion" : "",
        "UserAnswer" : "",
        "CountyId" : 0,
        "UserPWD" : "aaOjuA2a4z\/kQQI6e+ydtg==",
        "ProvinceId" : 0,
        "UserNickName" : "15711351022",
        "UserStatus" : 10,
        "UserPost" : "",
        "UserGender" : 3,
        "UserUnit" : "",
        "UserRealName" : "",
        "UserAddress" : "",
        "UnitID" : 0,
        "UserDepart" : "",
        "UserLastLoginIP" : "",
        "UserLastLoginTime" : null,
        "AreaName" : null,
        "UseFrom" : 20,
        "UserPostal" : "",
        "UserBirthDate" : null,
        "OrganFullName" : "",
        "UserPCPass" : "",
        "UserImage" : "",
        "UserMobile" : "15711351022"
      }
    }
 */
