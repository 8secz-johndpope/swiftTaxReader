//
//  TaxReaderHttpBodyViewModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/24.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TaxReaderHttpBodyViewModel: NSObject {
    // 数据源更新
    typealias APIDataBlock = () -> Void
    var updateBlock: APIDataBlock?
    
    var orderCreateModel: TROrderCreateModel?
    var cartBatchAddModel: TRCartBatchAddModel?
    var favorBatchAddModel: TRFavorBatchAddModel?
    var cartDeleteModel: TRCartDeleteModel?
}

extension TaxReaderHttpBodyViewModel {
    func refreshDataSource_OrderCreate(URLPath: String, parmeters: NSMutableDictionary) {
        let manager = AFHTTPSessionManager.init(sessionConfiguration: URLSessionConfiguration.default)
        manager.requestSerializer = AFHTTPRequestSerializer.init()
        manager.responseSerializer = AFHTTPResponseSerializer.init()
        manager.responseSerializer.acceptableContentTypes = ["application/json","text/json","text/javascript","text/html","text/plain"]

        let URLFullPath: String = "\(appAPI)\(URLPath)"
        let req = AFHTTPRequestSerializer.init().request(withMethod: "POST", urlString: URLFullPath, parameters: nil, error: nil)
        req.timeoutInterval = 15;

        let dictionary = TRHttpBodyAPIHeader(isHasToken: true)
        req.setValue("text/json", forHTTPHeaderField: "Content-Type")
        req.setValue(dictionary["nonce"] as? String, forHTTPHeaderField: "nonce")
        req.setValue(dictionary["signature"] as? String, forHTTPHeaderField: "signature")
        req.setValue(dictionary["timestamp"] as? String, forHTTPHeaderField: "timestamp")
        req.setValue(dictionary["authorization"] as? String, forHTTPHeaderField: "authorization")

        let jsonString: String = getJSONStringFromDictionary(dictionary: parmeters as NSDictionary)
        req.httpBody = jsonString.data(using: .utf8)
        manager.dataTask(with: req as URLRequest, uploadProgress: nil, downloadProgress: nil) { (response, responseObject, error) in
            if ((error) != nil) {
                print(error as Any)
            }

            guard let returnData = responseObject else {
                print("returnData nil")
                return
            }

            let json = JSON(returnData)
            print("OrderCreate = \(String(describing: json))")

            if let mappedObject = JSONDeserializer<TROrderCreateModel>.deserializeFrom(json: json.description) {
                self.orderCreateModel = mappedObject
            }
            self.updateBlock?()

        }.resume()
        
        
        
//        let path = Bundle.main.path(forResource: "OrderCreate", ofType: "json")
//        if let jsonPath = path {
//            let jsonData = NSData(contentsOfFile: jsonPath)
//            do {
//                let json = JSON(jsonData!)
//                print(json.description)
//
//                if let mappedObject = JSONDeserializer<TROrderCreateModel>.deserializeFrom(json: json.description) {
//                    self.orderCreateModel = mappedObject
//                }
//
//                self.updateBlock?()
//            }
//        }

    }
    
