//
//  TROrderRebuildInvoiceModel.swift
//  TaxReader
//
//  Created by asdc on 2020/7/23.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TROrderRebuildInvoiceModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: String?
}