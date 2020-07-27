//
//  TRGetAllPublicationModel.swift
//  TaxReader
//
//  Created by asdc on 2020/7/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRGetAllPublicationModel: HandyJSON {
    var msgCode: Int = 0
    var ret: Bool? = false
    var data: [TRGetAllPublicationDataModel]?
    var msg: String?
}

struct TRGetAllPublicationDataModel: HandyJSON {
    var PubID: Int = 0
    var PubExeUnit: String?
    var PubMgrUnit: String?
    var PubName: String?
}