    func refreshDataSource_CartBatchAdd(URLPath: String, parmetersArray: NSMutableArray) {
        let manager = AFHTTPSessionManager.init(sessionConfiguration: URLSessionConfiguration.default)
        manager.requestSerializer = AFHTTPRequestSerializer.init()
        manager.responseSerializer = AFHTTPResponseSerializer.init()
        manager.responseSerializer.acceptableContentTypes = ["application/json","text/json","text/javascript","text/html","text/plain"]

        let URLFullPath: String = "\(appAPI)\(URLPath)"
        let req = AFHTTPRequestSerializer.init().request(withMethod: "POST", urlString: URLFullPath, parameters: nil, error: nil)
        req.timeoutInterval = 15;

        let dictionary = TRHttpBodyAPIHeader(isHasToken: true)
        req.setValue("text/json", forHTTPHeaderField: "Content-Type")
        req.setValue(dictionary["nonce"] as? String, forHTTPHeaderField: "nonce")
        req.setValue(dictionary["signature"] as? String, forHTTPHeaderField: "signature")
        req.setValue(dictionary["timestamp"] as? String, forHTTPHeaderField: "timestamp")
        req.setValue(dictionary["authorization"] as? String, forHTTPHeaderField: "authorization")

        let jsonString: String = getJSONStringFromArray(parmetersArray as NSMutableArray)
        req.httpBody = jsonString.data(using: .utf8)
        manager.dataTask(with: req as URLRequest, uploadProgress: nil, downloadProgress: nil) { (response, responseObject, error) in
            if ((error) != nil) {
                print(error as Any)
            }

            guard let returnData = responseObject else {
                print("returnData nil")
                return
            }

            let json = JSON(returnData)
            print("CartBatchAdd = \(String(describing: json))")

            if let mappedObject = JSONDeserializer<TRCartBatchAddModel>.deserializeFrom(json: json.description) {
                self.cartBatchAddModel = mappedObject
            }
            self.updateBlock?()

        }.resume()
    }
    
    func refreshDataSource_CartDelete(URLPath: String, parmetersArray: NSMutableArray) {
        let manager = AFHTTPSessionManager.init(sessionConfiguration: URLSessionConfiguration.default)
        manager.requestSerializer = AFHTTPRequestSerializer.init()
        manager.responseSerializer = AFHTTPResponseSerializer.init()
        manager.responseSerializer.acceptableContentTypes = ["application/json","text/json","text/javascript","text/html","text/plain"]

        let URLFullPath: String = "\(appAPI)\(URLPath)"
        let req = AFHTTPRequestSerializer.init().request(withMethod: "POST", urlString: URLFullPath, parameters: nil, error: nil)
        req.timeoutInterval = 15;

        let dictionary = TRHttpBodyAPIHeader(isHasToken: true)
        req.setValue("text/json", forHTTPHeaderField: "Content-Type")
        req.setValue(dictionary["nonce"] as? String, forHTTPHeaderField: "nonce")
        req.setValue(dictionary["signature"] as? String, forHTTPHeaderField: "signature")
        req.setValue(dictionary["timestamp"] as? String, forHTTPHeaderField: "timestamp")
        req.setValue(dictionary["authorization"] as? String, forHTTPHeaderField: "authorization")

        let jsonString: String = getJSONStringFromArray(parmetersArray as NSMutableArray)
        req.httpBody = jsonString.data(using: .utf8)
        manager.dataTask(with: req as URLRequest, uploadProgress: nil, downloadProgress: nil) { (response, responseObject, error) in
            if ((error) != nil) {
                print(error as Any)
            }

            guard let returnData = responseObject else {
                print("returnData nil")
                return
            }

            let json = JSON(returnData)
            print("FavorBatchAdd = \(String(describing: json))")

            if let mappedObject = JSONDeserializer<TRCartDeleteModel>.deserializeFrom(json: json.description) {
                self.cartDeleteModel = mappedObject
            }
            self.updateBlock?()

        }.resume()
    }
    
    
    func refreshDataSource_FavorBatchAdd(URLPath: String, parmetersArray: NSMutableArray) {
        let manager = AFHTTPSessionManager.init(sessionConfiguration: URLSessionConfiguration.default)
        manager.requestSerializer = AFHTTPRequestSerializer.init()
        manager.responseSerializer = AFHTTPResponseSerializer.init()
        manager.responseSerializer.acceptableContentTypes = ["application/json","text/json","text/javascript","text/html","text/plain"]

        let URLFullPath: String = "\(appAPI)\(URLPath)"
        let req = AFHTTPRequestSerializer.init().request(withMethod: "POST", urlString: URLFullPath, parameters: nil, error: nil)
        req.timeoutInterval = 15;

        let dictionary = TRHttpBodyAPIHeader(isHasToken: true)
        req.setValue("text/json", forHTTPHeaderField: "Content-Type")
        req.setValue(dictionary["nonce"] as? String, forHTTPHeaderField: "nonce")
        req.setValue(dictionary["signature"] as? String, forHTTPHeaderField: "signature")
        req.setValue(dictionary["timestamp"] as? String, forHTTPHeaderField: "timestamp")
        req.setValue(dictionary["authorization"] as? String, forHTTPHeaderField: "authorization")

        let jsonString: String = getJSONStringFromArray(parmetersArray as NSMutableArray)
        req.httpBody = jsonString.data(using: .utf8)
        manager.dataTask(with: req as URLRequest, uploadProgress: nil, downloadProgress: nil) { (response, responseObject, error) in
            if ((error) != nil) {
                print(error as Any)
            }

            guard let returnData = responseObject else {
                print("returnData nil")
                return
            }

            let json = JSON(returnData)
            print("FavorBatchAdd = \(String(describing: json))")

            if let mappedObject = JSONDeserializer<TRFavorBatchAddModel>.deserializeFrom(json: json.description) {
                self.favorBatchAddModel = mappedObject
            }
            self.updateBlock?()

        }.resume()
    }
}

