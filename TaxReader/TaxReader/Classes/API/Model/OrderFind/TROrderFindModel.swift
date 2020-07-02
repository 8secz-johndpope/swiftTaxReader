//
//  TROrderFindModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/10.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TROrderFindModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var pageSize: Int = 0
    var pageIndex: Int = 0
    var totalCount: Int = 0
    var data: [TROrderFindDataModel]?
}

struct TROrderFindDataModel: HandyJSON {
    var UserID: Int = 0
    var OrderID: Int = 0
    var OrderDate: String?
    var UserName: Int = 0
    var OrderStatus: Int = 0
    var OrderDetail: [TROrderFindDataDetailModel]?
}

struct TROrderFindDataDetailModel: HandyJSON {
    var PubProductID: Int = 0
    var OrderDetailID: Int = 0
    var OrderDetailCount: Int = 0
    var PubProductPrice: Double = 0
    var PubProductName: String?
    var Product: TROrderFindDataDetailProductModel?
}

struct TROrderFindDataDetailProductModel: HandyJSON {
    var ProdImg: String?
    var ProdName: String?
}



/*
    {
      "msgCode" : "200",
      "pageSize" : 5,
      "pageIndex" : 1,
      "msg" : "查询成功",
      "ret" : true,
      "totalCount" : 10,
      "data" : [
        {
          "OrderPayDate" : null,
          "OrderDate" : "2020-06-10 09:19:29",
          "OrderIsInvoiceStatus" : 0,
          "OrderDetail" : [
            {
              "OrderDetailCount" : 1,
              "PubProductFeePrice" : 0.01,
              "PubProductIOSFeePrice" : 0,
              "PubProductIOSPrice" : 0,
              "OrderDetailtMoney" : 0.01,
              "Product" : {
                "ProdIsDiscount" : 0,
                "ReadTypeRootCode" : "qk",
                "ProdIssue" : 3,
                "ProdIOSPrice" : 0.01,
                "ProdSumIssue" : 0,
                "ProdLevel" : 1,
                "ProdShowStatus" : 1,
                "ProdUpdateMan" : 11,
                "ProdIsRCMD" : 1,
                "ProdUpdateDate" : "2020-05-20 02:14:24",
                "ProdImg" : "\/upload\/1984\/Layouts\/ZS198403.Source.jpg",
                "ReadingTypeID" : 2,
                "ReadTypeRootID" : 1,
                "ReadSourceType" : 20,
                "ArticleList" : null,
                "ProdAuthorName" : null,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdPrice" : 0.01,
                "ProdID" : 896,
                "ProdName" : "中国税务",
                "ReadSourceParentID" : 10,
                "ProdIsFree" : false,
                "ProdType" : 10,
                "ReadSourceURL" : "\/Journal\/Detail\/id\/896",
                "ProdCreator" : 1,
                "ReadSourceID" : "896",
                "ProdStatus" : 10,
                "ProdYear" : 1984,
                "ProdForm" : 10,
                "ProdAbstract" : null
              },
              "OrderDetailID" : 116,
              "PubProductName" : "中国税务1984年第3期",
              "PubProductID" : 896,
              "PubProductMedia" : 10,
              "OrderID" : 103,
              "PubProductPrice" : 0.01
            }
          ],
          "OrderConsignee" : null,
          "OrderID" : 103,
          "UserName" : "18888888888",
          "OrderIsInvoiceDueDate" : "2020-06-10 09:19:29",
          "Order_failMsg" : "",
          "Order_token" : "",
          "UserID" : 4457,
          "Order_tradeNo" : "",
          "OrderIOSFeeMoney" : 0,
          "OrderRemarks" : "",
          "OrderStatus" : 1,
          "PayModel" : "WECHATAPP",
          "Order_refundOrderId" : "",
          "OrderFeeMoney" : 0.01,
          "Order_fee" : 0,
          "OrderForm" : 10,
          "Order_requestId" : "6db66fbcba2448ad81ef0c3df17b92a3",
          "OrderInvoice" : null,
          "OrderIOSMoney" : 0,
          "OrderSerialCode" : "637273775690215518",
          "OrderMoney" : 0.01
        },
        {
          "OrderPayDate" : null,
          "OrderDate" : "2020-06-10 09:19:19",
          "OrderIsInvoiceStatus" : 0,
          "OrderDetail" : [
            {
              "OrderDetailCount" : 4,
              "PubProductFeePrice" : 0.040000000000000001,
              "PubProductIOSFeePrice" : 0,
              "PubProductIOSPrice" : 0,
              "OrderDetailtMoney" : 0.040000000000000001,
              "Product" : {
                "ProdLevel" : 1,
                "ProdForm" : 10,
                "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
                "ReadSourceType" : 20,
                "ProdIOSPrice" : 0.01,
                "ProdIssue" : 1,
                "ArticleList" : null,
                "ProdYear" : 1984,
                "ProdIsFree" : false,
                "ProdID" : 894,
                "ProdIsRCMD" : 0,
                "ReadSourceURL" : "\/Journal\/Detail\/id\/894",
                "ProdName" : "中国税务",
                "ProdType" : 10,
                "ProdAbstract" : null,
                "ProdStatus" : 10,
                "ProdShowStatus" : 1,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdCreator" : 1,
                "ProdAuthorName" : null,
                "ReadingTypeID" : 2,
                "ProdPrice" : 0.01,
                "ReadSourceID" : "894",
                "ReadTypeRootCode" : "qk",
                "ProdSumIssue" : 0,
                "ProdIsDiscount" : 0,
                "ReadSourceParentID" : 10,
                "ReadTypeRootID" : 1,
                "ProdUpdateDate" : null,
                "ProdUpdateMan" : 0
              },
              "OrderDetailID" : 115,
              "PubProductName" : "中国税务1984年第1期",
              "PubProductID" : 894,
              "PubProductMedia" : 10,
              "OrderID" : 102,
              "PubProductPrice" : 0.01
            }
          ],
          "OrderConsignee" : null,
          "OrderID" : 102,
          "UserName" : "18888888888",
          "OrderIsInvoiceDueDate" : "2020-06-10 09:19:19",
          "Order_failMsg" : "",
          "Order_token" : "",
          "UserID" : 4457,
          "Order_tradeNo" : "",
          "OrderIOSFeeMoney" : 0,
          "OrderRemarks" : "",
          "OrderStatus" : 3,
          "PayModel" : "WECHATAPP",
          "Order_refundOrderId" : "",
          "OrderFeeMoney" : 0.040000000000000001,
          "Order_fee" : 0,
          "OrderForm" : 10,
          "Order_requestId" : "ebf2d7a3f9f84f9f956f35c8ee19c863",
          "OrderInvoice" : null,
          "OrderIOSMoney" : 0,
          "OrderSerialCode" : "637273775599811221",
          "OrderMoney" : 0.040000000000000001
        },
        {
          "OrderPayDate" : null,
          "OrderDate" : "2020-06-10 09:19:01",
          "OrderIsInvoiceStatus" : 0,
          "OrderDetail" : [
            {
              "OrderDetailCount" : 1,
              "PubProductFeePrice" : 0.01,
              "PubProductIOSFeePrice" : 0,
              "PubProductIOSPrice" : 0,
              "OrderDetailtMoney" : 0.01,
              "Product" : {
                "ReadTypeRootCode" : "qk",
                "ProdIsDiscount" : 0,
                "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
                "ProdUpdateMan" : 0,
                "ArticleList" : null,
                "ProdAbstract" : null,
                "ProdPrice" : 0.01,
                "ReadSourceParentID" : 10,
                "ProdIsRCMD" : 1,
                "ProdName" : "利改税第二步改革是城市经济改革的重大突破",
                "ProdUpdateDate" : null,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdStatus" : 10,
                "ProdIOSPrice" : 0.01,
                "ReadSourceType" : 30,
                "ProdCreator" : 1,
                "ProdSumIssue" : 0,
                "ProdAuthorName" : "顾树祯",
                "ReadSourceID" : "28623",
                "ReadingTypeID" : 2,
                "ProdIssue" : 1,
                "ProdLevel" : 1,
                "ReadTypeRootID" : 1,
                "ProdForm" : 10,
                "ProdIsFree" : false,
                "ProdYear" : 1984,
                "ProdShowStatus" : 0,
                "ProdID" : 28623,
                "ProdType" : 10,
                "ReadSourceURL" : "\/Journal\/Article\/id\/28623"
              },
              "OrderDetailID" : 114,
              "PubProductName" : "利改税第二步改革是城市经济改革的重大突破1984年第1期",
              "PubProductID" : 28623,
              "PubProductMedia" : 10,
              "OrderID" : 101,
              "PubProductPrice" : 0.01
            }
          ],
          "OrderConsignee" : null,
          "OrderID" : 101,
          "UserName" : "18888888888",
          "OrderIsInvoiceDueDate" : "2020-06-10 09:19:01",
          "Order_failMsg" : "",
          "Order_token" : "",
          "UserID" : 4457,
          "Order_tradeNo" : "",
          "OrderIOSFeeMoney" : 0,
          "OrderRemarks" : "",
          "OrderStatus" : 1,
          "PayModel" : "WECHATAPP",
          "Order_refundOrderId" : "",
          "OrderFeeMoney" : 0.01,
          "Order_fee" : 0,
          "OrderForm" : 10,
          "Order_requestId" : "59e2b8446fdc40a1afda547e8f266b39",
          "OrderInvoice" : null,
          "OrderIOSMoney" : 0,
          "OrderSerialCode" : "637273775416052925",
          "OrderMoney" : 0.01
        },
        {
          "OrderPayDate" : null,
          "OrderDate" : "2020-06-10 09:18:24",
          "OrderIsInvoiceStatus" : 0,
          "OrderDetail" : [
            {
              "OrderDetailCount" : 3,
              "PubProductFeePrice" : 0.029999999999999999,
              "PubProductIOSFeePrice" : 0,
              "PubProductIOSPrice" : 0,
              "OrderDetailtMoney" : 0.029999999999999999,
              "Product" : {
                "ProdStatus" : 10,
                "ProdUpdateDate" : null,
                "ProdForm" : 10,
                "ProdIsRCMD" : 0,
                "ProdYear" : 1985,
                "ReadSourceParentID" : 11,
                "ProdIssue" : 2,
                "ProdCreator" : 1,
                "ProdName" : "税务研究",
                "ProdID" : 898,
                "ProdAbstract" : null,
                "ProdLevel" : 1,
                "ReadTypeRootCode" : "qk",
                "ArticleList" : null,
                "ProdPrice" : 0.01,
                "ProdIOSPrice" : 0.01,
                "ProdShowStatus" : 1,
                "ProdUpdateMan" : 0,
                "ProdIsDiscount" : 0,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdIsFree" : false,
                "ReadTypeRootID" : 1,
                "ReadSourceID" : "898",
                "ProdSumIssue" : 0,
                "ProdType" : 10,
                "ProdImg" : "\/upload\/1985\/Layouts\/SY198502.Source.jpg",
                "ReadSourceType" : 20,
                "ReadingTypeID" : 2,
                "ReadSourceURL" : "\/Journal\/Detail\/id\/898",
                "ProdAuthorName" : null
              },
              "OrderDetailID" : 113,
              "PubProductName" : "税务研究1985年第2期",
              "PubProductID" : 898,
              "PubProductMedia" : 10,
              "OrderID" : 99,
              "PubProductPrice" : 0.01
            }
          ],
          "OrderConsignee" : null,
          "OrderID" : 99,
          "UserName" : "18888888888",
          "OrderIsInvoiceDueDate" : "2020-06-10 09:18:24",
          "Order_failMsg" : "",
          "Order_token" : "",
          "UserID" : 4457,
          "Order_tradeNo" : "",
          "OrderIOSFeeMoney" : 0,
          "OrderRemarks" : "",
          "OrderStatus" : 1,
          "PayModel" : "WECHATAPP",
          "Order_refundOrderId" : "",
          "OrderFeeMoney" : 0.029999999999999999,
          "Order_fee" : 0,
          "OrderForm" : 10,
          "Order_requestId" : "6c8f20c550474d48a0408047e52cae51",
          "OrderInvoice" : null,
          "OrderIOSMoney" : 0,
          "OrderSerialCode" : "637273775042611100",
          "OrderMoney" : 0.029999999999999999
        },
        {
          "OrderPayDate" : null,
          "OrderDate" : "2020-06-10 09:18:12",
          "OrderIsInvoiceStatus" : 0,
          "OrderDetail" : [
            {
              "OrderDetailCount" : 1,
              "PubProductFeePrice" : 0.01,
              "PubProductIOSFeePrice" : 0,
              "PubProductIOSPrice" : 0,
              "OrderDetailtMoney" : 0.01,
              "Product" : {
                "ProdIOSPrice" : 0.01,
                "ProdAbstract" : null,
                "ProdIsRCMD" : 0,
                "ProdIssue" : 1,
                "ProdIsDiscount" : 0,
                "ProdName" : "税务研究",
                "ReadSourceType" : 20,
                "ProdForm" : 10,
                "ProdUpdateDate" : null,
                "ProdStatus" : 10,
                "ReadTypeRootCode" : "qk",
                "ReadingTypeID" : 2,
                "ArticleList" : null,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdLevel" : 1,
                "ProdYear" : 1986,
                "ProdType" : 10,
                "ProdAuthorName" : null,
                "ReadTypeRootID" : 1,
                "ProdShowStatus" : 1,
                "ProdSumIssue" : 0,
                "ProdUpdateMan" : 0,
                "ProdID" : 916,
                "ProdPrice" : 0.01,
                "ReadSourceParentID" : 11,
                "ProdCreator" : 1,
                "ReadSourceID" : "916",
                "ReadSourceURL" : "\/Journal\/Detail\/id\/916",
                "ProdIsFree" : false,
                "ProdImg" : "\/upload\/1986\/Layouts\/SY198601.Source.jpg"
              },
              "OrderDetailID" : 112,
              "PubProductName" : "税务研究1986年第1期",
              "PubProductID" : 916,
              "PubProductMedia" : 10,
              "OrderID" : 98,
              "PubProductPrice" : 0.01
            }
          ],
          "OrderConsignee" : null,
          "OrderID" : 98,
          "UserName" : "18888888888",
          "OrderIsInvoiceDueDate" : "2020-06-10 09:18:12",
          "Order_failMsg" : "",
          "Order_token" : "",
          "UserID" : 4457,
          "Order_tradeNo" : "",
          "OrderIOSFeeMoney" : 0,
          "OrderRemarks" : "",
          "OrderStatus" : 3,
          "PayModel" : "WECHATAPP",
          "Order_refundOrderId" : "",
          "OrderFeeMoney" : 0.01,
          "Order_fee" : 0,
          "OrderForm" : 10,
          "Order_requestId" : "cb078571c8314600adfceb14459014aa",
          "OrderInvoice" : null,
          "OrderIOSMoney" : 0,
          "OrderSerialCode" : "637273774928385434",
          "OrderMoney" : 0.01
        }
      ]
    }
 */
