//
//  TRproductReadTypeModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/8.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TRproductReadTypeModel: HandyJSON {
    var ret: Bool? = false
    var msgCode: Int = 0
    var msg: String?
    var data: [TRproductReadTypeDataModel]?
}

struct TRproductReadTypeDataModel: HandyJSON {
    var ReadTypeCode: Int = 0
    var ReadTypeID: Int = 0
    var ReadTypeName: String?
    var children: [TRproductReadTypeDataChildrenModel]?
}

struct TRproductReadTypeDataChildrenModel: HandyJSON {
    var ReadTypeCode: Int = 0
    var ReadTypeID: Int = 0
    var ReadTypeName: String?
    var children: String?
}



/*
    {
      "ret" : true,
      "msgCode" : "200",
      "msg" : "查询成功",
      "data" : [
        {
          "ReadTypeParentID" : 0,
          "ReadTypeCode" : "123",
          "ReadTypeTreePath" : "11",
          "ReadTypeSort" : 0,
          "ReadTypeID" : 11,
          "ReadTypeName" : "测试数据",
          "children" : [
            {
              "ReadTypeSort" : 0,
              "ReadTypeCode" : "2222",
              "ReadTypeName" : "测试二级",
              "ReadTypeID" : 12,
              "ReadTypeTreePath" : "11,12",
              "ReadTypeParentID" : 11,
              "children" : [

              ]
            }
          ]
        },
        {
          "ReadTypeParentID" : 0,
          "ReadTypeCode" : "qk",
          "ReadTypeTreePath" : "",
          "ReadTypeSort" : 1,
          "ReadTypeID" : 1,
          "ReadTypeName" : "期刊",
          "children" : [
            {
              "ReadTypeTreePath" : "1,2",
              "ReadTypeParentID" : 1,
              "ReadTypeID" : 2,
              "ReadTypeCode" : "qkzjc",
              "ReadTypeName" : "中国税务杂志社",
              "ReadTypeSort" : 1,
              "children" : [

              ]
            },
            {
              "ReadTypeTreePath" : "1,3",
              "ReadTypeParentID" : 1,
              "ReadTypeID" : 3,
              "ReadTypeCode" : "qkxh",
              "ReadTypeName" : "中国税务学会",
              "ReadTypeSort" : 2,
              "children" : [

              ]
            },
            {
              "ReadTypeTreePath" : "1,4",
              "ReadTypeParentID" : 1,
              "ReadTypeID" : 4,
              "ReadTypeCode" : "qkrjh",
              "ReadTypeName" : "中国国际税收研究会",
              "ReadTypeSort" : 3,
              "children" : [

              ]
            },
            {
              "ReadTypeTreePath" : "1,5",
              "ReadTypeParentID" : 1,
              "ReadTypeID" : 5,
              "ReadTypeCode" : "qkdx",
              "ReadTypeName" : "中共国家税务总局党校 国家税务总局税务干部进修学院",
              "ReadTypeSort" : 4,
              "children" : [

              ]
            }
          ]
        }
      ]
    }
 */