extension TaxReaderHttpBodyViewModel {
    //MARK: -时间转时间戳函数
    func TRHttpBodyAPIHeader(isHasToken: Bool) -> Dictionary<String, Any> {
        let appsecretString = appsecret
        let timestampString = Date().milliStamp // 13位时间戳
        let changeTimestampString = String(describing: (Int(timestampString) ?? 0) - 10000) // 提前5秒合适 - 5000
        print("时间戳是(目前当前时间减了10秒) = \(changeTimestampString)")
        
        let nonceString = "049e73d6e0744a7491c\(changeTimestampString)" // 一次性随机数 32位
        
        // appSecret=c4ca4238a0b923820dcc509a6f75849b&nonce=049e73d6e0744a7491cda2a0a537b90d&timestamp=1466399895704
        // 按照key以升序的方式排序，组合成字符串,使用SHA1WithRSA进行加密,返回小写形式的内容
        // 签名有效期只有一次,每次调用接口时都需要重新生成签名
        let signatureFormat = "appSecret=\(appsecretString)&nonce=\(nonceString)&timestamp=\(changeTimestampString)"
        let signatureString = signatureFormat.sha1()
        print("待签名的字符串是 = \(signatureFormat)")
        print("签名后的字符串是 = \(signatureString)")
        
        var dictionary: [String:String] = [:]
        dictionary.updateValue("text/json", forKey: "Content-Type")
        dictionary.updateValue(nonceString, forKey: "nonce")
        dictionary.updateValue(signatureString, forKey: "signature")
        dictionary.updateValue(changeTimestampString, forKey: "timestamp")
        
        let headerToken: String = UserDefaults.LoginInfo.string(forKey: .access_token) ?? "111"
        if isHasToken && !headerToken.isBlank {
            dictionary.updateValue(headerToken, forKey: "authorization")
        }
        
        print("最后的 header 是 = \(dictionary)")
        
        return dictionary
    }
}

extension TaxReaderHttpBodyViewModel{
    // data转JSON
    func dataToJSON(data: NSData) -> AnyObject? {
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
        } catch {
            print(error)
        }
        return nil
    }
    
     // 字典转换为JSON串
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
     //数组转JSON
     func getJSONStringFromArray(_ array:NSMutableArray)->String{
         if (!JSONSerialization.isValidJSONObject(array)) {
             print("is not a valid json object")
             return ""
         }
        
         let data : Data! = try? JSONSerialization.data(withJSONObject: array, options: [])
         let str = NSString(data:data, encoding: String.Encoding.utf8.rawValue)
         return str! as String
     }
    
}
