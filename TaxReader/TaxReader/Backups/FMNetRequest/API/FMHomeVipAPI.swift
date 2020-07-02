//
//  FMHomeVipAPI.swift
//  demoSwift
//
//  Created by asdc on 2019/12/27.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import UIKit
import Moya

let FMHomeVipAPIProvider = MoyaProvider<FMHomeVipAPI>()

public enum FMHomeVipAPI {
    case homeVipList
}

extension FMHomeVipAPI:TargetType {
    public var baseURL: URL {
        switch self {
        case .homeVipList:
            return URL(string: "http://mobile.ximalaya.com")!
        }
    }
    
    public var path: String {
        switch self {
        case .homeVipList:
            return "/product/v4/category/recommends/ts-1532592638951"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        let parmeters = [
            "appid":0,
            "categoryId":33,
            "contentType":"album",
            "inreview":false,
            "network":"WIFI",
            "operator":3,
            "scale":3,
            "uid":0,
            "device":"iPhone",
            "version":"6.5.3",
            "xt": Int32(Date().timeIntervalSince1970),
            "deviceId": UIDevice.current.identifierForVendor!.uuidString] as [String : Any]
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
