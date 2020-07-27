//
//  TRProductRecdModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/3.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRProductRecdModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRProductRecdDataModel]?
}

struct TRProductRecdDataModel: HandyJSON {
    var ProdID: Int = 0
    var ProdIssue: Int = 0
    var ProdName: String?
    var ProdImg: String?
}

/*
    productRect = {
      "msg" : "查询成功",
      "msgCode" : "200",
      "data" : [
        {
          "ProdYear" : 1984,
          "ProdIssue" : 3,
          "ProdID" : 896,
          "ProdAbstract" : null,
          "ProdName" : "中国税务",
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1984\/Layouts\/ZS198403.Source.jpg"
        },
        {
          "ProdYear" : 1986,
          "ProdIssue" : 3,
          "ProdID" : 918,
          "ProdAbstract" : null,
          "ProdName" : "税务研究",
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1986\/Layouts\/SY198603.Source.jpg"
        },
        {
          "ProdYear" : 2019,
          "ProdIssue" : 12,
          "ProdID" : 2471,
          "ProdAbstract" : null,
          "ProdName" : "国际税收",
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2019\/Layouts\/GS201912.Source.jpg"
        },
        {
          "ProdYear" : 2019,
          "ProdIssue" : 6,
          "ProdID" : 2479,
          "ProdAbstract" : null,
          "ProdName" : "世界税收信息",
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2019\/Layouts\/SX201906.Source.jpg"
        },
        {
          "ProdYear" : 2011,
          "ProdIssue" : 4,
          "ProdID" : 2480,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2011\/Layouts\/JY201104.Source.jpg"
        }
      ],
      "ret" : true
    }

 */
