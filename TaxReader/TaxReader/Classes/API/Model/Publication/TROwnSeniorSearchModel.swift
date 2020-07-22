//
//  TROwnSeniorSearchModel.swift
//  TaxReader
//
//  Created by asdc on 2020/7/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

enum TypeSearch {
    case seniorSearch
    case commonSearch
}

class TROwnSeniorSearchModel: NSObject {
    var searchType: TypeSearch?
    
    var CataName: String?
    var TitleName: String?
    var AuthorName: String?
    var KeyWord: String?
    var Content: String?
    var MagazineIDs: String?
    
    var BeginYear: String?
    var EndYear: String?
    var BeginNo: String?
    var EndNo: String?
}


/*
    {
      "CataName": "string",//栏目
      "TitleName": "string",//篇名
      "AuthorName": "string",//作者
      "KeyWord": "string",--关键词
      "Content": "string",--全文
      "MagazineIDs": "string",--刊名id 逗号分割“,”
      "BeginYear": 0,--开始年份
      "BeginNo": 0,--开始期号
      "EndYear": 0,--结束年份
      "EndNo": 0,--结束期号
      "PageIndex": 0,--页码
      "PageSize": 0--页面大小
    }
 */
