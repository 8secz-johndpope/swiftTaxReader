//
//  TRAreaModel.swift
//  TaxReader
//
//  Created by asdc on 2020/5/20.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRAreaModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var data:[areaDataCountryModel1]?
}


// 测试
struct areaDataCountryModel1: HandyJSON {
    var AreaFullName: String?
    var AreaID: Int = 0
    var AreaName: String?
    var AreaParentID: Int = 0
    var LevelID: Int = 0
    var children:[areaDataCountryModel1]?
    var AreaTreePath: String?
}

struct areaDataCountryModel: HandyJSON {
    var AreaFullName: String?
    var AreaID: Int = 0
    var AreaName: String?
    var AreaParentID: Int = 0
    var LevelID: Int = 0
    var children:[dataChildProvinceModel]?
}

struct dataChildProvinceModel: HandyJSON {
    var AreaFullName: String?
    var AreaID: Int = 0
    var AreaName: String?
    var AreaParentID: Int = 0
    var LevelID: Int = 0
    var children:[dataChildCityModel]?
}

struct dataChildCityModel: HandyJSON {
    var AreaFullName: String?
    var AreaID: Int = 0
    var AreaName: String?
    var AreaParentID: Int = 0
    var LevelID: Int = 0
    var children:[dataChildAreaModel]?
}

struct dataChildAreaModel: HandyJSON {
    var AreaFullName: String?
    var AreaID: Int = 0
    var AreaName: String?
    var AreaParentID: Int = 0
    var LevelID: Int = 0
    var children:[dataChildStreetModel]?
}

struct dataChildStreetModel: HandyJSON {
    var AreaFullName: String?
    var AreaID: Int = 0
    var AreaName: String?
    var AreaParentID: Int = 0
    var LevelID: Int = 0
}


