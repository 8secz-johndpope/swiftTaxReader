//
//  TRArticleRecdModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/8.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRArticleRecdModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRArticleDataRecdModel]?
}

struct TRArticleDataRecdModel: HandyJSON {
    // 自加
    var cellIndexPathSection: Int = 0
    
    var ReadSourceID: Int = 0
    var ProdType: Int = 0
    var ReadTypeRootID: Int = 0
    var ProdName: String?
    var ProdAuthorName: String?
    var ReadTypeName: String?
    var ProdCreateTime: String?
}

/*
    articleRecd = {
      "msgCode" : "200",
      "data" : [
        {
          "ProdType" : 10,
          "ProdIsDiscount" : 0,
          "ReadTypeRootID" : 1,
          "ProdImg" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
          "ProdPrice" : 0.01,
          "ProdForm" : 10,
          "ProdCreator" : 1,
          "ProdSumIssue" : 0,
          "ProdStatus" : 10,
          "ProdAuthorName" : "顾树祯",
          "ReadTypeRootCode" : "qk",
          "ReadSourceType" : 30,
          "ProdLevel" : 1,
          "ProdYear" : 1984,
          "ProdCreateTime" : "2020-03-24 12:00:00",
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdIssue" : 1,
          "ProdIsRCMD" : 1,
          "ReadSourceURL" : "\/Journal\/Article\/id\/28623",
          "ProdID" : 28623,
          "ReadSourceID" : "28623",
          "ProdName" : "利改税第二步改革是城市经济改革的重大突破",
          "ProdIOSPrice" : 0.01,
          "ReadingTypeID" : 2,
          "ReadSourceParentID" : 10,
          "ProdShowStatus" : 0,
          "ProdUpdateDate" : null,
          "ProdUpdateMan" : 0
        },
        {
          "ProdName" : "现代化进程中国际税收制度产生的基本逻辑",
          "ProdLevel" : 1,
          "ProdForm" : 10,
          "ReadSourceURL" : "\/Journal\/Article\/id\/75073",
          "ReadTypeRootCode" : "qk",
          "ReadSourceID" : "75073",
          "ReadingTypeID" : 2,
          "ProdImg" : "\/upload\/2020\/Layouts\/GS202003.Source.jpg",
          "ProdIsRCMD" : 1,
          "ProdAbstract" : null,
          "ProdType" : 10,
          "ProdIOSPrice" : 0.01,
          "ProdCreator" : 1,
          "ReadSourceParentID" : 14,
          "ReadTypeRootID" : 1,
          "ProdStatus" : 10,
          "ProdIsFree" : false,
          "ProdYear" : 2020,
          "ProdID" : 75073,
          "ProdCreateTime" : "2020-03-24 12:00:00",
          "ProdIssue" : 3,
          "ProdIsDiscount" : 0,
          "ProdShowStatus" : 0,
          "ProdUpdateDate" : "2020-05-11 10:40:58",
          "ProdUpdateMan" : 11,
          "ProdAuthorName" : "高阳",
          "ProdSumIssue" : 0,
          "ReadSourceType" : 30,
          "ProdPrice" : 0.01
        },
        {
          "ProdName" : "中国“走出去”企业“一带一路”税收调查报告",
          "ProdLevel" : 1,
          "ProdForm" : 10,
          "ReadSourceURL" : "\/Journal\/Article\/id\/75074",
          "ReadTypeRootCode" : "qk",
          "ReadSourceID" : "75074",
          "ReadingTypeID" : 2,
          "ProdImg" : "\/upload\/2020\/Layouts\/GS202003.Source.jpg",
          "ProdIsRCMD" : 1,
          "ProdAbstract" : null,
          "ProdType" : 10,
          "ProdIOSPrice" : 0.01,
          "ProdCreator" : 1,
          "ReadSourceParentID" : 14,
          "ReadTypeRootID" : 1,
          "ProdStatus" : 10,
          "ProdIsFree" : false,
          "ProdYear" : 2020,
          "ProdID" : 75074,
          "ProdCreateTime" : "2020-03-24 12:00:00",
          "ProdIssue" : 3,
          "ProdIsDiscount" : 0,
          "ProdShowStatus" : 0,
          "ProdUpdateDate" : "2020-05-11 02:53:35",
          "ProdUpdateMan" : 11,
          "ProdAuthorName" : "“一带一路”税收研究课题组",
          "ProdSumIssue" : 0,
          "ReadSourceType" : 30,
          "ProdPrice" : 0.01
        },
        {
          "ProdName" : "中资企业投资“一带一路”沿线国家（地区）面临的税收挑战及对策建议",
          "ProdLevel" : 1,
          "ProdForm" : 10,
          "ReadSourceURL" : "\/Journal\/Article\/id\/75075",
          "ReadTypeRootCode" : "qk",
          "ReadSourceID" : "75075",
          "ReadingTypeID" : 2,
          "ProdImg" : "\/upload\/2020\/Layouts\/GS202003.Source.jpg",
          "ProdIsRCMD" : 1,
          "ProdAbstract" : null,
          "ProdType" : 10,
          "ProdIOSPrice" : 0.01,
          "ProdCreator" : 1,
          "ReadSourceParentID" : 14,
          "ReadTypeRootID" : 1,
          "ProdStatus" : 10,
          "ProdIsFree" : false,
          "ProdYear" : 2020,
          "ProdID" : 75075,
          "ProdCreateTime" : "2020-03-24 12:00:00",
          "ProdIssue" : 3,
          "ProdIsDiscount" : 0,
          "ProdShowStatus" : 0,
          "ProdUpdateDate" : "2020-05-11 02:24:53",
          "ProdUpdateMan" : 11,
          "ProdAuthorName" : "杨肖锋,邹闻苡",
          "ProdSumIssue" : 0,
          "ReadSourceType" : 30,
          "ProdPrice" : 0.01
        },
        {
          "ProdName" : "特许权使用费税收风险评估及管理分析",
          "ProdLevel" : 1,
          "ProdForm" : 10,
          "ReadSourceURL" : "\/Journal\/Article\/id\/75076",
          "ReadTypeRootCode" : "qk",
          "ReadSourceID" : "75076",
          "ReadingTypeID" : 2,
          "ProdImg" : "\/upload\/2020\/Layouts\/GS202003.Source.jpg",
          "ProdIsRCMD" : 1,
          "ProdAbstract" : null,
          "ProdType" : 10,
          "ProdIOSPrice" : 0.01,
          "ProdCreator" : 1,
          "ReadSourceParentID" : 14,
          "ReadTypeRootID" : 1,
          "ProdStatus" : 10,
          "ProdIsFree" : false,
          "ProdYear" : 2020,
          "ProdID" : 75076,
          "ProdCreateTime" : "2020-03-24 12:00:00",
          "ProdIssue" : 3,
          "ProdIsDiscount" : 1,
          "ProdShowStatus" : 1,
          "ProdUpdateDate" : "2020-05-14 03:03:39",
          "ProdUpdateMan" : 11,
          "ProdAuthorName" : "刘伟,李俭",
          "ProdSumIssue" : 0,
          "ReadSourceType" : 30,
          "ProdPrice" : 0.01
        }
      ],
      "msg" : "查询成功",
      "ret" : true
    }
 */
