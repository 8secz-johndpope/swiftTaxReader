//
//  TaxReaderAPI.swift
//  TaxReader
//
//  Created by asdc on 2020/6/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//  header 中的 token 不作为字典值 设置 

import UIKit
import Moya
import HandyJSON
import SwiftyJSON
import MBProgressHUD

// 原先
let TaxReaderAPIProvider = MoyaProvider<TaxReaderAPI>()

public enum TaxReaderAPI {
    case login(UserName: String, UserPWD: String)
    case register(UserName: String, UserMobile: String, UserRegIP: String, AreaTreePath: String,AreaFullName: String,UserPWD: String,UserMobileAreaCode: String,UseFrom: String,SMSCode: String)
    
    // 验证类型（用户注册=1，用户登录=2，忘记密码=3）
    case getCode(NKValidateCodeReceive: String, UserMobileAreaCode: String, NKValidateCodeType: String, UserRegIP: String)
    
    // 购物车
    case cartFind(UserID: String, PageIndex: String, PageSize: String)
}

extension TaxReaderAPI:TargetType {
    public var baseURL: URL {
        return URL(string: appAPI)!
    }
    
    public var path: String {
        switch self {
        case .login(_, _):
            return "/v1/user/login"
        case .register(_, _,_,_,_,_,_,_,_):
            return "/v1/User/Register"
        case .getCode(_, _, _, _):
            return "/v1/SMS/GetCode"
        case .cartFind(_,_,_):
            return "/v1/User/cart/find"        
        }
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        var parmeters = [String:Any]()
        switch self {
        case .login(let UserName, let UserPWD):
                parmeters = [
                    "UserName": UserName,
                    "UserPWD":UserPWD,
                ] as [String : Any]
            
        case .register(let UserName, let UserMobile, let UserRegIP, let AreaTreePath, let AreaFullName, let UserPWD,let UserMobileAreaCode, let UseFrom, let SMSCode):
                parmeters = [
                    "UserName": UserName,
                    "UserMobile":UserMobile,
                    "UserRegIP": UserRegIP,
                    "AreaTreePath": AreaTreePath,
                    "AreaFullName": AreaFullName,
                    "UserPWD": UserPWD,
                    "UserMobileAreaCode": UserMobileAreaCode,
                    "UseFrom": UseFrom,
                    "SMSCode": SMSCode,
                    ] as [String : Any]
        
        case .getCode(let NKValidateCodeReceive, let UserMobileAreaCode, let NKValidateCodeType, let UserRegIP):
                parmeters = [
                    "NKValidateCodeReceive": NKValidateCodeReceive,
                    "UserMobileAreaCode":UserMobileAreaCode,
                    "NKValidateCodeType":NKValidateCodeType,
                    "UserRegIP":UserRegIP,
                ] as [String : Any]
            
        case .cartFind(let UserID, let PageIndex, let PageSize):
                parmeters = [
                    "UserID": UserID,
                    "PageIndex":PageIndex,
                    "PageSize": PageSize,
                    ] as [String : Any]            
        }
                
        print("parmeters = \(parmeters)")
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }

    public var headers: [String : String]? {
        TRAPIHeader(isHasToken: false) as? [String : String]
    }
}

// 再次封装的参考，并未执行
let LoadingPlugin = NetworkActivityPlugin { (type, target) in
    guard let vc = topVC else { return }
    switch type {
    case .began:
        MBProgressHUD.hide(for: vc.view, animated: false)
        MBProgressHUD.showAdded(to: vc.view, animated: true)
    case .ended:
        MBProgressHUD.hide(for: vc.view, animated: true)
    }
}

let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<TaxReaderAPI>.RequestResultClosure) -> Void in
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 20
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let ApiProvider = MoyaProvider<TaxReaderAPI>(requestClosure: timeoutClosure)
let ApiLoadingProvider = MoyaProvider<TaxReaderAPI>(requestClosure: timeoutClosure, plugins: [LoadingPlugin])

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func request<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable? {
        
        return request(target, completion: { (result) in
            guard let completion = completion else { return }
            guard let returnData = try? result.value?.mapModel(TRResponseData<T>.self) else {
                completion(nil)
                return
            }
            completion(returnData as? T)
        })
    }
}
