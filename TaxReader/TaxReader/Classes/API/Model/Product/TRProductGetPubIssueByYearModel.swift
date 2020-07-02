//
//  TRProductGetPubIssueByYearModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/17.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRProductGetPubIssueByYearModel: HandyJSON {
    var ret: Bool?
    var msgCode: Int = 0
    var msg: String?
    var data: [TRProductGetPubIssueByYearDataModel]?
}

struct TRProductGetPubIssueByYearDataModel: HandyJSON {
    var ProdIsFree: Bool?
    var ProdYear: Int = 0
    var ProdIssue: Int = 0
    var ReadSourceID: String?
    var ProdName: String?
    var ProdImg: String?
}

/*
    {
      "data" : [
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201901.Source.jpg",
          "ProdIssue" : 1,
          "ReadSourceID" : "2038",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201902.Source.jpg",
          "ProdIssue" : 2,
          "ReadSourceID" : "2040",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201903.Source.jpg",
          "ProdIssue" : 3,
          "ReadSourceID" : "2043",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201904.Source.jpg",
          "ProdIssue" : 4,
          "ReadSourceID" : "2046",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201905.Source.jpg",
          "ProdIssue" : 5,
          "ReadSourceID" : "2050",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201906.Source.jpg",
          "ProdIssue" : 6,
          "ReadSourceID" : "2053",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201907.Source.jpg",
          "ProdIssue" : 7,
          "ReadSourceID" : "2058",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201908.Source.jpg",
          "ProdIssue" : 8,
          "ReadSourceID" : "2243",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201909.Source.jpg",
          "ProdIssue" : 9,
          "ReadSourceID" : "2414",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201910.Source.jpg",
          "ProdIssue" : 10,
          "ReadSourceID" : "2438",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201911.Source.jpg",
          "ProdIssue" : 11,
          "ReadSourceID" : "2466",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        },
        {
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201912.Source.jpg",
          "ProdIssue" : 12,
          "ReadSourceID" : "2472",
          "ProdSumIssue" : 0,
          "ProdIsFree" : false,
          "ProdName" : "中国税务",
          "ProdYear" : 2019
        }
      ],
      "msgCode" : "200",
      "msg" : "查询成功",
      "ret" : true
    }
 */
