//
//  TRProductGetPubYearIssueModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/17.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRProductGetPubYearIssueModel: HandyJSON {
    var ret: Bool?
    var msgCode: Int = 0
    var msg: String?
    var data: [TRProductGetPubYearIssueDataModel]?
}

struct TRProductGetPubYearIssueDataModel: HandyJSON {
    var PubID: Int = 0
    var Year: Int = 0
}

/*
    {
      "ret" : true,
      "msgCode" : "200",
      "data" : [
        {
          "Year" : 2020,
          "PubID" : 10
        },
        {
          "Year" : 2019,
          "PubID" : 10
        },
        {
          "Year" : 2018,
          "PubID" : 10
        },
        {
          "Year" : 2017,
          "PubID" : 10
        },
        {
          "Year" : 2016,
          "PubID" : 10
        },
        {
          "Year" : 2015,
          "PubID" : 10
        },
        {
          "Year" : 2014,
          "PubID" : 10
        },
        {
          "Year" : 2013,
          "PubID" : 10
        },
        {
          "Year" : 2012,
          "PubID" : 10
        },
        {
          "Year" : 2011,
          "PubID" : 10
        },
        {
          "Year" : 2010,
          "PubID" : 10
        },
        {
          "Year" : 2009,
          "PubID" : 10
        },
        {
          "Year" : 2008,
          "PubID" : 10
        },
        {
          "Year" : 2007,
          "PubID" : 10
        },
        {
          "Year" : 2006,
          "PubID" : 10
        },
        {
          "Year" : 2005,
          "PubID" : 10
        },
        {
          "Year" : 2004,
          "PubID" : 10
        },
        {
          "Year" : 2003,
          "PubID" : 10
        },
        {
          "Year" : 2002,
          "PubID" : 10
        },
        {
          "Year" : 2001,
          "PubID" : 10
        },
        {
          "Year" : 2000,
          "PubID" : 10
        },
        {
          "Year" : 1999,
          "PubID" : 10
        },
        {
          "Year" : 1998,
          "PubID" : 10
        },
        {
          "Year" : 1997,
          "PubID" : 10
        },
        {
          "Year" : 1996,
          "PubID" : 10
        },
        {
          "Year" : 1995,
          "PubID" : 10
        },
        {
          "Year" : 1994,
          "PubID" : 10
        },
        {
          "Year" : 1993,
          "PubID" : 10
        },
        {
          "Year" : 1992,
          "PubID" : 10
        },
        {
          "Year" : 1991,
          "PubID" : 10
        },
        {
          "Year" : 1990,
          "PubID" : 10
        },
        {
          "Year" : 1989,
          "PubID" : 10
        },
        {
          "Year" : 1988,
          "PubID" : 10
        },
        {
          "Year" : 1987,
          "PubID" : 10
        },
        {
          "Year" : 1986,
          "PubID" : 10
        },
        {
          "Year" : 1985,
          "PubID" : 10
        },
        {
          "Year" : 1984,
          "PubID" : 10
        }
      ],
      "msg" : "查询成功"
    }
 */
