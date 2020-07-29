//
//  TRInvoiceInfoModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/2.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRInvoiceInfoModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRInvoiceInfoDataModel]?
}

struct TRInvoiceInfoDataModel: HandyJSON {
    var UserID: Int = 0
    var UserInvoiceID: Int = 0
    var UserInvoiceDefault: Int = 0
    
    /// 收票方类型(1-个人；2-企业)
    var UserInvoiceReceiveType: Int = 0
    
    /// 收票方抬头
    var UserInvoiceTitle: String?
    var UserInvoicePhone: String?
    var UserInvoiceEmail: String?
    
    var UserInvoiceTaxpayerNo: String?
    var UserInvoiceorAddress: String?
    var UserInvoiceBuyerBankName: String?
    var UserInvoiceBankAcount: String?
    var UserInvoiceBuyerTel: String?
}

/*
    invoiceInfo = {
      "msg" : "查询成功",
      "data" : [
        {
          "UserID" : 4459,
          "UserInvoiceID" : 41,
          "UserInvoiceContent" : null,
          "UserInvoiceReceiveType" : 1,
          "UserInvoiceBankAcount" : null,
          "UserInvoiceTaxpayerNo" : "",
          "UserInvoiceEmail" : null,
          "UserInvoiceorAddress" : null,
          "UserInvoiceTitle" : "12312313",
          "UserInvoiceBuyerBankName" : null,
          "UserInvoicePhone" : "18287557865",
          "UserInvoiceBuyerTel" : null,
          "UserInvoiceDefault" : 0
        },
        {
          "UserID" : 4459,
          "UserInvoiceID" : 42,
          "UserInvoiceContent" : null,
          "UserInvoiceReceiveType" : 2,
          "UserInvoiceBankAcount" : null,
          "UserInvoiceTaxpayerNo" : "123123123",
          "UserInvoiceEmail" : null,
          "UserInvoiceorAddress" : null,
          "UserInvoiceTitle" : "123123",
          "UserInvoiceBuyerBankName" : null,
          "UserInvoicePhone" : "18720198765",
          "UserInvoiceBuyerTel" : null,
          "UserInvoiceDefault" : 0
        },
        {
          "UserID" : 4459,
          "UserInvoiceID" : 43,
          "UserInvoiceContent" : null,
          "UserInvoiceReceiveType" : 2,
          "UserInvoiceBankAcount" : null,
          "UserInvoiceTaxpayerNo" : "123123123",
          "UserInvoiceEmail" : null,
          "UserInvoiceorAddress" : null,
          "UserInvoiceTitle" : "23123123",
          "UserInvoiceBuyerBankName" : null,
          "UserInvoicePhone" : "18301827165",
          "UserInvoiceBuyerTel" : null,
          "UserInvoiceDefault" : 0
        },
        {
          "UserID" : 4459,
          "UserInvoiceID" : 44,
          "UserInvoiceContent" : null,
          "UserInvoiceReceiveType" : 1,
          "UserInvoiceBankAcount" : null,
          "UserInvoiceTaxpayerNo" : "",
          "UserInvoiceEmail" : null,
          "UserInvoiceorAddress" : null,
          "UserInvoiceTitle" : "miao",
          "UserInvoiceBuyerBankName" : null,
          "UserInvoicePhone" : "18301212383",
          "UserInvoiceBuyerTel" : null,
          "UserInvoiceDefault" : 0
        }
      ],
      "msgCode" : "200",
      "ret" : true
    }

 */
