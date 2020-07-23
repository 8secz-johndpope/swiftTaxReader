//
//  TROrderFindDetailModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/29.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TROrderFindDetailModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var totalCount: Int = 0
    var data: TROrderFindDetailDataModel?
}

struct TROrderFindDetailDataModel: HandyJSON {
    var OrderForm: Int = 0
    var OrderStatus: Int = 0
    var OrderInvoiceStatus: Int = 0
    var OrderDate: String?
    var OrderID: Int = 0
    var UserName: String?
    var OrderSerialCode: Int = 0
    var OrderIsInvoiceDueDate: String?
    var OrderConsignee: TROrderFindDetailDataOrderConsigneeModel?
    var OrderDetail: [TROrderFindDetailDataOrderDetailModel]?
}

struct TROrderFindDetailDataOrderConsigneeModel: HandyJSON {
    var OrderForm: Int = 0
    var OrderStatus: Int = 0
    var OrderConsCity: String?
    var OrderID: Int = 0
    var OrderConsProvince: String?
    var OrderCons: String?
    var OrderConsTel: String?
    var OrderConsDetail: String?
}

struct TROrderFindDetailDataOrderDetailModel: HandyJSON {
    var PubProductIOSPrice: Int = 0
    var PubProductFeePrice: Int = 0
    var OrderDetailSN: String?
    var OrderID: Int = 0
    var PubProductName: String?
    var PubProductPrice: Double = 0
    var OrderDetailCount: Int = 0
    var Product: TROrderFindDetailDataOrderDetailProductModel?
}

struct TROrderFindDetailDataOrderDetailProductModel: HandyJSON {
    var ReadingTypeID: Int = 0
    var ProdID: Int = 0
    var ProdImg: String?
    var OrderID: Int = 0
    var ProdCreateTime: String?
    var ProdName: String?
}




