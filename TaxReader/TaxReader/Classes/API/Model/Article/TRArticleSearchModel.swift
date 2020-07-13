//
//  TRArticleSearchModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/12.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRArticleSearchModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var data: TRArticleSearchDataModel?
}

struct TRArticleSearchDataModel: HandyJSON {
    var PageIndex: Int = 0
    var PageSize: Int = 0
    var TotalCount: Int = 0
    var data: [TRArticleSearchDataDataModel]?
}

struct TRArticleSearchDataDataModel: HandyJSON {
    // 自加
    var cellIndexPathSection: Int = 0
    
    var ArticleFixWords: Int = 0
    var ArticleReadCount: Int = 0
    var PubIssueCataID: Int = 0
    var PubIssueName: String?
    var ArticleCreatTime: String?
    var PubIssueCataName: String?
    var ArticleTitle: String?
    var ArticleAuthorName: String?
    var PubIssueYear: String?
    var PubIssueNum: String?
    
    var ArticleID: Int = 0
}


/*
    {
      "data" : {
        "PageIndex" : 1,
        "data" : [
          {
            "ArticleFixWords" : 300,
            "ArticleReadCount" : 0,
            "ReadTypeRootID" : 2,
            "ArticleDownloadCount" : 0,
            "PubIssueCataID" : 75218,
            "ArticleKeys" : null,
            "ArticleEngTitle" : null,
            "PubIssueYear" : 2020,
            "PubIssueNum" : 5,
            "ArticleEditor" : null,
            "ArticleUnitName" : null,
            "ArticleEngUnitName" : null,
            "ArticleID" : 75259,
            "ArticleIOSPrice" : 0,
            "ArticleSourceType" : 0,
            "ArticlePagPages" : "0",
            "ArticleAuthorName" : null,
            "ReadTypeID" : 2,
            "ArticlePDF" : null,
            "PubIssueName" : "中国税务",
            "ArticleIOSWordsPrice" : 0.20000000000000001,
            "ArticleBuyCount" : 0,
            "ArticleEngKeys" : null,
            "ArticleCreatTime" : "2020-03-31 12:00:00",
            "ArticleClickCount" : 0,
            "ArticleIOSWords" : 300,
            "ArticleIsFree" : false,
            "PubName" : null,
            "ArticleWordsCount" : 0,
            "ArticleCreator" : 1,
            "ArticleSubTitle" : null,
            "ArticleFixWordsPrice" : 0.20000000000000001,
            "ArticleReadTimeCount" : 0,
            "ArticleLastModTime" : null,
            "ArticleStatus" : 10,
            "IsFavorite" : false,
            "ArticleLastModifier" : 0,
            "PubIssueID" : 2495,
            "ArticleAbstract" : null,
            "PubIssueCataName" : "微视频： 中国税务杂志社战疫情促发展视频展播",
            "CataOrder" : 0,
            "ArticleLevel" : 0,
            "ArticleHTMLTitle" : null,
            "ArticleEngAuthorName" : null,
            "PubID" : 10,
            "ArticleTitle" : "阿拉善左旗：电子税务局助您便捷纳税",
            "ArticlePrice" : 0
          },
          {
            "ArticleFixWords" : 300,
            "ArticleReadCount" : 0,
            "ReadTypeRootID" : 2,
            "ArticleDownloadCount" : 0,
            "PubIssueCataID" : 75218,
            "ArticleKeys" : null,
            "ArticleEngTitle" : null,
            "PubIssueYear" : 2020,
            "PubIssueNum" : 5,
            "ArticleEditor" : null,
            "ArticleUnitName" : null,
            "ArticleEngUnitName" : null,
            "ArticleID" : 75257,
            "ArticleIOSPrice" : 0,
            "ArticleSourceType" : 0,
            "ArticlePagPages" : "0",
            "ArticleAuthorName" : null,
            "ReadTypeID" : 2,
            "ArticlePDF" : null,
            "PubIssueName" : "中国税务",
            "ArticleIOSWordsPrice" : 0.20000000000000001,
            "ArticleBuyCount" : 0,
            "ArticleEngKeys" : null,
            "ArticleCreatTime" : "2020-03-31 12:00:00",
            "ArticleClickCount" : 0,
            "ArticleIOSWords" : 300,
            "ArticleIsFree" : false,
            "PubName" : null,
            "ArticleWordsCount" : 0,
            "ArticleCreator" : 1,
            "ArticleSubTitle" : null,
            "ArticleFixWordsPrice" : 0.20000000000000001,
            "ArticleReadTimeCount" : 0,
            "ArticleLastModTime" : null,
            "ArticleStatus" : 10,
            "IsFavorite" : false,
            "ArticleLastModifier" : 0,
            "PubIssueID" : 2495,
            "ArticleAbstract" : null,
            "PubIssueCataName" : "微视频： 中国税务杂志社战疫情促发展视频展播",
            "CataOrder" : 0,
            "ArticleLevel" : 0,
            "ArticleHTMLTitle" : null,
            "ArticleEngAuthorName" : null,
            "PubID" : 10,
            "ArticleTitle" : "让“车”跑起来——北京“非接触式”办税助力企业复工",
            "ArticlePrice" : 0
          },
          {
            "ArticleFixWords" : 300,
            "ArticleReadCount" : 0,
            "ReadTypeRootID" : 2,
            "ArticleDownloadCount" : 0,
            "PubIssueCataID" : 75218,
            "ArticleKeys" : null,
            "ArticleEngTitle" : null,
            "PubIssueYear" : 2020,
            "PubIssueNum" : 5,
            "ArticleEditor" : null,
            "ArticleUnitName" : null,
            "ArticleEngUnitName" : null,
            "ArticleID" : 75256,
            "ArticleIOSPrice" : 0,
            "ArticleSourceType" : 0,
            "ArticlePagPages" : "0",
            "ArticleAuthorName" : null,
            "ReadTypeID" : 2,
            "ArticlePDF" : null,
            "PubIssueName" : "中国税务",
            "ArticleIOSWordsPrice" : 0.20000000000000001,
            "ArticleBuyCount" : 0,
            "ArticleEngKeys" : null,
            "ArticleCreatTime" : "2020-03-31 12:00:00",
            "ArticleClickCount" : 0,
            "ArticleIOSWords" : 300,
            "ArticleIsFree" : false,
            "PubName" : null,
            "ArticleWordsCount" : 0,
            "ArticleCreator" : 1,
            "ArticleSubTitle" : null,
            "ArticleFixWordsPrice" : 0.20000000000000001,
            "ArticleReadTimeCount" : 0,
            "ArticleLastModTime" : null,
            "ArticleStatus" : 10,
            "IsFavorite" : false,
            "ArticleLastModifier" : 0,
            "PubIssueID" : 2495,
            "ArticleAbstract" : null,
            "PubIssueCataName" : "微视频： 中国税务杂志社战疫情促发展视频展播",
            "CataOrder" : 0,
            "ArticleLevel" : 0,
            "ArticleHTMLTitle" : null,
            "ArticleEngAuthorName" : null,
            "PubID" : 10,
            "ArticleTitle" : "“有温度”的减税费优服务",
            "ArticlePrice" : 0
          },
          {
            "ArticleFixWords" : 300,
            "ArticleReadCount" : 0,
            "ReadTypeRootID" : 2,
            "ArticleDownloadCount" : 0,
            "PubIssueCataID" : 75252,
            "ArticleKeys" : null,
            "ArticleEngTitle" : null,
            "PubIssueYear" : 2020,
            "PubIssueNum" : 5,
            "ArticleEditor" : "高宏丽",
            "ArticleUnitName" : null,
            "ArticleEngUnitName" : null,
            "ArticleID" : 75252,
            "ArticleIOSPrice" : 1.6000000000000001,
            "ArticleSourceType" : 0,
            "ArticlePagPages" : "0",
            "ArticleAuthorName" : "柴逢国,孙斌",
            "ReadTypeID" : 2,
            "ArticlePDF" : null,
            "PubIssueName" : "中国税务",
            "ArticleIOSWordsPrice" : 0.20000000000000001,
            "ArticleBuyCount" : 0,
            "ArticleEngKeys" : null,
            "ArticleCreatTime" : "2020-03-31 12:00:00",
            "ArticleClickCount" : 0,
            "ArticleIOSWords" : 300,
            "ArticleIsFree" : false,
            "PubName" : null,
            "ArticleWordsCount" : 2456,
            "ArticleCreator" : 1,
            "ArticleSubTitle" : null,
            "ArticleFixWordsPrice" : 0.20000000000000001,
            "ArticleReadTimeCount" : 0,
            "ArticleLastModTime" : null,
            "ArticleStatus" : 10,
            "IsFavorite" : false,
            "ArticleLastModifier" : 0,
            "PubIssueID" : 2495,
            "ArticleAbstract" : null,
            "PubIssueCataName" : "文化长廊",
            "CataOrder" : 0,
            "ArticleLevel" : 0,
            "ArticleHTMLTitle" : null,
            "ArticleEngAuthorName" : null,
            "PubID" : 10,
            "ArticleTitle" : "茶税起源",
            "ArticlePrice" : 1.6000000000000001
          },
          {
            "ArticleFixWords" : 300,
            "ArticleReadCount" : 0,
            "ReadTypeRootID" : 2,
            "ArticleDownloadCount" : 0,
            "PubIssueCataID" : 75247,
            "ArticleKeys" : null,
            "ArticleEngTitle" : null,
            "PubIssueYear" : 2020,
            "PubIssueNum" : 5,
            "ArticleEditor" : "李乐",
            "ArticleUnitName" : null,
            "ArticleEngUnitName" : null,
            "ArticleID" : 75251,
            "ArticleIOSPrice" : 1,
            "ArticleSourceType" : 0,
            "ArticlePagPages" : "0",
            "ArticleAuthorName" : "章泸月",
            "ReadTypeID" : 2,
            "ArticlePDF" : null,
            "PubIssueName" : "中国税务",
            "ArticleIOSWordsPrice" : 0.20000000000000001,
            "ArticleBuyCount" : 0,
            "ArticleEngKeys" : null,
            "ArticleCreatTime" : "2020-03-31 12:00:00",
            "ArticleClickCount" : 1,
            "ArticleIOSWords" : 300,
            "ArticleIsFree" : false,
            "PubName" : null,
            "ArticleWordsCount" : 1729,
            "ArticleCreator" : 1,
            "ArticleSubTitle" : null,
            "ArticleFixWordsPrice" : 0.20000000000000001,
            "ArticleReadTimeCount" : 0,
            "ArticleLastModTime" : null,
            "ArticleStatus" : 10,
            "IsFavorite" : false,
            "ArticleLastModifier" : 0,
            "PubIssueID" : 2495,
            "ArticleAbstract" : null,
            "PubIssueCataName" : "税人税事",
            "CataOrder" : 0,
            "ArticleLevel" : 0,
            "ArticleHTMLTitle" : null,
            "ArticleEngAuthorName" : null,
            "PubID" : 10,
            "ArticleTitle" : "“税务医生”为 复工企业“问诊开方”",
            "ArticlePrice" : 1
          }
        ],
        "TotalCount" : 32777,
        "PageSize" : 5
      },
      "msgCode" : "200",
      "ret" : true,
      "msg" : "查询成功"
    }
 */

