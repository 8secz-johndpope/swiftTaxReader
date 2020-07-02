//
//  TRProductDetailModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/17.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRProductDetailModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var data: TRProductDetailDataModel?
}

struct TRProductDetailDataModel: HandyJSON {
    var PubID: Int = 0
    var ProdID: Int = 0
    var PubIssueYear: Int = 0
    var PubIssueNum: Int = 0
    var PubIssueSumNum: Int = 0
    var PubCycle: Int = 0
    var PubStartBuildYear: Int = 0
    var PubIssueIOSPrice: Int = 0
    var PubIssueISSN: String?
    var PubIssueMgrUnit: String?
    var PubIssueExeUnit: String?
    var PubIssueName: String?
    var PubIssueCN: String?
    var PubLanguage: String?
    var PubPlace: String?
    var PubIssueCoverPath: String?
    var IsFavorite: Bool? = false
    var PubIssueCata: [TRProductDetailDataPubIssueCataModel]?
    
    var PubIssueID: Int = 0
    var IsSubscribe: Bool? = false
    var PubIssueFreePDF: String?
    var PubIssuePDF: String?
}

struct TRProductDetailDataPubIssueCataModel: HandyJSON {
    var ArticleList: [TRProductDetailDataPubIssueCataArticleListModel]?
    var PubIssueCataName: String?
}

struct TRProductDetailDataPubIssueCataArticleListModel: HandyJSON {
    var ArticleID: Int = 0
    var ArticleTitle: String?
}

