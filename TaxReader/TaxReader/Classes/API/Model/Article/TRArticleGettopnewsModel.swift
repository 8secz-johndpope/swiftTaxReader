//
//  TRArticleGettopnewsModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/9.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRArticleGettopnewsModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRArticleGettopnewsDataModel]?
}

struct TRArticleGettopnewsDataModel: HandyJSON {
    var News_Priority: Int = 0
    var News_AdminID: Int = 0
    var News_ID: Int = 0
    var News_Title: String?
    var News_Append_Time: String?
}

/*
    articleGetTopNews = {
      "msg" : "获取成功",
      "msgCode" : "200",
      "ret" : true,
      "data" : [
        {
          "News_Priority" : 10,
          "News_Content" : "青春如朝日 奋进正当时北京特派办第三大队、湘潭市岳塘区税务局及全国税务系统广大青年干部们：&nbsp;　　熠熠青春，灼灼其华。在“五四”青年节即将到来之际，我谨代表税务总局党委向你们致以诚挚的问候和节日的祝贺！&nbsp;　　前几天，我先后收到了北京特派办第三大队和湘潭市岳塘区税务局青年干部的来信。两封信不仅在字里行间闪烁着两家单位青年干部以税为家、勤恳尽责的奋斗场景，更从一个侧面折射出全国税务青年干部向上向善、聚力担当的精神风貌。&nbsp;　　近年来，面对接踵而至、相互叠加的税收改革发展任务，广大税务青年干部立足本职、扎实工作，干出了风采、干出了成绩。特别是今年以来面对突如其来的新冠肺炎疫情，大家坚决贯彻落实习近平总书记重要指示批示精神和党中央、国务院决策部署，按照总局党委“四力”要求，争先干、奋力担，用年轻的肩膀扛起大考的重任，以昂扬的斗志展现青春的力量。这些都充分证明，广大税务青年干部充满活力、充满朝气，积极进取、积极作为，不愧为高质量推进新时代税收现代化的生力军和突击队。我为你们勇毅前行的果敢而自豪，为你们兢兢业业的付出而点赞。&nbsp;　　青春如朝日，奋进正当时。习近平总书记曾寄语当代青年，要树立与这个时代主题同心同向的理想信念，勇于担当这个时代赋予的历史责任。我感到，你们的青春是幸运的，因为你们的个人成长始终与国家进步相映相融；你们的青春是厚实的，因为你们的个人目标始终与时代使命同向同行。广大税务青年干部只有主动把自身发展融入到国家富强、民族复兴的历史洪流中，才能让青春年华焕发出更加绚丽的光彩。&nbsp;　　恰逢新时代新税务，税务青年干部建功立业的舞台空前宽广、梦想成真的前景无比光明。希望广大税务青年深入学习贯彻习近平新时代中国特色社会主义思想，从现在抓起、从小事做起、从本职干起，珍惜韶华、担当作为，不辱使命、不负重托，努力在奋进新时代的征程中，在统筹推进疫情防控和服务经济社会发展的实干中，激扬青春之志、彰显青春之力、再创青春之功、成就青春之美，做有理想、有本领、有担当的税务青年干部，为决战决胜全面建成小康社会作出应有的贡献。&nbsp;　　时代召唤青年，青春创造未来。各级税务局党委要把青年工作摆在重要位置，尊重青年、理解青年、相信青年、支持青年，努力做青年朋友的知心人、青年工作的热心人、青年干部的引路人，为青年干部成长成才、建功立业搭建舞台、创建条件，让广大青年干部在高质量推进新时代税收现代化、更好地服务国家治理现代化中放飞青春梦想，为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦贡献更加蓬勃的税务青春力量！&nbsp;　　&nbsp;&nbsp;　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;王&nbsp;&nbsp;&nbsp;军&nbsp;　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2020年4月30日",
          "News_AdminID" : 11,
          "News_Content_HTML" : "<p align=\"center\"><strong>青春如朝日 奋进正当时<\/strong><\/p><p align=\"justify\">北京特派办第三大队、湘潭市岳塘区税务局及全国税务系统广大青年干部们：&nbsp;<\/p><p align=\"justify\">　　熠熠青春，灼灼其华。在“五四”青年节即将到来之际，我谨代表税务总局党委向你们致以诚挚的问候和节日的祝贺！&nbsp;<\/p><p align=\"justify\">　　前几天，我先后收到了北京特派办第三大队和湘潭市岳塘区税务局青年干部的来信。两封信不仅在字里行间闪烁着两家单位青年干部以税为家、勤恳尽责的奋斗场景，更从一个侧面折射出全国税务青年干部向上向善、聚力担当的精神风貌。&nbsp;<\/p><p align=\"justify\">　　近年来，面对接踵而至、相互叠加的税收改革发展任务，广大税务青年干部立足本职、扎实工作，干出了风采、干出了成绩。特别是今年以来面对突如其来的新冠肺炎疫情，大家坚决贯彻落实习近平总书记重要指示批示精神和党中央、国务院决策部署，按照总局党委“四力”要求，争先干、奋力担，用年轻的肩膀扛起大考的重任，以昂扬的斗志展现青春的力量。这些都充分证明，广大税务青年干部充满活力、充满朝气，积极进取、积极作为，不愧为高质量推进新时代税收现代化的生力军和突击队。我为你们勇毅前行的果敢而自豪，为你们兢兢业业的付出而点赞。&nbsp;<\/p><p align=\"justify\">　　青春如朝日，奋进正当时。习近平总书记曾寄语当代青年，要树立与这个时代主题同心同向的理想信念，勇于担当这个时代赋予的历史责任。我感到，你们的青春是幸运的，因为你们的个人成长始终与国家进步相映相融；你们的青春是厚实的，因为你们的个人目标始终与时代使命同向同行。广大税务青年干部只有主动把自身发展融入到国家富强、民族复兴的历史洪流中，才能让青春年华焕发出更加绚丽的光彩。&nbsp;<\/p><p align=\"justify\">　　恰逢新时代新税务，税务青年干部建功立业的舞台空前宽广、梦想成真的前景无比光明。希望广大税务青年深入学习贯彻习近平新时代中国特色社会主义思想，从现在抓起、从小事做起、从本职干起，珍惜韶华、担当作为，不辱使命、不负重托，努力在奋进新时代的征程中，在统筹推进疫情防控和服务经济社会发展的实干中，激扬青春之志、彰显青春之力、再创青春之功、成就青春之美，做有理想、有本领、有担当的税务青年干部，为决战决胜全面建成小康社会作出应有的贡献。&nbsp;<\/p><p align=\"justify\">　　时代召唤青年，青春创造未来。各级税务局党委要把青年工作摆在重要位置，尊重青年、理解青年、相信青年、支持青年，努力做青年朋友的知心人、青年工作的热心人、青年干部的引路人，为青年干部成长成才、建功立业搭建舞台、创建条件，让广大青年干部在高质量推进新时代税收现代化、更好地服务国家治理现代化中放飞青春梦想，为实现“两个一百年”奋斗目标、实现中华民族伟大复兴的中国梦贡献更加蓬勃的税务青春力量！&nbsp;<\/p><p align=\"justify\">　　<span lang=\"EN-US\">&nbsp;<\/span>&nbsp;<\/p><p align=\"right\">　　<span lang=\"EN-US\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\/span>王<span lang=\"EN-US\">&nbsp;&nbsp;&nbsp;<\/span>军&nbsp;<\/p><p align=\"right\">　　<span lang=\"EN-US\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2020<\/span>年<span lang=\"EN-US\">4<\/span>月<span lang=\"EN-US\">30<\/span>日<\/p>",
          "News_Append_Time" : "2020-06-03 10:19:53",
          "News_Sort" : 99,
          "News_Intro" : null,
          "News_Del_Flag" : false,
          "News_Del_Time" : null,
          "News_Title" : "王军局长致北京特派办第三大队、湘潭市岳塘区税务局及全国税务系统广大青年干部的一封信",
          "News_ID" : 13,
          "News_Author" : null
        },
        {
          "News_Priority" : 10,
          "News_Content" : "激励光荣榜 激励光荣榜激励光荣榜激励光荣榜激励光荣榜激励光荣榜",
          "News_AdminID" : 11,
          "News_Content_HTML" : "<p>激励光荣榜 激励光荣榜激励光荣榜激励光荣榜激励光荣榜激励光荣榜",
          "News_Append_Time" : "2020-05-15 10:50:27",
          "News_Sort" : 99,
          "News_Intro" : "激励光荣榜",
          "News_Del_Flag" : false,
          "News_Del_Time" : null,
          "News_Title" : "激励光荣榜",
          "News_ID" : 8,
          "News_Author" : "激励光荣榜"
        },
        {
          "News_Priority" : 20,
          "News_Content" : "优惠政策优惠政策优惠政策优惠政策 优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策",
          "News_AdminID" : 11,
          "News_Content_HTML" : "<p>优惠政策优惠政策优惠政策优惠政策 优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策优惠政策<img src=\"\/upload\/img\/News\/2020\/6\/20200603171354903.png\" style=\"max-width: 100%;\"><\/p>",
          "News_Append_Time" : "2020-05-15 10:47:52",
          "News_Sort" : 100,
          "News_Intro" : "优惠政策",
          "News_Del_Flag" : false,
          "News_Del_Time" : null,
          "News_Title" : "优惠政策",
          "News_ID" : 6,
          "News_Author" : "优惠政策"
        }
      ]
    }
 */

