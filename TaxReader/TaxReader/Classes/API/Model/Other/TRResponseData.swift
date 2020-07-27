//
//  TRResponseData.swift
//  TaxReader
//
//  Created by asdc on 2020/6/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRResponseData<T: HandyJSON>: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    
    var data: TRReturnData<T>?
}

extension Array: HandyJSON{}
struct TRReturnData<T: HandyJSON>: HandyJSON {
    var message:String?
    var returnData: T?
    var stateCode: Int = 0
}
