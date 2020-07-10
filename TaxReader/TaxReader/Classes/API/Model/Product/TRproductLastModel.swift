//
//  TRproductLastModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRproductLastModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var data: [TRproductLastDataModel]?
}

struct TRproductLastDataModel: HandyJSON {
    var ProdID: Int = 0
    var ProdYear: Int = 0
    var ProdIssue: Int = 0
    var ProdName: String?
    var ProdImg: String?
    var ReadSourceID: String?
    var ArticleList: [TRproductLastDataListModel]?
}

struct TRproductLastDataListModel: HandyJSON {
    var ArticleID: Int = 0
    var ArticleAuthorName: String?
    var ArticleTitle: String?
}

/*
    productLast = {
      "ret" : true,
      "msg" : "查询成功",
      "data" : [
        {
          "ProdYear" : 1984,
          "ProdName" : "中国税务",
          "ProdAbstract" : null,
          "ProdIssue" : 1,
          "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
          "ProdForm" : 10,
          "ProdID" : 894
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "中国税务",
          "ProdIssue" : 2,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1984\/Layouts\/ZS198402.Source.jpg",
          "ProdID" : 895,
          "ProdYear" : 1984
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "中国税务",
          "ProdIssue" : 3,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1984\/Layouts\/ZS198403.Source.jpg",
          "ProdID" : 896,
          "ProdYear" : 1984
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "中国税务",
          "ProdIssue" : 1,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1985\/Layouts\/ZS198501.Source.jpg",
          "ProdID" : 904,
          "ProdYear" : 1985
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税务研究",
          "ProdIssue" : 1,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1985\/Layouts\/SY198501.Source.jpg",
          "ProdID" : 897,
          "ProdYear" : 1985
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税务研究",
          "ProdIssue" : 2,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1985\/Layouts\/SY198502.Source.jpg",
          "ProdID" : 898,
          "ProdYear" : 1985
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税务研究",
          "ProdIssue" : 3,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1985\/Layouts\/SY198503.Source.jpg",
          "ProdID" : 899,
          "ProdYear" : 1985
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税务研究",
          "ProdIssue" : 4,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/1985\/Layouts\/SY198504.Source.jpg",
          "ProdID" : 900,
          "ProdYear" : 1985
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "涉外税务",
          "ProdIssue" : 1,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2007\/Layouts\/SS200701.Source.jpg",
          "ProdID" : 1451,
          "ProdYear" : 2007
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "涉外税务",
          "ProdIssue" : 2,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2007\/Layouts\/SS200702.Source.jpg",
          "ProdID" : 1452,
          "ProdYear" : 2007
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "涉外税务",
          "ProdIssue" : 3,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2007\/Layouts\/SS200703.Source.jpg",
          "ProdID" : 1453,
          "ProdYear" : 2007
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "涉外税务",
          "ProdIssue" : 4,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2007\/Layouts\/SS200704.Source.jpg",
          "ProdID" : 1454,
          "ProdYear" : 2007
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "世界税收信息",
          "ProdIssue" : 2,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2019\/Layouts\/SX201902.Source.jpg",
          "ProdID" : 2079,
          "ProdYear" : 2019
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "世界税收信息",
          "ProdIssue" : 3,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2019\/Layouts\/SX201903.Source.jpg",
          "ProdID" : 2282,
          "ProdYear" : 2019
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "世界税收信息",
          "ProdIssue" : 1,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2019\/Layouts\/SX201901.Source.jpg",
          "ProdID" : 2284,
          "ProdYear" : 2019
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "世界税收信息",
          "ProdIssue" : 2,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2018\/Layouts\/SX201802.Source.jpg",
          "ProdID" : 2285,
          "ProdYear" : 2018
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdIssue" : 3,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2019\/Layouts\/JY201903.Source.jpg",
          "ProdID" : 2410,
          "ProdYear" : 2019
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdIssue" : 6,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2018\/Layouts\/JY201806.Source.jpg",
          "ProdID" : 2411,
          "ProdYear" : 2018
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdIssue" : 1,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2019\/Layouts\/JY201901.Source.jpg",
          "ProdID" : 2412,
          "ProdYear" : 2019
        },
        {
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdIssue" : 5,
          "ProdForm" : 10,
          "ProdImg" : "\/upload\/2018\/Layouts\/JY201805.Source.jpg",
          "ProdID" : 2413,
          "ProdYear" : 2018
        }
      ],
      "msgCode" : "200"
    }
 */
