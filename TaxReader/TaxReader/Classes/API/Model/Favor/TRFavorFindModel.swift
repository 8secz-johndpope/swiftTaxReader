//
//  TRFavorFindModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRFavorFindModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var data: [TRFavorFindDataModel]?
}

struct TRFavorFindDataModel: HandyJSON {
    var PubIssueID: Int = 0
    var PubIssueYear: Int = 0
    var PubIssueName: String?
    var PubIssueCoverPath: String?
    var ArticleList: [TRFavorFindDataArticleListModel]?
    
    // wenzhang
    var PubID: Int = 0
    var ArticleID: Int = 0
    var ArticleAuthorName: String?
    var ArticleTitle: String?
}

struct TRFavorFindDataArticleListModel: HandyJSON {
    var ArticleID: Int = 0
    var ArticleTitle: String?
    var ArticleAuthorName: String?
    var ArticleEngAuthorName: String?
}


/*
    favorFind = {
      "ret" : true,
      "data" : [
        {
          "PubIssueID" : 918,
          "ArticleList" : [
            {
              "ArticleID" : 29362,
              "ArticleTitle" : "关于进一步完善税制若干问题的探讨",
              "ArticleAuthorName" : "于文弘",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleID" : 29363,
              "ArticleTitle" : "试论我国社会主义税制结构的模式问题",
              "ArticleAuthorName" : "侯梦蟾",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleID" : 29364,
              "ArticleTitle" : "社会主义税收征纳关系的探讨",
              "ArticleAuthorName" : "李大明",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleID" : 29365,
              "ArticleTitle" : "关于公平税负几个问题的浅析",
              "ArticleAuthorName" : "陈大杰,刘楚汉",
              "ArticleEngAuthorName" : null
            }
          ],
          "PubIssueName" : "税务研究",
          "PubIssueIsFree" : false,
          "PubIssueYear" : 1986,
          "PubIssueCoverPath" : "\/upload\/1986\/Layouts\/SY198603.Source.jpg",
          "PubIssueSumNum" : 10
        },
        {
          "PubIssueID" : 896,
          "PubIssueSumNum" : 3,
          "PubIssueIsFree" : false,
          "PubIssueName" : "中国税务",
          "PubIssueCoverPath" : "\/upload\/1984\/Layouts\/ZS198403.Source.jpg",
          "PubIssueYear" : 1984,
          "ArticleList" : [
            {
              "ArticleAuthorName" : null,
              "ArticleID" : 28683,
              "ArticleTitle" : "讲究理财之道使财政部成为国家的经营管理部",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "牛立成",
              "ArticleID" : 28684,
              "ArticleTitle" : "认真做好利改税第二步改革工作",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "郭宏德",
              "ArticleID" : 28685,
              "ArticleTitle" : "我国销售税的地位和作用",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "隋仁",
              "ArticleID" : 28686,
              "ArticleTitle" : "重庆市税务局对所属县局实行“四个垂直”管理",
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "PubIssueID" : 897,
          "PubIssueSumNum" : 1,
          "PubIssueIsFree" : false,
          "PubIssueName" : "税务研究",
          "PubIssueCoverPath" : "\/upload\/1985\/Layouts\/SY198501.Source.jpg",
          "PubIssueYear" : 1985,
          "ArticleList" : [
            {
              "ArticleAuthorName" : null,
              "ArticleID" : 28721,
              "ArticleTitle" : "中国经济学团体联合会执行主席罗元锋致贺词",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : null,
              "ArticleID" : 28722,
              "ArticleTitle" : "国务委员兼财政部长王丙乾同志在中国税务学会成立大会上的讲话",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : null,
              "ArticleID" : 28723,
              "ArticleTitle" : "戎子和同志在中国税务学会成立大会上的讲话",
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : null,
              "ArticleID" : 28724,
              "ArticleTitle" : "金鑫同志在中国税务学会成立大会上的开幕词",
              "ArticleEngAuthorName" : null
            }
          ]
        }
      ],
      "msgCode" : "200",
      "msg" : "查询成功"
    }

 */
