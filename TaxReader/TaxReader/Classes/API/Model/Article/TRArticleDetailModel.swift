//
//  TRArticleDetailModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/19.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRArticleDetailModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var data: TRArticleDetailDataModel?
}

struct TRArticleDetailDataModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var ArticleID: Int = 0
    var ReadTypeRootID: Int = 0
    var ArticleTitle: String?
    var ArticleAuthorName: String?
    var ArticleCreatTime: String?
    var ArticleUnitName: String?
    var ArticleContent: String?
    var ArticleAbstract: String?
    var IsFavorite: Bool = false
    
    var ArticlePrice: Int = 0
    var ArticleIOSPrice: Double = 0.00
    
    var PubName: String?
    var PubIssueName: String?
    var PubIssueYear: Int = 0
    var PubIssueNum: Int = 0
    var PubID: Int = 0
    var PubIssueID: Int = 0
}

/*
    {
      "ret" : true,
      "msg" : "查询成功",
      "data" : {
        "ArticleIsFree" : true,
        "ArticleTitle" : "莫把社会主义税收法“绳索”",
        "ArticleEditor" : null,
        "ArticleEngUnitName" : null,
        "ArticleFixWordsPrice" : 0.20000000000000001,
        "ArticleEngAuthorName" : null,
        "ArticleClickCount" : 0,
        "PubIssueYear" : 0,
        "ArticleWordsCount" : 3142,
        "PubIssueName" : null,
        "ReadTypeID" : 2,
        "ArticleIOSPrice" : 2,
        "ArticleSourceType" : 0,
        "CataOrder" : 1,
        "ArticleKeys" : null,
        "ArticlePDF" : null,
        "ReadTypeRootID" : 2,
        "ArticleEngTitle" : null,
        "ArticleFixWords" : 300,
        "ArticleHTMLTitle" : "<p><br><\/p>",
        "ArticleDownloadCount" : 0,
        "ArticleIOSWords" : 300,
        "ArticleAbstract" : "近来，经常听到一些部门、企业借“松绑”之名，指责税务干部收税“收多了”，“收狠了”，把某些企业和个体户“收垮了”，甚至把税收称做“苛捐杂税”，看作是“捆绑”商品生产发展的“绳索”，主张“财政不监督，税务不进厂”。笔者认为，这种观点是一种偏见，一种糊涂认识。把社会主义税收看作是“捆绑”商品生产发展的“绳索”，是对社会主义税收的地位、作用缺乏应有的认识，社会主义国家的税收，是取之于民用之于民的。国家进 ……",
        "ArticlePrice" : 2,
        "ArticleReadTimeCount" : 0,
        "ArticleIOSWordsPrice" : 0.20000000000000001,
        "PubIssueID" : 894,
        "ArticleCreatTime" : "2020-03-31 12:00:00",
        "PubIssueNum" : 0,
        "ArticleAuthorName" : "沈雪",
        "PubName" : null,
        "ArticleEngKeys" : null,
        "ArticleReadCount" : 10,
        "ArticleLastModTime" : "2020-06-19 04:23:13",
        "ArticleBuyCount" : 0,
        "ArticleLevel" : 1,
        "IsFavorite" : true,
        "ArticlePagPages" : "14",
        "ArticleStatus" : 5,
        "PubIssueCataName" : null,
        "PubIssueCataID" : 28628,
        "ArticleCreator" : 1,
        "ArticleLastModifier" : 11,
        "ArticleUnitName" : null,
        "ArticleSubTitle" : null,
        "ArticleID" : 28628,
        "PubID" : 10
      },
      "msgCode" : "200"
    }
 */
