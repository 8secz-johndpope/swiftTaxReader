//
//  TROrderActivityCodeModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/18.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TROrderActivityCodeModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TROrderActivityCodeDataModel]?
}

struct TROrderActivityCodeDataModel: HandyJSON {
    var ActivationCodeStatus: Int = 0
    var ActivationCodePWD: String?
    var ActivationCodeSN: String?
}

/*
    {
      "msgCode" : "200",
      "ret" : true,
      "msg" : "获取成功",
      "data" : [
        {
          "ActivationCodePWD" : "b95g9ax9",
          "ActivationCodeSN" : "52100002620",
          "ActivationCodeStatus" : 1
        },
        {
          "ActivationCodePWD" : "9C2MFRWl",
          "ActivationCodeSN" : "52200000959",
          "ActivationCodeStatus" : 1
        },
        {
          "ActivationCodePWD" : "Kp9g9999",
          "ActivationCodeSN" : "52200000960",
          "ActivationCodeStatus" : 1
        },
        {
          "ActivationCodePWD" : "l5K96pK3",
          "ActivationCodeSN" : "52200000961",
          "ActivationCodeStatus" : 1
        },
        {
          "ActivationCodePWD" : "9g9jUk7w",
          "ActivationCodeSN" : "52200000962",
          "ActivationCodeStatus" : 1
        },
        {
          "ActivationCodePWD" : "96mlR4Py",
          "ActivationCodeSN" : "52200000963",
          "ActivationCodeStatus" : 1
        },
        {
          "ActivationCodePWD" : "9tjg9h69",
          "ActivationCodeSN" : "52200000964",
          "ActivationCodeStatus" : 1
        },
        {
          "ActivationCodePWD" : "RPT98T4b",
          "ActivationCodeSN" : "52200000965",
          "ActivationCodeStatus" : 0
        },
        {
          "ActivationCodePWD" : "9KB999G9",
          "ActivationCodeSN" : "52200000966",
          "ActivationCodeStatus" : 0
        },
        {
          "ActivationCodePWD" : "u9oA939d",
          "ActivationCodeSN" : "52200000967",
          "ActivationCodeStatus" : 1
        }
      ]
    }
 */
