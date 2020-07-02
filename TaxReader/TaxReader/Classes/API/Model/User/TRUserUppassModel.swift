//
//  TRUserUppassModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRUserUppassModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var data: String?
}