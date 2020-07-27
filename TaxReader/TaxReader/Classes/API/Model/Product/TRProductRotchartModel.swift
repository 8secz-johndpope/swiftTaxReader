//
//  TRProductRotchartModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/3.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRProductRotchartModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRProductRotchartDataModel]?
}

struct TRProductRotchartDataModel: HandyJSON {
    var ImgSRC: String?
    var ImgURL: String?
}