/*
    {
      "msgCode" : "200",
      "ret" : true,
      "data" : {
        "PubLanguage" : null,
        "PubSize" : null,
        "PubIssueFreePDF" : "\/upload\/1984\/Layouts\/ZS198401.Probation.pdf",
        "PubCycle" : 0,
        "PubIssueYearNum" : 198401,
        "PubIssueMgrUnit" : "国家税务总局",
        "PubIssueISSN" : null,
        "ProdID" : 894,
        "PubName" : null,
        "PubIssueCoverThunPath" : "\/upload\/1984\/Layouts\/ZS198401.Thumbnail.jpg",
        "PubPlace" : null,
        "PubIssueExeUnit" : "中国税务杂志社",
        "PubID" : 10,
        "PubStartBuildYear" : 1984,
        "PubIssueYear" : 1984,
        "PubIssueIsFree" : false,
        "PubIssueCoverPath" : "\/upload\/1984\/Layouts\/ZS198401.Source.jpg",
        "PubIssueID" : 894,
        "PubIssueCata" : [
          {
            "ArticleList" : [
              {
                "ArticleID" : 28628,
                "ArticleTitle" : "莫把社会主义税收法“绳索”"
              }
            ],
            "PubIssueCataName" : "税收论坛"
          },
          {
            "ArticleList" : [
              {
                "ArticleID" : 28629,
                "ArticleTitle" : "中国税务学会筹备组成立"
              },
              {
                "ArticleID" : 28630,
                "ArticleTitle" : "家税务专刊编辑在哈尔滨召开座谈会"
              },
              {
                "ArticleID" : 28632,
                "ArticleTitle" : "辱骂税务干部挑起围攻税务机关者受到拘留处分"
              },
              {
                "ArticleID" : 28633,
                "ArticleTitle" : "汕头市税务局创办税务函授学校"
              }
            ],
            "PubIssueCataName" : "简讯"
          },
          {
            "ArticleList" : [
              {
                "ArticleID" : 28631,
                "ArticleTitle" : "帮助企业进行利改税第二步的改革"
              },
              {
                "ArticleID" : 75262,
                "ArticleTitle" : "12121"
              }
            ],
            "PubIssueCataName" : "怎样当好税务专管员"
          },
          {
            "ArticleList" : [
              {
                "ArticleID" : 28634,
                "ArticleTitle" : "支持农村发展商品生产和商品流通"
              }
            ],
            "PubIssueCataName" : "税务专管纵横谈"
          },
          {
            "ArticleList" : [
              {
                "ArticleID" : 28635,
                "ArticleTitle" : "关于国际税收抵免问题"
              },
              {
                "ArticleID" : 28636,
                "ArticleTitle" : "财政部海洋石油税务局简介"
              },
              {
                "ArticleID" : 28637,
                "ArticleTitle" : "读历史 谈改革"
              }
            ],
            "PubIssueCataName" : "工作研究"
          },
          {
            "ArticleList" : [
              {
                "ArticleID" : 28638,
                "ArticleTitle" : "我国工商税制的建立和变革概况"
              }
            ],
            "PubIssueCataName" : "资料"
          },
          {
            "ArticleList" : [
              {
                "ArticleID" : 28639,
                "ArticleTitle" : "雪中送炭扶持生产"
              },
              {
                "ArticleID" : 28640,
                "ArticleTitle" : "从研究市场、提供信息入手开辟税源"
              }
            ],
            "PubIssueCataName" : "税收征管"
          },
          {
            "ArticleList" : [
              {
                "ArticleTitle" : "正确使用“经验效益”这个概念",
                "ArticleID" : 28641
              }
            ],
            "PubIssueCataName" : "报刊文摘"
          },
          {
            "ArticleList" : [
              {
                "ArticleTitle" : "铁面无私的税务官",
                "ArticleID" : 28642
              },
              {
                "ArticleTitle" : "原则面前不退让",
                "ArticleID" : 28643
              },
              {
                "ArticleTitle" : "重视调查研究坚持苦干实干",
                "ArticleID" : 28644
              },
              {
                "ArticleTitle" : "扶个体户上马的人",
                "ArticleID" : 28645
              },
              {
                "ArticleTitle" : "当好普通一兵",
                "ArticleID" : 28646
              },
              {
                "ArticleTitle" : "献给你，光荣的税收员",
                "ArticleID" : 28647
              }
            ],
            "PubIssueCataName" : "先进人物"
          },
          {
            "ArticleList" : [
              {
                "ArticleID" : 28648,
                "ArticleTitle" : "财政部、总后勤部关于军队系统所属宾馆、饭店、招待所征收国营企业所得税的通知"
              },
              {
                "ArticleID" : 28649,
                "ArticleTitle" : "财政部关于贯彻国务院《国营企业奖金税暂行规定》有关问题的通知"
              },
              {
                "ArticleID" : 28650,
                "ArticleTitle" : "财政部关于对出口船舶免征增值税的通知"
              },
              {
                "ArticleID" : 28651,
                "ArticleTitle" : "财政部税务总局关于中、日两国政府税收协定生效的通知"
              },
              {
                "ArticleID" : 28652,
                "ArticleTitle" : "财政部海洋石油税务局关于外国合同者报送所得税申报表的几个问题的通知"
              },
              {
                "ArticleID" : 28653,
                "ArticleTitle" : "财政部关于各级各类(含全日制和业余的)学校免征国家能源交通重点建设基金和有关征税问题的通知"
              },
              {
                "ArticleID" : 28654,
                "ArticleTitle" : "财政部关于免征档案馆库房和工作用房自筹资金建筑税的通知"
              },
              {
                "ArticleID" : 28655,
                "ArticleTitle" : "财政部关于国家基建计划安排中国银行发放的基建贷款免征建筑税的通知"
              },
              {
                "ArticleID" : 28656,
                "ArticleTitle" : "财政部关于专款安排盲聋哑残人员就业的福利生产单位自筹生产性建设投资免征建筑税的通知"
              }
            ],
            "PubIssueCataName" : "税务法规公报"
          }
        ],
        "PubIssueSumNum" : 1,
        "IsFavorite" : false,
        "PubIssueName" : "中国税务",
        "PubIssueCN" : "CN11-1178\/F",
        "PubIssueNum" : 1
      },
      "msg" : "查询成功"
    }
 */
