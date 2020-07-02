//
//  TRBaseViewController.swift
//  TaxReader
//
//  Created by asdc on 2020/6/12.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit

class TRBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.randomColor()
    }
    
    //MARK: -时间转时间戳函数
    func TRAPIHeader(isHasToken: Bool) -> Dictionary<String, Any> {
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
        dictionary.updateValue("application/x-www-form-urlencoded", forKey: "Content-Type")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
