//
//  TRCartGetCartByIDModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/28.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRCartGetCartByIDModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRCartGetCartByIDDataModel]?
}

struct TRCartGetCartByIDDataModel: HandyJSON {
    var CartItemID: Int = 0
    var ProductCount: Int = 0
    var Product: TRCartGetCartByIDDataProductModel?
}

struct TRCartGetCartByIDDataProductModel: HandyJSON {
    var ProdID:Int?
    var ProdName:String?
    var ProdImg:String?
    var ProdCreateTime:String?
    var ProdUpdateDate:String?
    
    var ProdPrice:Double?
    var ProdIOSPrice:Double?
    
    var ProdYear:Int?
}


/*
    {
      "msg" : "查询成功",
      "ret" : true,
      "msgCode" : "200",
      "data" : [
        {
          "CartItemID" : 61,
          "Product" : {
            "ProdType" : 10,
            "ProdName" : "中国税务",
            "ProdSumIssue" : 0,
            "ProdAuthorName" : null,
            "ProdIsFree" : false,
            "ProdUpdateDate" : null,
            "ProdID" : 894,
            "ProdIOSPrice" : 0.01,
            "ProdForm" : 10,
            "ReadingTypeID" : 2,
            "ProdIssue" : 1,
            "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
            "ReadTypeRootCode" : "qk",
            "ProdShowStatus" : 1,
            "ProdStatus" : 10,
            "ProdCreator" : 1,
            "ProdIsDiscount" : 0,
            "ProdPrice" : 0.01,
            "ReadTypeRootID" : 1,
            "ProdIsRCMD" : 0,
            "ReadSourceURL" : "\/Journal\/Detail\/id\/894",
            "ReadSourceType" : 20,
            "ReadTypeName" : null,
            "ProdUpdateMan" : 0,
            "ReadSourceID" : "894",
            "ProdCreateTime" : "2020-03-24 12:00:00",
            "ReadSourceParentID" : 10,
            "ArticleList" : null,
            "ProdLevel" : 1,
            "ProdAbstract" : null,
            "ProdYear" : 1984
          },
          "ProductCount" : 14
        },
        {
          "CartItemID" : 62,
          "Product" : {
            "ProdType" : 10,
            "ProdName" : "中国税务",
            "ProdSumIssue" : 0,
            "ProdAuthorName" : null,
            "ProdIsFree" : false,
            "ProdUpdateDate" : null,
            "ProdID" : 895,
            "ProdIOSPrice" : 0.01,
            "ProdForm" : 10,
            "ReadingTypeID" : 2,
            "ProdIssue" : 2,
            "ProdImg" : "\/upload\/1984\/Layouts\/ZS198402.Source.jpg",
            "ReadTypeRootCode" : "qk",
            "ProdShowStatus" : 1,
            "ProdStatus" : 10,
            "ProdCreator" : 1,
            "ProdIsDiscount" : 0,
            "ProdPrice" : 0.01,
            "ReadTypeRootID" : 1,
            "ProdIsRCMD" : 0,
            "ReadSourceURL" : "\/Journal\/Detail\/id\/895",
            "ReadSourceType" : 20,
            "ReadTypeName" : null,
            "ProdUpdateMan" : 0,
            "ReadSourceID" : "895",
            "ProdCreateTime" : "2020-03-24 12:00:00",
            "ReadSourceParentID" : 10,
            "ArticleList" : null,
            "ProdLevel" : 1,
            "ProdAbstract" : null,
            "ProdYear" : 1984
          },
          "ProductCount" : 4
        },
        {
          "CartItemID" : 63,
          "Product" : {
            "ProdType" : 10,
            "ProdName" : "中国税务",
            "ProdSumIssue" : 0,
            "ProdAuthorName" : null,
            "ProdIsFree" : false,
            "ProdUpdateDate" : "2020-05-20 02:14:24",
            "ProdID" : 896,
            "ProdIOSPrice" : 0.01,
            "ProdForm" : 10,
            "ReadingTypeID" : 2,
            "ProdIssue" : 3,
            "ProdImg" : "\/upload\/1984\/Layouts\/ZS198403.Source.jpg",
            "ReadTypeRootCode" : "qk",
            "ProdShowStatus" : 1,
            "ProdStatus" : 10,
            "ProdCreator" : 1,
            "ProdIsDiscount" : 0,
            "ProdPrice" : 0.01,
            "ReadTypeRootID" : 1,
            "ProdIsRCMD" : 1,
            "ReadSourceURL" : "\/Journal\/Detail\/id\/896",
            "ReadSourceType" : 20,
            "ReadTypeName" : null,
            "ProdUpdateMan" : 11,
            "ReadSourceID" : "896",
            "ProdCreateTime" : "2020-03-24 12:00:00",
            "ReadSourceParentID" : 10,
            "ArticleList" : null,
            "ProdLevel" : 1,
            "ProdAbstract" : null,
            "ProdYear" : 1984
          },
          "ProductCount" : 4
        }
      ]
    }
 */
