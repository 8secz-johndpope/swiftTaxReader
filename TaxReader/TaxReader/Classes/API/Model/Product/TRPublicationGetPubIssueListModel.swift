//
//  TRPublicationGetPubIssueListModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/19.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRPublicationGetPubIssueListModel: HandyJSON {
    var ret: Bool = false
    var msgCode: Int = 0
    var msg: String?
    var totalCount: Int = 0
    var data: [TRPublicationGetPubIssueListDataModel]?
}

struct TRPublicationGetPubIssueListDataModel: HandyJSON {
    var ProdID: Int = 0
    var ProdYear: Int = 0
    var ProdIssue: Int = 0
    var ProdName: String?
    var ProdImg: String?
    var ReadSourceID: String?
    var ArticleList: [TRPublicationGetPubIssueListDataArticleListModel]?
}

struct TRPublicationGetPubIssueListDataArticleListModel: HandyJSON {
    var ArticleID: Int = 0
    var ArticleAuthorName: String?
    var ArticleTitle: String?
}

/*
    {
      "ret" : true,
      "msg" : "查询成功",
      "totalCount" : 1447,
      "data" : [
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 5,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2495",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/ZS202005.Source.jpg",
          "ProdName" : "中国税务",
          "ProdID" : 2495,
          "ArticleList" : [
            {
              "ArticleTitle" : "巩固提升“非接触式”办税缴费努力实现常态化与长效化",
              "ArticleAuthorName" : "本刊特约评论员",
              "ArticleID" : 75210,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "要闻",
              "ArticleAuthorName" : null,
              "ArticleID" : 75211,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税收大数据搭桥解困助力鄂企复产复销",
              "ArticleAuthorName" : "郭瑞轩",
              "ArticleID" : 75212,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "让“非接触式”办税缴费走向常态化与长效化",
              "ArticleAuthorName" : null,
              "ArticleID" : 75213,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 5,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2494",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/GS202005.Source.jpg",
          "ProdName" : "国际税收",
          "ProdID" : 2494,
          "ArticleList" : [
            {
              "ArticleTitle" : "国际税务仲裁与“一带一路”：棒球游戏的局限性*",
              "ArticleAuthorName" : "李金艳,包晋,胡尚华,胡巍#",
              "ArticleID" : 75196,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "构建“一带一路”税收争端解决创新机制的研究",
              "ArticleAuthorName" : "国家税务总局税收科学研究所课题组",
              "ArticleID" : 75197,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "完善我国跨境税收争议解决机制的若干对策",
              "ArticleAuthorName" : "朱炎生",
              "ArticleID" : 75198,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "印度税务争议解决机制初探",
              "ArticleAuthorName" : "王珲",
              "ArticleID" : 75199,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 5,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2493",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/SY202005.Source.jpg",
          "ProdName" : "税务研究",
          "ProdID" : 2493,
          "ArticleList" : [
            {
              "ArticleTitle" : "新时代中国特色税收现代化之路再思考",
              "ArticleAuthorName" : "邓力平,陈丽",
              "ArticleID" : 75173,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "拓展“非接触式”办税缴费服务的思考*",
              "ArticleAuthorName" : "国家税务总局科研调研组",
              "ArticleID" : 75174,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税务征收体制下的基本养老保险个人缴费基数：问题、机制与对策*",
              "ArticleAuthorName" : "董克用,张燕婷,施文凯",
              "ArticleID" : 75175,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "社会保险费率国际比较：全球水平、内在差异与经验借鉴*",
              "ArticleAuthorName" : "朱小玉,杨宜勇",
              "ArticleID" : 75176,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 1,
          "ReadingTypeID" : 4,
          "ReadSourceID" : "2492",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/SX202001.Source.jpg",
          "ProdName" : "世界税收信息",
          "ProdID" : 2492,
          "ArticleList" : [
            {
              "ArticleTitle" : "美国反税基侵蚀税（BEAT）条例发布",
              "ArticleAuthorName" : null,
              "ArticleID" : 75164,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "德国颁布实施《财税促进研发活动法案》",
              "ArticleAuthorName" : null,
              "ArticleID" : 75165,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "意大利再次通过立法开征数字服务税",
              "ArticleAuthorName" : null,
              "ArticleID" : 75166,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "日本2020年税制改革提案要点概述",
              "ArticleAuthorName" : null,
              "ArticleID" : 75167,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 4,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2491",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/GS202004.Source.jpg",
          "ProdName" : "国际税收",
          "ProdID" : 2491,
          "ArticleList" : [
            {
              "ArticleTitle" : "新冠肺炎疫情对宏观经济政策、财税改革与全球化的影响",
              "ArticleAuthorName" : "张斌",
              "ArticleID" : 75150,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "各国运用财税手段应对新冠肺炎疫情的主要做法及思考",
              "ArticleAuthorName" : "詹清荣#",
              "ArticleID" : 75151,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "支持疫情防控税收政策国际比较分析",
              "ArticleAuthorName" : "李娜#",
              "ArticleID" : 75152,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "应对公共卫生事件公益捐赠扣除研究：中美比较的视角*",
              "ArticleAuthorName" : "聂淼#",
              "ArticleID" : 75153,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 4,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2490",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/ZS202004.Source.jpg",
          "ProdName" : "中国税务",
          "ProdID" : 2490,
          "ArticleList" : [
            {
              "ArticleTitle" : "发挥税收职能作用助力企业复工复产",
              "ArticleAuthorName" : "本刊特约评论员",
              "ArticleID" : 75119,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "要闻",
              "ArticleAuthorName" : null,
              "ArticleID" : 75120,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "减税费优服务助复产促发展",
              "ArticleAuthorName" : null,
              "ArticleID" : 75121,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "决胜之地税徽闪耀",
              "ArticleAuthorName" : "吕永泽,朱彦",
              "ArticleID" : 75122,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 6,
          "ReadingTypeID" : 5,
          "ReadSourceID" : "2489",
          "ProdAbstract" : null,
          "ProdYear" : 2019,
          "ProdImg" : "Layouts\/JY201906.Source.jpg",
          "ProdName" : "税收经济研究",
          "ProdID" : 2489,
          "ArticleList" : [
            {
              "ArticleTitle" : "中国税制改革中先进国际税制的构建",
              "ArticleAuthorName" : "姜跃生*",
              "ArticleID" : 75108,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "论现代化经济体系中税收作用机制的实现",
              "ArticleAuthorName" : "赵仁平*",
              "ArticleID" : 75109,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税收去杠杆的基本逻辑与国外经验",
              "ArticleAuthorName" : "洪江*",
              "ArticleID" : 75110,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "“营改增”对中国企业税务风险的影响研究*",
              "ArticleAuthorName" : null,
              "ArticleID" : 75111,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 1,
          "ReadingTypeID" : 5,
          "ReadSourceID" : "2488",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/JY202001.Source.jpg",
          "ProdName" : "税收经济研究",
          "ProdID" : 2488,
          "ArticleList" : [
            {
              "ArticleTitle" : "中国外贸新业态税收制度研究",
              "ArticleAuthorName" : "郭永泉*",
              "ArticleID" : 75097,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税收支持制造业高质量发展的政策选择*",
              "ArticleAuthorName" : "郑良海,侯英*",
              "ArticleID" : 75098,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "环境税政治可行性影响因素研究综述*",
              "ArticleAuthorName" : "周志波*",
              "ArticleID" : 75099,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "独立数字货币的增值可税性研究",
              "ArticleAuthorName" : "应玉冰*",
              "ArticleID" : 75100,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 4,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2487",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "Layouts\/SY202004.Source.jpg",
          "ProdName" : "税务研究",
          "ProdID" : 2487,
          "ArticleList" : [
            {
              "ArticleTitle" : "“税收楔子”视角下的社保降费： 抗击疫情与长远改革",
              "ArticleAuthorName" : "郑秉文,陈功",
              "ArticleID" : 75077,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "减税降费对企业“获得感”影响研究*",
              "ArticleAuthorName" : "万广南,魏升民,向景",
              "ArticleID" : 75078,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "实质性减税的效应分析：基于防范化解重大经济风险视角*",
              "ArticleAuthorName" : "杨雷鸣,朱波,苏宇,杨坦",
              "ArticleID" : 75079,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "新时代减税降费的路径优化*",
              "ArticleAuthorName" : "李德刚,高凌江",
              "ArticleID" : 75080,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 3,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2486",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "\/upload\/2020\/Layouts\/GS202003.Source.jpg",
          "ProdName" : "国际税收",
          "ProdID" : 2486,
          "ArticleList" : [
            {
              "ArticleTitle" : "漫谈国外减税",
              "ArticleAuthorName" : "朱青",
              "ArticleID" : 75064,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "个人所得税综合所得年度汇算清缴的理论与实践问题*",
              "ArticleAuthorName" : "马珺",
              "ArticleID" : 75065,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "新个人所得税法下居民个人综合所得年度申报浅析",
              "ArticleAuthorName" : "张晓,郑悦",
              "ArticleID" : 75066,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "我国开展个人所得税综合所得年度汇算清缴申报预填服务的SWOT分析和建议",
              "ArticleAuthorName" : "尤笑宇",
              "ArticleID" : 75067,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 3,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2485",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "\/upload\/2020\/Layouts\/SY202003.Source.jpg",
          "ProdName" : "税务研究",
          "ProdID" : 2485,
          "ArticleList" : [
            {
              "ArticleTitle" : "公平税收需要累进征收吗？*",
              "ArticleAuthorName" : "曾军平",
              "ArticleID" : 75036,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "强化我国税制的收入分配功能：途径、效果与对策*",
              "ArticleAuthorName" : "岳希明,张玄",
              "ArticleID" : 75037,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "我国财产性收入的税收调节：对公平的偏离及优化取向*",
              "ArticleAuthorName" : "李文,王佳",
              "ArticleID" : 75038,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "论健全税收再分配调节机制*",
              "ArticleAuthorName" : "李建军,冯黎明,尧艳",
              "ArticleID" : 75039,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 3,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2484",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "\/upload\/2020\/Layouts\/ZS202003.Source.jpg",
          "ProdName" : "中国税务",
          "ProdID" : 2484,
          "ArticleList" : [
            {
              "ArticleTitle" : "在疫情防控中践行初心使命在大战大考中彰显税务担当",
              "ArticleAuthorName" : "本刊特约评论员",
              "ArticleID" : 74997,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "要闻",
              "ArticleAuthorName" : null,
              "ArticleID" : 74998,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "使命与天职",
              "ArticleAuthorName" : null,
              "ArticleID" : 74999,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "非常之时非常之力提升纳税人缴费人安全感",
              "ArticleAuthorName" : "徐卫兴,张洞石",
              "ArticleID" : 75000,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 2,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2483",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "\/upload\/2020\/Layouts\/SY202002.Source.jpg",
          "ProdName" : "税务研究",
          "ProdID" : 2483,
          "ArticleList" : [
            {
              "ArticleTitle" : "关于降低制造业增值税税率的逻辑思考",
              "ArticleAuthorName" : "龚辉文",
              "ArticleID" : 74975,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "我国制造业税收负担及相关政策的优化*",
              "ArticleAuthorName" : "席卫群",
              "ArticleID" : 74976,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "加速折旧政策对制造业投资的激励效应*",
              "ArticleAuthorName" : "石绍宾,沈青,鞠镇远",
              "ArticleID" : 74977,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "我国税收优惠对集成电路企业发展的效应分析*",
              "ArticleAuthorName" : "孙健夫,贺佳",
              "ArticleID" : 74978,
              "ArticleEngAuthorName" : null
            }
          ]
        },
        {
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ProdIssue" : 2,
          "ReadingTypeID" : 2,
          "ReadSourceID" : "2482",
          "ProdAbstract" : null,
          "ProdYear" : 2020,
          "ProdImg" : "\/upload\/2020\/Layouts\/ZS202002.Source.jpg",
          "ProdName" : "中国税务",
          "ProdID" : 2482,
          "ArticleList" : [
            {
              "ArticleTitle" : "全力构筑打赢战“疫”的税务防线",
              "ArticleAuthorName" : "本刊特约评论员",
              "ArticleID" : 74941,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "要闻",
              "ArticleID" : 74942,
              "ArticleAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "坚决落实防控责任 全力筑牢抗疫防线",
              "ArticleID" : 74943,
              "ArticleAuthorName" : "郭瑞轩"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "战“疫”主场 湖北税务奋勇当先",
              "ArticleID" : 74944,
              "ArticleAuthorName" : "徐卫兴,张洞石"
            }
          ]
        },
        {
          "ProdAbstract" : null,
          "ReadSourceID" : "2481",
          "ProdIssue" : 2,
          "ProdImg" : "\/upload\/2020\/Layouts\/GS202002.Source.jpg",
          "ProdID" : 2481,
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdName" : "国际税收",
          "ArticleList" : [
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "百年未有之大变局下的中国国际税收研究",
              "ArticleID" : 74927,
              "ArticleAuthorName" : "邓力平"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "区块链与税收：探索新领域*",
              "ArticleID" : 74928,
              "ArticleAuthorName" : "杰弗里·欧文斯#著\\陈新 译"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "区块链技术在我国税收管理领域应用的探索",
              "ArticleID" : 74929,
              "ArticleAuthorName" : "广东省深圳市国际税收研究会课题组"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "基于主权联盟链的出口退税风险管理体系研究",
              "ArticleID" : 74930,
              "ArticleAuthorName" : "国家税务总局杭州市税务局课题组"
            }
          ],
          "ProdYear" : 2020
        },
        {
          "ProdAbstract" : null,
          "ReadSourceID" : "2480",
          "ProdIssue" : 4,
          "ProdImg" : "\/upload\/2011\/Layouts\/JY201104.Source.jpg",
          "ProdID" : 2480,
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdName" : "税收经济研究",
          "ArticleList" : [
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "中国增值税改革及其初步思考*",
              "ArticleID" : 74910,
              "ArticleAuthorName" : "靳万军"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "社会保障税的国际比较及借鉴",
              "ArticleID" : 74911,
              "ArticleAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "中国机动车辆税与交通燃料税税负考察：基于环境税视角",
              "ArticleID" : 74912,
              "ArticleAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "遗产税：不可或缺的社会心理疏导机制",
              "ArticleID" : 74913,
              "ArticleAuthorName" : "张永忠"
            }
          ],
          "ProdYear" : 2011
        },
        {
          "ProdAbstract" : null,
          "ReadSourceID" : "2479",
          "ProdIssue" : 6,
          "ProdImg" : "\/upload\/2019\/Layouts\/SX201906.Source.jpg",
          "ProdID" : 2479,
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ReadingTypeID" : 4,
          "ProdName" : "世界税收信息",
          "ArticleList" : [
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "普华永道与世界银行联合发布《2020年世界纳税报告》",
              "ArticleID" : 74904,
              "ArticleAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "OECD发布数字经济“两大支柱”方案征求意见稿",
              "ArticleID" : 74905,
              "ArticleAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "OECD发布2019年版“能源使用课税”专题报告",
              "ArticleID" : 74906,
              "ArticleAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "对英国拟议的数字服务税的批判性审查",
              "ArticleID" : 74907,
              "ArticleAuthorName" : null
            }
          ],
          "ProdYear" : 2019
        },
        {
          "ProdAbstract" : null,
          "ReadSourceID" : "2478",
          "ProdIssue" : 1,
          "ProdImg" : "\/upload\/2020\/Layouts\/SY202001.Source.jpg",
          "ProdID" : 2478,
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdName" : "税务研究",
          "ArticleList" : [
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "思维方式与理财治税",
              "ArticleID" : 74879,
              "ArticleAuthorName" : "杨斌"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "论促进金融业发展的税收政策完善",
              "ArticleID" : 74880,
              "ArticleAuthorName" : "赵全厚"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "金融产品税收制度优化探析",
              "ArticleID" : 74881,
              "ArticleAuthorName" : "尹音频,王晓慧"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "全面营改增后金融业减税外溢效应研究*",
              "ArticleID" : 74882,
              "ArticleAuthorName" : "魏彧,谢欣,卢光熙"
            }
          ],
          "ProdYear" : 2020
        },
        {
          "ProdAbstract" : null,
          "ReadSourceID" : "2477",
          "ProdIssue" : 1,
          "ProdImg" : "\/upload\/2020\/Layouts\/ZS202001.Source.jpg",
          "ProdID" : 2477,
          "ProdForm" : 10,
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdName" : "中国税务",
          "ArticleList" : [
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "在见贤思齐中奋力担当作为",
              "ArticleID" : 74838,
              "ArticleAuthorName" : "本刊特约评论员"
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "要闻",
              "ArticleID" : 74839,
              "ArticleAuthorName" : null
            },
            {
              "ArticleEngAuthorName" : null,
              "ArticleTitle" : "不忘初心勇担当 牢记使命善作为",
              "ArticleID" : 74840,
              "ArticleAuthorName" : null
            },
            {
              "ArticleTitle" : "见字如面话担当",
              "ArticleAuthorName" : "陈雨西",
              "ArticleID" : 74841,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdYear" : 2020
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 3,
          "ProdYear" : 2011,
          "ProdID" : 2476,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2011\/Layouts\/JY201103.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "房产税：困惑中的改革与立法中的民意",
              "ArticleAuthorName" : "贾绍华,曹明星,孟杰",
              "ArticleID" : 74820,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "台湾房价与“奢侈税”*",
              "ArticleAuthorName" : "李建军",
              "ArticleID" : 74821,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "“十一五”中国财税管理体制改革回顾",
              "ArticleAuthorName" : "霍军*",
              "ArticleID" : 74822,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "改革开放以来中国税制改革的主要经验与展望",
              "ArticleAuthorName" : "刘燕明,张林海*",
              "ArticleID" : 74823,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2476"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 2,
          "ProdYear" : 2011,
          "ProdID" : 2475,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2011\/Layouts\/JY201102.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "关于税收与经济关系内容体系的辨析",
              "ArticleAuthorName" : "刘新利*",
              "ArticleID" : 74801,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "实质课税原则与商业创新模式",
              "ArticleAuthorName" : "刘剑文,王文婷*",
              "ArticleID" : 74802,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "构建“两型社会”的税收激励机制*",
              "ArticleAuthorName" : "刘京娟*",
              "ArticleID" : 74803,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "促进福建台湾农民创业园发展的税收思考",
              "ArticleAuthorName" : "程辉*",
              "ArticleID" : 74804,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2475"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdIssue" : 1,
          "ProdYear" : 2020,
          "ProdID" : 2474,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2020\/Layouts\/GS202001.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "近期国际税收规则的演化",
              "ArticleAuthorName" : "张志勇",
              "ArticleID" : 74787,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "深化国际税收合作服务“一带一路”建设",
              "ArticleAuthorName" : "黄素华,马聪",
              "ArticleID" : 74788,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "国际税收关系中的法治",
              "ArticleAuthorName" : "李金艳 *著,陈新 #译",
              "ArticleID" : 74789,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "加强国际税收领域税收法治的三种途径",
              "ArticleAuthorName" : "凯斯·范·拉德*著,韩凌宇 译",
              "ArticleID" : 74790,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "国际税收",
          "ProdForm" : 10,
          "ReadSourceID" : "2474"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 5,
          "ProdYear" : 2019,
          "ProdID" : 2473,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/JY201905.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "中国税制改革70 年的历程、特征与展望",
              "ArticleAuthorName" : "李平*",
              "ArticleID" : 74775,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "地方税体系建设：基于税收治理属性的理论探讨",
              "ArticleAuthorName" : "符夷杰*",
              "ArticleID" : 74776,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "耕地占用税适用税额考察与政策建议*",
              "ArticleAuthorName" : "郭佩霞*",
              "ArticleID" : 74777,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "减税降费政策效应分析*",
              "ArticleAuthorName" : "赵丹*",
              "ArticleID" : 74778,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2473"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdIssue" : 12,
          "ProdYear" : 2019,
          "ProdID" : 2472,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201912.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "用好绩效管理“指挥棒”奏响税收发展新乐章",
              "ArticleAuthorName" : "本刊特约评论员",
              "ArticleID" : 74734,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "大事",
              "ArticleAuthorName" : null,
              "ArticleID" : 74735,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "观点",
              "ArticleAuthorName" : null,
              "ArticleID" : 74736,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "数字",
              "ArticleAuthorName" : null,
              "ArticleID" : 74737,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "中国税务",
          "ProdForm" : 10,
          "ReadSourceID" : "2472"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdIssue" : 12,
          "ProdYear" : 2019,
          "ProdID" : 2471,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/GS201912.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "主编视点",
              "ArticleAuthorName" : null,
              "ArticleID" : 74719,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "关于社会保险费费基的国际比较及经验借鉴",
              "ArticleAuthorName" : "刘雪华,韩良义,石坚",
              "ArticleID" : 74720,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "社会保障缴款名义负担率与实际负担率的国际比较",
              "ArticleAuthorName" : null,
              "ArticleID" : 74721,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "基于GFSM（2014）的广义政府非税收入国别比较",
              "ArticleAuthorName" : "邓秋云",
              "ArticleID" : 74722,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "国际税收",
          "ProdForm" : 10,
          "ReadSourceID" : "2471"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdIssue" : 12,
          "ProdYear" : 2019,
          "ProdID" : 2470,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/SY201912.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "关于新时代税收治理问题的研究",
              "ArticleAuthorName" : "汪康",
              "ArticleID" : 74693,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "落实减税降费应处理好“十大关系”",
              "ArticleAuthorName" : "国家税务总局税收科学研究所课题组",
              "ArticleID" : 74694,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "减税降费与经济高质量发展*",
              "ArticleAuthorName" : "王业斌,许雪芳",
              "ArticleID" : 74695,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "新时代税收秩序：国家治理的基因性力量",
              "ArticleAuthorName" : "刘峰",
              "ArticleID" : 74696,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税务研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2470"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 1,
          "ProdYear" : 2011,
          "ProdID" : 2469,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2011\/Layouts\/JY201101.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "税与非税：基于发展财税理念的认识",
              "ArticleAuthorName" : "邓力平*",
              "ArticleID" : 74676,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "不动产持有税改势在必行实施推进需破解三大难题",
              "ArticleAuthorName" : "胡怡建*",
              "ArticleID" : 74677,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "宏观税负调整：“十二五”税制改革的首要问题",
              "ArticleAuthorName" : "刘佐*",
              "ArticleID" : 74678,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "“十二五”时期的税收使命",
              "ArticleAuthorName" : "涂京骞,涂龙力*",
              "ArticleID" : 74679,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2469"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 4,
          "ProdIssue" : 5,
          "ProdYear" : 2019,
          "ProdID" : 2468,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/SX201905.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "经济合作与发展组织发布关于美国实施MAP最低标准的同行审议报告",
              "ArticleAuthorName" : null,
              "ArticleID" : 74668,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "美国国会研究服务局发布关于美国关税影响的报告",
              "ArticleAuthorName" : null,
              "ArticleID" : 74669,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "意大利税务机关发布“专利盒”制度实施规则",
              "ArticleAuthorName" : null,
              "ArticleID" : 74670,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "印度颁布并实施《2019年财政法》",
              "ArticleAuthorName" : null,
              "ArticleID" : 74671,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "世界税收信息",
          "ProdForm" : 10,
          "ReadSourceID" : "2468"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdIssue" : 11,
          "ProdYear" : 2019,
          "ProdID" : 2467,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/SY201911.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "宏观经济逆周期调节中的企业税负*",
              "ArticleAuthorName" : "范子英,王倩",
              "ArticleID" : 74645,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "国有企业在税收增长和逆周期调节中的贡献*",
              "ArticleAuthorName" : "白彦锋,王中华",
              "ArticleID" : 74646,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "更好发挥税收政策逆周期调节作用的思考*",
              "ArticleAuthorName" : "赵桂芝",
              "ArticleID" : 74647,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "科技创新背景下逆周期调节的税收政策选择*",
              "ArticleAuthorName" : "邓磊,王美玲,修宁宁",
              "ArticleID" : 74648,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税务研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2467"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdIssue" : 11,
          "ProdYear" : 2019,
          "ProdID" : 2466,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/ZS201911.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "优化税收营商环境 激发市场主体活力",
              "ArticleAuthorName" : "本刊特约评论员",
              "ArticleID" : 74604,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "大事",
              "ArticleAuthorName" : null,
              "ArticleID" : 74605,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "观点",
              "ArticleAuthorName" : null,
              "ArticleID" : 74606,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "数字",
              "ArticleAuthorName" : null,
              "ArticleID" : 74607,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "中国税务",
          "ProdForm" : 10,
          "ReadSourceID" : "2466"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 2,
          "ProdIssue" : 11,
          "ProdYear" : 2019,
          "ProdID" : 2465,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2019\/Layouts\/GS201911.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "主编视点",
              "ArticleAuthorName" : null,
              "ArticleID" : 74590,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "公平和现代化的国际税收体系：回顾与探索*",
              "ArticleAuthorName" : "廖体忠#",
              "ArticleID" : 74591,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "财产课税税种设置的国际比较：以G20为样本",
              "ArticleAuthorName" : "马国强",
              "ArticleID" : 74592,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "对美国财产税减免措施及其影响的政策分析",
              "ArticleAuthorName" : "刘威*",
              "ArticleID" : 74593,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "国际税收",
          "ProdForm" : 10,
          "ReadSourceID" : "2465"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 6,
          "ProdYear" : 2011,
          "ProdID" : 2464,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2011\/Layouts\/JY201106.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "思想的价值与税收征管体系重构——美国大企业税收管理模式的启示",
              "ArticleAuthorName" : "李 岩",
              "ArticleID" : 74571,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税务管理优化评价指标体系构建研究",
              "ArticleAuthorName" : "罗伟平",
              "ArticleID" : 74572,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "对税收管理专业化、信息化与征管组织优化的思考",
              "ArticleAuthorName" : "李维社",
              "ArticleID" : 74573,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "关于征收、管理、稽查协同运作的思考",
              "ArticleAuthorName" : "张立旺",
              "ArticleID" : 74574,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2464"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 5,
          "ProdYear" : 2011,
          "ProdID" : 2463,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2011\/Layouts\/JY201105.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "税收对广东利用外商投资的影响*——来自行业层面的经验证据",
              "ArticleAuthorName" : "吕立才,熊启泉,牛卫平",
              "ArticleID" : 74551,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "新一轮西部大开发有关财税政策研究",
              "ArticleAuthorName" : null,
              "ArticleID" : 74552,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "增值税转型对商业银行的影响分析",
              "ArticleAuthorName" : "文 栋,董未萌",
              "ArticleID" : 74553,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "分配正义、税基选择与涉税信息——论税制有效性的“三维结构”",
              "ArticleAuthorName" : "张念明",
              "ArticleID" : 74554,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2463"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 6,
          "ProdYear" : 2012,
          "ProdID" : 2462,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2012\/Layouts\/JY201206.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "实现分配正义的我国房地产税制改革*",
              "ArticleAuthorName" : "李 波,张诚彬",
              "ArticleID" : 74533,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "营业税改征增值税研究的文献综述*",
              "ArticleAuthorName" : "彭骥鸣,韩晓琴",
              "ArticleID" : 74534,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "创业投资企业税收政策问题探讨",
              "ArticleAuthorName" : "周仕雅,王 波",
              "ArticleID" : 74535,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "非法人企业投资者费用扣除标准探析*",
              "ArticleAuthorName" : "高亚军,王元年",
              "ArticleID" : 74536,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2462"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 5,
          "ProdYear" : 2012,
          "ProdID" : 2461,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2012\/Layouts\/JY201205.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "对我国税收信息化现状的反思与国际借鉴",
              "ArticleAuthorName" : "张 新,安体富",
              "ArticleID" : 74516,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税收战略管理的国际范式探究",
              "ArticleAuthorName" : "霍 军",
              "ArticleID" : 74517,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "构建专业化模式下大企业管理机制的思考",
              "ArticleAuthorName" : "陈金方,陆志军",
              "ArticleID" : 74518,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "论税源专业化管理背景下的办税服务厅实体化与构建",
              "ArticleAuthorName" : "曹树武,曹锦阳",
              "ArticleID" : 74519,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2461"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 4,
          "ProdYear" : 2012,
          "ProdID" : 2460,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2012\/Layouts\/JY201204.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "税收制度的分类与税制结构的比较*",
              "ArticleAuthorName" : "周克清",
              "ArticleID" : 74499,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "中美两国住房市场税收调控手段的比较与借鉴*",
              "ArticleAuthorName" : "朱志钢",
              "ArticleID" : 74500,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "房产税改革的国际借鉴与政策建议",
              "ArticleAuthorName" : "崔晓妍",
              "ArticleID" : 74501,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "保障性住房供给的财税政策支持研究",
              "ArticleAuthorName" : "倪 琳",
              "ArticleID" : 74502,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2460"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 3,
          "ProdYear" : 2012,
          "ProdID" : 2459,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2012\/Layouts\/JY201203.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "电子商务税收征管研究",
              "ArticleAuthorName" : "贾绍华,梁晓静",
              "ArticleID" : 74481,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "电子商务税务稽查研究",
              "ArticleAuthorName" : "孟 杰,贾宜正",
              "ArticleID" : 74482,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "关于税源专业化管理若干问题的再思考*",
              "ArticleAuthorName" : "徐祖跃",
              "ArticleID" : 74483,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税源专业化管理的困境及对策研究",
              "ArticleAuthorName" : "李晓鹏,杨文健",
              "ArticleID" : 74484,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2459"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 2,
          "ProdYear" : 2012,
          "ProdID" : 2458,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2012\/Layouts\/JY201202.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "税收征管国际合作的发展趋势",
              "ArticleAuthorName" : "靳东升,孙 矫,陈 玥",
              "ArticleID" : 74464,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "中国与东盟国家之间的所得税协调问题研究*",
              "ArticleAuthorName" : "王红晓",
              "ArticleID" : 74465,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "现代税负归宿理论文献综述",
              "ArticleAuthorName" : "李 捷",
              "ArticleID" : 74466,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "协调区域间税收分配的国际经验借鉴与启示",
              "ArticleAuthorName" : "周咏雪",
              "ArticleID" : 74467,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2458"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 1,
          "ProdYear" : 2012,
          "ProdID" : 2457,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2012\/Layouts\/JY201201.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "我国开征遗产税的必要性与可行性研究*——基于“库兹涅茨假说”的视角",
              "ArticleAuthorName" : "刘 荣",
              "ArticleID" : 74446,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "遗产税与遗产继承无关论*",
              "ArticleAuthorName" : "张永忠",
              "ArticleID" : 74447,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "价格传导与资源税改革目标的实现机制*",
              "ArticleAuthorName" : "周 莉",
              "ArticleID" : 74448,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "论税收治理语境下注册税务师的职业定位和职能作用",
              "ArticleAuthorName" : "肖 勇,吕亚峰",
              "ArticleID" : 74449,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2457"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 6,
          "ProdYear" : 2013,
          "ProdID" : 2456,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2013\/Layouts\/JY201306.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "外国税务组织机构改革初步研究",
              "ArticleAuthorName" : "伦玉君",
              "ArticleID" : 74429,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "从国家税收到民生税收——民生视域下的税收治理与税收管理思考",
              "ArticleAuthorName" : "柳华平",
              "ArticleID" : 74430,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "税源专业化管理背景下加强注销税务登记管理的探索",
              "ArticleAuthorName" : "周 晓,吴 蔚,杨 勉",
              "ArticleID" : 74431,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "征稿启事",
              "ArticleAuthorName" : "《税收经济研究》编辑部",
              "ArticleID" : 74432,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2456"
        },
        {
          "ProdIsFree" : false,
          "ReadingTypeID" : 5,
          "ProdIssue" : 5,
          "ProdYear" : 2013,
          "ProdID" : 2455,
          "ProdAbstract" : null,
          "ProdImg" : "\/upload\/2013\/Layouts\/JY201305.Source.jpg",
          "ArticleList" : [
            {
              "ArticleTitle" : "中韩小型企业纳税人税制安排及效应比较分析",
              "ArticleAuthorName" : "庞凤喜",
              "ArticleID" : 74412,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "新形势下构建地方税体系的基本思路",
              "ArticleAuthorName" : "王波冰,涂龙力",
              "ArticleID" : 74413,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleTitle" : "“营改增”对财税体制的影响及对策",
              "ArticleAuthorName" : "韩晓琴,王一民",
              "ArticleID" : 74414,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "周仕雅,林 森",
              "ArticleTitle" : "家庭农场涉税问题研究——以浙江五县为例",
              "ArticleID" : 74415,
              "ArticleEngAuthorName" : null
            }
          ],
          "ProdName" : "税收经济研究",
          "ProdForm" : 10,
          "ReadSourceID" : "2455"
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2013,
          "ProdIssue" : 4,
          "ReadSourceID" : "2454",
          "ProdImg" : "\/upload\/2013\/Layouts\/JY201304.Source.jpg",
          "ProdID" : 2454,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "安徽省地方税务局课题组",
              "ArticleTitle" : "新型城镇化与城镇建设税制改革*",
              "ArticleID" : 74395,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "赖勤学,陈琳英",
              "ArticleTitle" : "新经济背景下消费税征税范围的优化",
              "ArticleID" : 74396,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "王 莹",
              "ArticleTitle" : "金融业增值税的现实考察和路径选择*",
              "ArticleID" : 74397,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "罗绪富",
              "ArticleTitle" : "建筑业“营改增”问题及对策探析",
              "ArticleID" : 74398,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2013,
          "ProdIssue" : 3,
          "ReadSourceID" : "2453",
          "ProdImg" : "\/upload\/2013\/Layouts\/JY201303.Source.jpg",
          "ProdID" : 2453,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "岳树民,卢 艺",
              "ArticleTitle" : "个人所得税纳税单位的选择：家庭还是个人",
              "ArticleID" : 74381,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "李 艳,谭郁森",
              "ArticleTitle" : "上海“营改增”试点下一步扩围行业选择探究*",
              "ArticleID" : 74382,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "王正明,王 冰",
              "ArticleTitle" : "试论税收与新型城镇化",
              "ArticleID" : 74383,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "刘文谨,陈颂东",
              "ArticleTitle" : "我国宏观税负水平和结构的国际比较及税制结构优化",
              "ArticleID" : 74384,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2013,
          "ProdIssue" : 1,
          "ReadSourceID" : "2452",
          "ProdImg" : "\/upload\/2013\/Layouts\/JY201301.Source.jpg",
          "ProdID" : 2452,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "“税务领军人才培养方案研究”课题组",
              "ArticleTitle" : "税务领军人才的内外特征及其培养模式探究*——“税务领军人才培养方案研究”综述",
              "ArticleID" : 74364,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "朱诗柱",
              "ArticleTitle" : "关于税务领军人才的特征及其培养要求*",
              "ArticleID" : 74365,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "龚育军",
              "ArticleTitle" : "税务领军人才核心能力模型探究*",
              "ArticleID" : 74366,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "张永忠",
              "ArticleTitle" : "我国遗产税的开征形势判断*",
              "ArticleID" : 74367,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2013,
          "ProdIssue" : 2,
          "ReadSourceID" : "2451",
          "ProdImg" : "\/upload\/2013\/Layouts\/JY201302.Source.jpg",
          "ProdID" : 2451,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "何代欣",
              "ArticleTitle" : "结构性减税的运行情况分析及对策研究*",
              "ArticleID" : 74347,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "郭佩霞",
              "ArticleTitle" : "发展视角下我国遗产税开征困境再解*",
              "ArticleID" : 74348,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "郝晓薇,胡 庆",
              "ArticleTitle" : "由试点情况看“营改增”全国推广须注意的问题*",
              "ArticleID" : 74349,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "高 阳",
              "ArticleTitle" : "促进低碳经济发展的税收路径选择",
              "ArticleID" : 74350,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "国际税收",
          "ProdYear" : 2019,
          "ProdIssue" : 10,
          "ReadSourceID" : "2450",
          "ProdImg" : "\/upload\/2019\/Layouts\/GS201910.Source.jpg",
          "ProdID" : 2450,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : null,
              "ArticleTitle" : "主编视点 EDITOR'S NOTES",
              "ArticleID" : 74333,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "马正文*,刘洪波,江青松",
              "ArticleTitle" : "税收助推中国自贸领头雁一路前行",
              "ArticleID" : 74334,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "张国钧*",
              "ArticleTitle" : "从经济特区到先行示范区：深圳税务深度服务改革开放",
              "ArticleID" : 74335,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "本刊记者,高 阳,邓汝宇",
              "ArticleTitle" : "对海南自贸区（港）建设中财税制度创新的思考",
              "ArticleID" : 74336,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 2
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2014,
          "ProdIssue" : 6,
          "ReadSourceID" : "2449",
          "ProdImg" : "\/upload\/2014\/Layouts\/JY201406.Source.jpg",
          "ProdID" : 2449,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "漆亮亮,赖勤学",
              "ArticleTitle" : "基于整体政府理念的税务行政协助探讨*——以国土资源部门为例",
              "ArticleID" : 74319,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "李晓静,孙良佳,戴淑芬",
              "ArticleTitle" : "水泥企业协同处置废弃物税收政策分析及风险规避*",
              "ArticleID" : 74320,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "朱庆民,徐善明",
              "ArticleTitle" : "纳税人取得虚开专用发票行为及其处理*",
              "ArticleID" : 74321,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "唐荣林,谈 俊",
              "ArticleTitle" : "从一典型案例辨析不同销售方式下纳税义务时间的确认",
              "ArticleID" : 74322,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2014,
          "ProdIssue" : 5,
          "ReadSourceID" : "2448",
          "ProdImg" : "\/upload\/2014\/Layouts\/JY201405.Source.jpg",
          "ProdID" : 2448,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "杜 剑,赵子昂",
              "ArticleTitle" : "金融保险业“营改增”面临的难题与路径选择",
              "ArticleID" : 74304,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "庞凤喜",
              "ArticleTitle" : "我国房地产税制进一步改革与完善需要聚焦的几大问题*",
              "ArticleID" : 74305,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "李 华,孙 倩,龚亚洲",
              "ArticleTitle" : "铁路运输业“营改增”运行分析*",
              "ArticleID" : 74306,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "国家税务总局税收科学研究所课题组",
              "ArticleTitle" : "大企业税务风险内控机制研究*",
              "ArticleID" : 74307,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2014,
          "ProdIssue" : 4,
          "ReadSourceID" : "2447",
          "ProdImg" : "\/upload\/2014\/Layouts\/JY201404.Source.jpg",
          "ProdID" : 2447,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "黄显福",
              "ArticleTitle" : "《税收征管法》再修订需重点关注的问题",
              "ArticleID" : 74289,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "李万甫,牛军栋",
              "ArticleTitle" : "关于健全我国税法体系的若干思考",
              "ArticleID" : 74290,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "贾绍华,严嘉黎",
              "ArticleTitle" : "英美法系判例制度对完善我国税收征管体系的启迪",
              "ArticleID" : 74291,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "陕西省国家税务局课题组",
              "ArticleTitle" : "税制改革中的相关问题探索",
              "ArticleID" : 74292,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        },
        {
          "ProdIsFree" : false,
          "ProdAbstract" : null,
          "ProdName" : "税收经济研究",
          "ProdYear" : 2014,
          "ProdIssue" : 3,
          "ReadSourceID" : "2446",
          "ProdImg" : "\/upload\/2014\/Layouts\/JY201403.Source.jpg",
          "ProdID" : 2446,
          "ProdForm" : 10,
          "ArticleList" : [
            {
              "ArticleAuthorName" : "高凤勤,金延敏",
              "ArticleTitle" : "分配正义视角下遗产税财富公平分配效应机理分析*",
              "ArticleID" : 74273,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "胡 春,郝晓薇",
              "ArticleTitle" : "国家治理视角下的新一轮税制改革路径解析*",
              "ArticleID" : 74274,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "熊振宇",
              "ArticleTitle" : "营改增对融资租赁行业影响分析及政策建议",
              "ArticleID" : 74275,
              "ArticleEngAuthorName" : null
            },
            {
              "ArticleAuthorName" : "张 锐",
              "ArticleTitle" : "大企业税收管理模式探究",
              "ArticleID" : 74276,
              "ArticleEngAuthorName" : null
            }
          ],
          "ReadingTypeID" : 5
        }
      ],
      "pageIndex" : 1,
      "msgCode" : "200",
      "pageSize" : 50
    }
 */