/*
    {
      "msg" : "查询成功",
      "msgCode" : "200",
      "data" : {
        "OrderIsInvoiceDueDate" : "2020-06-28 05:26:23",
        "OrderDate" : "2020-06-28 05:26:23",
        "Order_refundOrderId" : "",
        "UserID" : 4460,
        "OrderInvoice" : null,
        "OrderRemarks" : "",
        "Order_failMsg" : "",
        "OrderDetail" : [
          {
            "PubProductPrice" : 0.01,
            "OrderID" : 8,
            "PubProductIOSPrice" : 0,
            "PubProductFeePrice" : 0.19,
            "OrderDetailSN" : "a87db34aa30248d2b94fccef0c7dbcb5",
            "OrderDetailtMoney" : 0.19,
            "Product" : {
              "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
              "ReadTypeName" : null,
              "ReadingTypeID" : 2,
              "ProdIsRCMD" : 0,
              "ProdIsDiscount" : 0,
              "ReadSourceParentID" : 10,
              "ProdID" : 894,
              "ProdIOSPrice" : 0.01,
              "ProdType" : 10,
              "ReadSourceType" : 20,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ArticleList" : null,
              "ProdYear" : 1984,
              "ProdShowStatus" : 1,
              "ReadTypeRootID" : 1,
              "ProdForm" : 10,
              "ProdUpdateDate" : null,
              "ProdSumIssue" : 0,
              "ProdAuthorName" : null,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/894",
              "ProdStatus" : 10,
              "ProdIssue" : 1,
              "ProdIsFree" : false,
              "ProdPrice" : 0.01,
              "ProdUpdateMan" : 0,
              "ReadTypeRootCode" : "qk",
              "ProdCreator" : 1,
              "ReadSourceID" : "894",
              "ProdLevel" : 1,
              "ProdAbstract" : null,
              "ProdName" : "中国税务"
            },
            "PubProductMedia" : 10,
            "OrderDetailID" : 8,
            "PubProductIOSFeePrice" : 0,
            "PubProductName" : "中国税务1984年第1期",
            "PubProductID" : 894,
            "OrderDetailCount" : 19
          },
          {
            "PubProductPrice" : 0.01,
            "OrderID" : 8,
            "PubProductIOSPrice" : 0,
            "PubProductFeePrice" : 0.080000000000000002,
            "OrderDetailSN" : "089c4d862f7d4b1583efa3dcc59b54a8",
            "OrderDetailtMoney" : 0.080000000000000002,
            "Product" : {
              "ProdName" : "中国税务",
              "ProdCreator" : 1,
              "ProdStatus" : 10,
              "ProdImg" : "\/upload\/1984\/Layouts\/ZS198402.Source.jpg",
              "ReadTypeRootID" : 1,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ProdUpdateDate" : null,
              "ProdPrice" : 0.01,
              "ProdSumIssue" : 0,
              "ProdIssue" : 2,
              "ProdIsRCMD" : 0,
              "ProdIOSPrice" : 0.01,
              "ReadTypeRootCode" : "qk",
              "ProdForm" : 10,
              "ReadTypeName" : null,
              "ProdID" : 895,
              "ReadSourceParentID" : 10,
              "ReadSourceID" : "895",
              "ProdAbstract" : null,
              "ReadSourceType" : 20,
              "ReadingTypeID" : 2,
              "ArticleList" : null,
              "ProdUpdateMan" : 0,
              "ProdIsFree" : false,
              "ProdType" : 10,
              "ProdLevel" : 1,
              "ProdAuthorName" : null,
              "ProdYear" : 1984,
              "ProdIsDiscount" : 0,
              "ProdShowStatus" : 1,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/895"
            },
            "PubProductMedia" : 10,
            "OrderDetailID" : 9,
            "PubProductIOSFeePrice" : 0,
            "PubProductName" : "中国税务1984年第2期",
            "PubProductID" : 895,
            "OrderDetailCount" : 8
          },
          {
            "PubProductPrice" : 0.01,
            "OrderID" : 8,
            "PubProductIOSPrice" : 0,
            "PubProductFeePrice" : 0.080000000000000002,
            "OrderDetailSN" : "888aa3bb763d4f4390e10b12c86f3050",
            "OrderDetailtMoney" : 0.080000000000000002,
            "Product" : {
              "ProdIOSPrice" : 0.01,
              "ProdCreator" : 1,
              "ReadSourceID" : "896",
              "ProdUpdateMan" : 11,
              "ArticleList" : null,
              "ProdSumIssue" : 0,
              "ProdYear" : 1984,
              "ReadTypeName" : null,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ReadTypeRootID" : 1,
              "ProdIsFree" : false,
              "ProdPrice" : 0.01,
              "ReadSourceParentID" : 10,
              "ProdShowStatus" : 1,
              "ProdUpdateDate" : "2020-05-20 02:14:24",
              "ReadingTypeID" : 2,
              "ProdIssue" : 3,
              "ProdAuthorName" : null,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/896",
              "ProdLevel" : 1,
              "ProdIsRCMD" : 1,
              "ProdType" : 10,
              "ProdIsDiscount" : 0,
              "ProdName" : "中国税务",
              "ProdStatus" : 10,
              "ProdImg" : "\/upload\/1984\/Layouts\/ZS198403.Source.jpg",
              "ReadTypeRootCode" : "qk",
              "ProdAbstract" : null,
              "ProdForm" : 10,
              "ProdID" : 896,
              "ReadSourceType" : 20
            },
            "PubProductMedia" : 10,
            "OrderDetailID" : 10,
            "PubProductIOSFeePrice" : 0,
            "PubProductName" : "中国税务1984年第3期",
            "PubProductID" : 896,
            "OrderDetailCount" : 8
          },
          {
            "PubProductIOSPrice" : 0,
            "OrderID" : 8,
            "OrderDetailCount" : 1,
            "Product" : {
              "ProdIOSPrice" : 0.01,
              "ProdCreator" : 1,
              "ReadSourceID" : "2495",
              "ProdUpdateMan" : 0,
              "ArticleList" : null,
              "ProdSumIssue" : 0,
              "ProdYear" : 2020,
              "ReadTypeName" : null,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ReadTypeRootID" : 2,
              "ProdIsFree" : false,
              "ProdPrice" : 0.01,
              "ReadSourceParentID" : 10,
              "ProdShowStatus" : 1,
              "ProdUpdateDate" : null,
              "ReadingTypeID" : 2,
              "ProdIssue" : 5,
              "ProdAuthorName" : null,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/2495",
              "ProdLevel" : 1,
              "ProdIsRCMD" : 0,
              "ProdType" : 10,
              "ProdIsDiscount" : 0,
              "ProdName" : "中国税务",
              "ProdStatus" : 10,
              "ProdImg" : "Layouts\/ZS202005.Source.jpg",
              "ReadTypeRootCode" : "qkzjc",
              "ProdAbstract" : null,
              "ProdForm" : 10,
              "ProdID" : 2495,
              "ReadSourceType" : 20
            },
            "PubProductIOSFeePrice" : 0,
            "PubProductMedia" : 10,
            "PubProductID" : 2495,
            "PubProductName" : "中国税务2020年第5期",
            "OrderDetailID" : 11,
            "OrderDetailtMoney" : 0.01,
            "PubProductFeePrice" : 0.01,
            "PubProductPrice" : 0.01,
            "OrderDetailSN" : "3d39b100b9484a2e9bf63931b74472d1"
          },
          {
            "PubProductIOSPrice" : 0,
            "OrderID" : 8,
            "OrderDetailCount" : 1,
            "Product" : {
              "ProdCreator" : 1,
              "ReadSourceParentID" : 14,
              "ReadTypeName" : null,
              "ProdIssue" : 4,
              "ProdSumIssue" : 0,
              "ReadTypeRootCode" : "qkzjc",
              "ProdType" : 10,
              "ProdUpdateDate" : null,
              "ProdUpdateMan" : 0,
              "ProdIOSPrice" : 0.01,
              "ProdIsDiscount" : 0,
              "ArticleList" : null,
              "ProdStatus" : 10,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/2491",
              "ProdLevel" : 1,
              "ReadSourceID" : "2491",
              "ProdForm" : 10,
              "ProdImg" : "Layouts\/GS202004.Source.jpg",
              "ProdIsFree" : false,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ProdID" : 2491,
              "ReadTypeRootID" : 2,
              "ReadingTypeID" : 2,
              "ProdShowStatus" : 1,
              "ProdName" : "国际税收",
              "ProdYear" : 2020,
              "ProdPrice" : 0.01,
              "ReadSourceType" : 20,
              "ProdAbstract" : null,
              "ProdAuthorName" : null,
              "ProdIsRCMD" : 0
            },
            "PubProductIOSFeePrice" : 0,
            "PubProductMedia" : 10,
            "PubProductID" : 2491,
            "PubProductName" : "国际税收2020年第4期",
            "OrderDetailID" : 12,
            "OrderDetailtMoney" : 0.01,
            "PubProductFeePrice" : 0.01,
            "PubProductPrice" : 0.01,
            "OrderDetailSN" : "10faadda7a5f49cbb2bbdab5c0b95b48"
          },
          {
            "PubProductIOSPrice" : 0,
            "OrderID" : 8,
            "OrderDetailCount" : 1,
            "Product" : {
              "ProdCreator" : 1,
              "ReadSourceParentID" : 11,
              "ReadTypeName" : null,
              "ProdIssue" : 3,
              "ProdSumIssue" : 0,
              "ReadTypeRootCode" : "qk",
              "ProdType" : 10,
              "ProdUpdateDate" : "2020-05-11 02:53:22",
              "ProdUpdateMan" : 11,
              "ProdIOSPrice" : 0.01,
              "ProdIsDiscount" : 0,
              "ArticleList" : null,
              "ProdStatus" : 10,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/2485",
              "ProdLevel" : 1,
              "ReadSourceID" : "2485",
              "ProdForm" : 10,
              "ProdImg" : "\/upload\/2020\/Layouts\/SY202003.Source.jpg",
              "ProdIsFree" : false,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ProdID" : 2485,
              "ReadTypeRootID" : 1,
              "ReadingTypeID" : 2,
              "ProdShowStatus" : 1,
              "ProdName" : "税务研究",
              "ProdYear" : 2020,
              "ProdPrice" : 0.01,
              "ReadSourceType" : 20,
              "ProdAbstract" : null,
              "ProdAuthorName" : null,
              "ProdIsRCMD" : 1
            },
            "PubProductIOSFeePrice" : 0,
            "PubProductMedia" : 10,
            "PubProductID" : 2485,
            "PubProductName" : "税务研究2020年第3期",
            "OrderDetailID" : 13,
            "OrderDetailtMoney" : 0.01,
            "PubProductFeePrice" : 0.01,
            "PubProductPrice" : 0.01,
            "OrderDetailSN" : "0e870aac398141f68445cf4d976c07f9"
          },
          {
            "PubProductIOSPrice" : 0,
            "OrderID" : 8,
            "OrderDetailCount" : 1,
            "Product" : {
              "ProdForm" : 10,
              "ProdAbstract" : null,
              "ProdImg" : "\/upload\/2019\/Layouts\/SX201905.Source.jpg",
              "ReadSourceID" : "2468",
              "ProdIOSPrice" : 0.01,
              "ProdAuthorName" : null,
              "ProdIsRCMD" : 0,
              "ProdPrice" : 0.01,
              "ProdName" : "世界税收信息",
              "ArticleList" : null,
              "ReadTypeRootCode" : "qk",
              "ProdUpdateMan" : 0,
              "ReadTypeRootID" : 1,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/2468",
              "ReadSourceType" : 20,
              "ProdType" : 10,
              "ProdID" : 2468,
              "ProdShowStatus" : 1,
              "ProdYear" : 2019,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ReadSourceParentID" : 15,
              "ProdCreator" : 1,
              "ProdIsFree" : false,
              "ReadingTypeID" : 4,
              "ProdStatus" : 10,
              "ReadTypeName" : null,
              "ProdUpdateDate" : null,
              "ProdIsDiscount" : 0,
              "ProdSumIssue" : 0,
              "ProdLevel" : 1,
              "ProdIssue" : 5
            },
            "PubProductIOSFeePrice" : 0,
            "PubProductMedia" : 10,
            "PubProductID" : 2468,
            "PubProductName" : "世界税收信息2019年第5期",
            "OrderDetailID" : 14,
            "OrderDetailtMoney" : 0.01,
            "PubProductFeePrice" : 0.01,
            "PubProductPrice" : 0.01,
            "OrderDetailSN" : "c73fab64f5ac41eca13b978c3c56b882"
          },
          {
            "PubProductIOSPrice" : 0,
            "OrderID" : 8,
            "OrderDetailCount" : 1,
            "Product" : {
              "ProdSumIssue" : 0,
              "ProdUpdateMan" : 0,
              "ProdCreator" : 1,
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ProdStatus" : 10,
              "ProdIsFree" : false,
              "ReadSourceType" : 20,
              "ProdType" : 10,
              "ProdAbstract" : null,
              "ProdIsRCMD" : 0,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/2451",
              "ProdIOSPrice" : 0.01,
              "ArticleList" : null,
              "ProdShowStatus" : 1,
              "ProdYear" : 2013,
              "ReadTypeRootID" : 1,
              "ProdImg" : "\/upload\/2013\/Layouts\/JY201302.Source.jpg",
              "ProdIsDiscount" : 0,
              "ReadTypeName" : null,
              "ReadingTypeID" : 5,
              "ProdID" : 2451,
              "ReadSourceParentID" : 16,
              "ReadTypeRootCode" : "qk",
              "ReadSourceID" : "2451",
              "ProdForm" : 10,
              "ProdUpdateDate" : null,
              "ProdLevel" : 1,
              "ProdAuthorName" : null,
              "ProdIssue" : 2,
              "ProdName" : "税收经济研究",
              "ProdPrice" : 0.01
            },
            "PubProductIOSFeePrice" : 0,
            "PubProductMedia" : 10,
            "PubProductID" : 2451,
            "PubProductName" : "税收经济研究2013年第2期",
            "OrderDetailID" : 15,
            "OrderDetailtMoney" : 0.01,
            "PubProductFeePrice" : 0.01,
            "PubProductPrice" : 0.01,
            "OrderDetailSN" : "179b336ffd154b9bb55d2e80f267c46f"
          },
          {
            "PubProductIOSPrice" : 0,
            "OrderID" : 8,
            "OrderDetailCount" : 1,
            "Product" : {
              "ProdIOSPrice" : 0.01,
              "ProdImg" : "\/upload\/2015\/Layouts\/JY201505.Source.jpg",
              "ProdCreateTime" : "2020-03-24 12:00:00",
              "ReadTypeRootID" : 1,
              "ProdAbstract" : null,
              "ProdStatus" : 10,
              "ReadTypeName" : null,
              "ReadSourceType" : 20,
              "ReadingTypeID" : 5,
              "ProdType" : 10,
              "ReadTypeRootCode" : "qk",
              "ProdShowStatus" : 1,
              "ReadSourceParentID" : 16,
              "ProdIsRCMD" : 0,
              "ReadSourceID" : "2435",
              "ProdYear" : 2015,
              "ProdForm" : 10,
              "ProdSumIssue" : 0,
              "ProdUpdateMan" : 0,
              "ProdLevel" : 1,
              "ProdUpdateDate" : null,
              "ProdIsFree" : false,
              "ProdCreator" : 1,
              "ProdPrice" : 0.01,
              "ProdID" : 2435,
              "ProdName" : "税收经济研究",
              "ArticleList" : null,
              "ProdIsDiscount" : 0,
              "ReadSourceURL" : "\/Journal\/Detail\/id\/2435",
              "ProdIssue" : 5,
              "ProdAuthorName" : null
            },
            "PubProductIOSFeePrice" : 0,
            "PubProductMedia" : 10,
            "PubProductID" : 2435,
            "PubProductName" : "税收经济研究2015年第5期",
            "OrderDetailID" : 16,
            "OrderDetailtMoney" : 0.01,
            "PubProductFeePrice" : 0.01,
            "PubProductPrice" : 0.01,
            "OrderDetailSN" : "435cfd5455cc4e86a1c835470d6bc395"
          }
        ],
        "OrderStatus" : 1,
        "OrderForm" : 20,
        "OrderPayDate" : null,
        "OrderIsInvoiceStatus" : 0,
        "UserName" : "18101211287",
        "Order_tradeNo" : "",
        "OrderSerialCode" : "637289619830624973",
        "Order_token" : "",
        "OrderIOSMoney" : 0,
        "Order_requestId" : "2cf204bb5d014f4e8c2327c5518840f2",
        "PayModel" : 5,
        "Order_fee" : 0,
        "OrderIOSFeeMoney" : 0,
        "OrderID" : 8,
        "OrderConsignee" : {
          "OrderID" : 8,
          "OrderConsCity" : "天津市",
          "OrderConsProvince" : "天津市",
          "AddressID" : 2005,
          "OrderConsTel" : "010-1911986",
          "OrderCons" : "秒阿娇肯德基",
          "OrderConsigneeID" : 33,
          "OrderConsGender" : 0,
          "OrderConsMobile" : "18301228765",
          "OrderConsZipCode" : null,
          "OrderConsDetail" : "中国 天津市 和平区 而而哦"
        },
        "OrderFeeMoney" : 0.40999999999999998,
        "OrderMoney" : 0.40999999999999998
      },
      "ret" : true
    }
 */
