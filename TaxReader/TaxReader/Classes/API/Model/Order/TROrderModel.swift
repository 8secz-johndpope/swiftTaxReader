//
//  TROrderModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/5.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TROrderModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var data: [TROrderDataModel]?
}

struct TROrderDataModel: HandyJSON {
    var OrderID: Int = 0
    var UserID: Int = 0
    var OrderDate: String?
    var OrderPayDate: String?
    
    /// 订单状态（0-已取消；1-待支付；2-支付中；3-已支付；4-申请退款；5-退款中；6-已退款）
    var OrderStatus: Int = 0
    
    var OrderDetail: [TROrderDataDetailModel]?
}

struct TROrderDataDetailModel: HandyJSON {
    var OrderDetailID: Int = 0
    var OrderID: Int = 0
    var PubProductName: String?
    var Product: TROrderDataDetailProductModel?
}

struct TROrderDataDetailProductModel: HandyJSON {
    var ProdID: Int = 0
    var ProdYear: Int = 0
    var ProdName: String?
    var ProdImg: String?
}


































/*
    {
      "ret" : true,
      "pageIndex" : 1,
      "msg" : "查询成功",
      "data" : [
        {
          "OrderID" : 103,
          "OrderDetail" : [
            {
              "OrderID" : 103,
              "OrderDetailCount" : 1,
              "OrderDetailtMoney" : 0.01,
              "PubProductName" : "中国税务1984年第3期",
              "PubProductIOSFeePrice" : 0,
              "OrderDetailID" : 116,
              "PubProductMedia" : 10,
              "PubProductFeePrice" : 0.01,
              "PubProductIOSPrice" : 0,
              "OrderDetailSN" : null,
              "PubProductID" : 896,
              "PubProductPrice" : 0.01,
              "Product" : {
                "ProdType" : 10,
                "ReadingTypeID" : 2,
                "ProdSumIssue" : 0,
                "ProdIsFree" : false,
                "ProdIsDiscount" : 0,
                "ProdIsRCMD" : 1,
                "ProdStatus" : 10,
                "ProdShowStatus" : 1,
                "ProdLevel" : 1,
                "ProdUpdateDate" : "2020-05-20 02:14:24",
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdID" : 896,
                "ProdName" : "中国税务",
                "ProdAbstract" : null,
                "ReadSourceType" : 20,
                "ReadSourceID" : "896",
                "ProdImg" : "\/upload\/1984\/Layouts\/ZS198403.Source.jpg",
                "ReadTypeName" : null,
                "ProdYear" : 1984,
                "ReadTypeRootCode" : "qk",
                "ProdAuthorName" : null,
                "ReadTypeRootID" : 1,
                "ProdIssue" : 3,
                "ReadSourceURL" : "\/Journal\/Detail\/id\/896",
                "ReadSourceParentID" : 10,
                "ProdUpdateMan" : 11,
                "ProdForm" : 10,
                "ProdCreator" : 1,
                "ArticleList" : null,
                "ProdPrice" : 0.01,
                "ProdIOSPrice" : 0.01
              }
            }
          ],
          "UserID" : 4457,
          "Order_token" : "",
          "OrderFeeMoney" : 0.01,
          "Order_tradeNo" : "",
          "OrderDate" : "2020-06-10 09:19:29",
          "OrderRemarks" : "",
          "OrderForm" : 10,
          "OrderInvoice" : null,
          "PayModel" : "WECHATAPP",
          "UserName" : "18888888888",
          "OrderSerialCode" : "637273775690215518",
          "Order_failMsg" : "",
          "OrderConsignee" : null,
          "OrderIsInvoiceDueDate" : "2020-06-10 09:19:29",
          "Order_refundOrderId" : "",
          "OrderIOSMoney" : 0,
          "Order_requestId" : "6db66fbcba2448ad81ef0c3df17b92a3",
          "OrderIsInvoiceStatus" : 0,
          "OrderMoney" : 0.01,
          "OrderStatus" : 1,
          "OrderPayDate" : null,
          "OrderIOSFeeMoney" : 0,
          "Order_fee" : 0
        },
        {
          "OrderConsignee" : null,
          "OrderDate" : "2020-06-10 09:19:19",
          "Order_requestId" : "ebf2d7a3f9f84f9f956f35c8ee19c863",
          "OrderIsInvoiceStatus" : 0,
          "PayModel" : "WECHATAPP",
          "Order_refundOrderId" : "",
          "OrderID" : 102,
          "OrderDetail" : [
            {
              "OrderID" : 102,
              "OrderDetailCount" : 4,
              "OrderDetailtMoney" : 0.040000000000000001,
              "PubProductName" : "中国税务1984年第1期",
              "PubProductIOSFeePrice" : 0,
              "OrderDetailID" : 115,
              "PubProductMedia" : 10,
              "PubProductFeePrice" : 0.040000000000000001,
              "PubProductIOSPrice" : 0,
              "OrderDetailSN" : null,
              "PubProductID" : 894,
              "PubProductPrice" : 0.01,
              "Product" : {
                "ProdShowStatus" : 1,
                "ReadSourceParentID" : 10,
                "ProdIsRCMD" : 0,
                "ProdIsDiscount" : 0,
                "ProdPrice" : 0.01,
                "ProdIsFree" : false,
                "ReadTypeRootCode" : "qk",
                "ProdIssue" : 1,
                "ProdStatus" : 10,
                "ProdYear" : 1984,
                "ReadTypeName" : null,
                "ArticleList" : null,
                "ProdName" : "中国税务",
                "ReadSourceURL" : "\/Journal\/Detail\/id\/894",
                "ProdType" : 10,
                "ProdSumIssue" : 0,
                "ProdLevel" : 1,
                "ReadSourceType" : 20,
                "ProdIOSPrice" : 0.01,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
                "ProdCreator" : 1,
                "ProdAuthorName" : null,
                "ProdID" : 894,
                "ReadingTypeID" : 2,
                "ProdAbstract" : null,
                "ProdUpdateDate" : null,
                "ProdUpdateMan" : 0,
                "ReadTypeRootID" : 1,
                "ProdForm" : 10,
                "ReadSourceID" : "894"
              }
            }
          ],
          "OrderFeeMoney" : 0.040000000000000001,
          "OrderPayDate" : null,
          "UserName" : "18888888888",
          "OrderInvoice" : null,
          "Order_failMsg" : "",
          "OrderMoney" : 0.040000000000000001,
          "Order_tradeNo" : "",
          "OrderIOSMoney" : 0,
          "Order_token" : "",
          "Order_fee" : 0,
          "UserID" : 4457,
          "OrderIsInvoiceDueDate" : "2020-06-10 09:19:19",
          "OrderRemarks" : "",
          "OrderSerialCode" : "637273775599811221",
          "OrderStatus" : 3,
          "OrderForm" : 10,
          "OrderIOSFeeMoney" : 0
        },
        {
          "OrderID" : 101,
          "OrderDetail" : [
            {
              "PubProductID" : 28623,
              "OrderID" : 101,
              "PubProductFeePrice" : 0.01,
              "OrderDetailCount" : 1,
              "PubProductIOSFeePrice" : 0,
              "PubProductMedia" : 10,
              "OrderDetailID" : 114,
              "PubProductIOSPrice" : 0,
              "Product" : {
                "ProdIOSPrice" : 0.01,
                "ProdUpdateMan" : 0,
                "ProdCreator" : 1,
                "ProdAuthorName" : "顾树祯",
                "ProdAbstract" : null,
                "ReadSourceParentID" : 10,
                "ProdShowStatus" : 0,
                "ProdStatus" : 10,
                "ProdIsDiscount" : 0,
                "ReadTypeName" : null,
                "ProdLevel" : 1,
                "ProdIssue" : 1,
                "ProdPrice" : 0.01,
                "ReadTypeRootCode" : "qk",
                "ReadingTypeID" : 2,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdUpdateDate" : null,
                "ArticleList" : null,
                "ProdType" : 10,
                "ReadSourceURL" : "\/Journal\/Article\/id\/28623",
                "ProdIsFree" : false,
                "ReadTypeRootID" : 1,
                "ProdForm" : 10,
                "ReadSourceType" : 30,
                "ProdName" : "利改税第二步改革是城市经济改革的重大突破",
                "ProdID" : 28623,
                "ProdIsRCMD" : 1,
                "ProdSumIssue" : 0,
                "ReadSourceID" : "28623",
                "ProdYear" : 1984,
                "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg"
              },
              "OrderDetailtMoney" : 0.01,
              "OrderDetailSN" : null,
              "PubProductName" : "利改税第二步改革是城市经济改革的重大突破1984年第1期",
              "PubProductPrice" : 0.01
            }
          ],
          "UserID" : 4457,
          "Order_token" : "",
          "OrderFeeMoney" : 0.01,
          "Order_tradeNo" : "",
          "OrderDate" : "2020-06-10 09:19:01",
          "OrderRemarks" : "",
          "OrderForm" : 10,
          "OrderInvoice" : null,
          "PayModel" : "WECHATAPP",
          "UserName" : "18888888888",
          "OrderSerialCode" : "637273775416052925",
          "Order_failMsg" : "",
          "OrderConsignee" : null,
          "OrderIsInvoiceDueDate" : "2020-06-10 09:19:01",
          "Order_refundOrderId" : "",
          "OrderIOSMoney" : 0,
          "Order_requestId" : "59e2b8446fdc40a1afda547e8f266b39",
          "OrderIsInvoiceStatus" : 0,
          "OrderMoney" : 0.01,
          "OrderStatus" : 1,
          "OrderPayDate" : null,
          "OrderIOSFeeMoney" : 0,
          "Order_fee" : 0
        },
        {
          "OrderID" : 99,
          "OrderDetail" : [
            {
              "PubProductID" : 898,
              "OrderID" : 99,
              "PubProductFeePrice" : 0.029999999999999999,
              "OrderDetailCount" : 3,
              "PubProductIOSFeePrice" : 0,
              "PubProductMedia" : 10,
              "OrderDetailID" : 113,
              "PubProductIOSPrice" : 0,
              "Product" : {
                "ProdType" : 10,
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ReadTypeRootID" : 1,
                "ReadSourceParentID" : 11,
                "ArticleList" : null,
                "ProdIsFree" : false,
                "ReadTypeRootCode" : "qk",
                "ProdIsRCMD" : 0,
                "ProdImg" : "\/upload\/1985\/Layouts\/SY198502.Source.jpg",
                "ProdIsDiscount" : 0,
                "ProdIssue" : 2,
                "ProdIOSPrice" : 0.01,
                "ProdAuthorName" : null,
                "ReadSourceURL" : "\/Journal\/Detail\/id\/898",
                "ProdPrice" : 0.01,
                "ProdForm" : 10,
                "ProdUpdateMan" : 0,
                "ProdID" : 898,
                "ProdSumIssue" : 0,
                "ReadSourceID" : "898",
                "ProdName" : "税务研究",
                "ProdAbstract" : null,
                "ProdLevel" : 1,
                "ProdShowStatus" : 1,
                "ReadingTypeID" : 2,
                "ReadTypeName" : null,
                "ProdYear" : 1985,
                "ProdUpdateDate" : null,
                "ProdStatus" : 10,
                "ProdCreator" : 1,
                "ReadSourceType" : 20
              },
              "OrderDetailtMoney" : 0.029999999999999999,
              "OrderDetailSN" : null,
              "PubProductName" : "税务研究1985年第2期",
              "PubProductPrice" : 0.01
            }
          ],
          "UserID" : 4457,
          "Order_token" : "",
          "OrderFeeMoney" : 0.029999999999999999,
          "Order_tradeNo" : "",
          "OrderDate" : "2020-06-10 09:18:24",
          "OrderRemarks" : "",
          "OrderForm" : 10,
          "OrderInvoice" : null,
          "PayModel" : "WECHATAPP",
          "UserName" : "18888888888",
          "OrderSerialCode" : "637273775042611100",
          "Order_failMsg" : "",
          "OrderConsignee" : null,
          "OrderIsInvoiceDueDate" : "2020-06-10 09:18:24",
          "Order_refundOrderId" : "",
          "OrderIOSMoney" : 0,
          "Order_requestId" : "6c8f20c550474d48a0408047e52cae51",
          "OrderIsInvoiceStatus" : 0,
          "OrderMoney" : 0.029999999999999999,
          "OrderStatus" : 1,
          "OrderPayDate" : null,
          "OrderIOSFeeMoney" : 0,
          "Order_fee" : 0
        },
        {
          "OrderID" : 98,
          "OrderDetail" : [
            {
              "PubProductID" : 916,
              "OrderID" : 98,
              "PubProductFeePrice" : 0.01,
              "OrderDetailCount" : 1,
              "PubProductIOSFeePrice" : 0,
              "PubProductMedia" : 10,
              "OrderDetailID" : 112,
              "PubProductIOSPrice" : 0,
              "Product" : {
                "ProdType" : 10,
                "ProdIOSPrice" : 0.01,
                "ProdIsRCMD" : 0,
                "ProdStatus" : 10,
                "ReadingTypeID" : 2,
                "ProdLevel" : 1,
                "ProdCreator" : 1,
                "ProdSumIssue" : 0,
                "ArticleList" : null,
                "ProdID" : 916,
                "ReadSourceParentID" : 11,
                "ProdAbstract" : null,
                "ReadSourceType" : 20,
                "ReadTypeRootID" : 1,
                "ProdPrice" : 0.01,
                "ProdName" : "税务研究",
                "ProdUpdateMan" : 0,
                "ProdIsDiscount" : 0,
                "ReadTypeRootCode" : "qk",
                "ProdCreateTime" : "2020-03-24 12:00:00",
                "ProdYear" : 1986,
                "ReadSourceID" : "916",
                "ReadSourceURL" : "\/Journal\/Detail\/id\/916",
                "ProdAuthorName" : null,
                "ProdImg" : "\/upload\/1986\/Layouts\/SY198601.Source.jpg",
                "ProdUpdateDate" : null,
                "ProdIsFree" : false,
                "ProdShowStatus" : 1,
                "ProdIssue" : 1,
                "ProdForm" : 10,
                "ReadTypeName" : null
              },
              "OrderDetailtMoney" : 0.01,
              "OrderDetailSN" : null,
              "PubProductName" : "税务研究1986年第1期",
              "PubProductPrice" : 0.01
            }
          ],
          "UserID" : 4457,
          "Order_token" : "",
          "OrderFeeMoney" : 0.01,
          "Order_tradeNo" : "",
          "OrderDate" : "2020-06-10 09:18:12",
          "OrderRemarks" : "",
          "OrderForm" : 10,
          "OrderInvoice" : null,
          "PayModel" : "WECHATAPP",
          "UserName" : "18888888888",
          "OrderSerialCode" : "637273774928385434",
          "Order_failMsg" : "",
          "OrderConsignee" : null,
          "OrderIsInvoiceDueDate" : "2020-06-10 09:18:12",
          "Order_refundOrderId" : "",
          "OrderIOSMoney" : 0,
          "Order_requestId" : "cb078571c8314600adfceb14459014aa",
          "OrderIsInvoiceStatus" : 0,
          "OrderMoney" : 0.01,
          "OrderStatus" : 3,
          "OrderPayDate" : null,
          "OrderIOSFeeMoney" : 0,
          "Order_fee" : 0
        }
      ],
      "msgCode" : "200",
      "pageSize" : 5,
      "totalCount" : 10
    }
 */
