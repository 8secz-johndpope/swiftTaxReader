//
//  ExtensionString.swift
//  TaxReader
//
//  Created by asdc on 2020/5/13.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import Foundation


//sha1 加密
extension String{
    /// Swift5 中如何判断一个字符串是否为空字符串（包含多个空格的情况）
    var isBlank: Bool {
        // 把字符串中的一些东西截掉，然后扔掉
        // 参数是个CharacterSet类型，字符集
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
    
    // 验证邮箱
    func isRulerEmail(email: String) -> Bool {
        if email.count == 0 {
            return false
        }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }

    //验证手机号
     func isRulerPhoneNumber(phoneNumber:String) -> Bool {
        if phoneNumber.count == 0 {
            return false
        }
        let mobile = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: phoneNumber) == true {
            return true
        }else
        {
            return false
        }
    }
    
    // 4位验证码 只能输入n位的数字：“^d{n}$”
     func isRulerPureNumber(number:String) -> Bool {
        if number.count == 0 {
            return false
        }
        let mobile = "^[0-9]{4}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: number) == true {
            return true
        }else
        {
            return false
        }
    }

    // 密码正则(说明:6-8位字母和数字组合)
    // 字母和数字组合长度在8-16位
    // 友好提示内容为： "密码为8-16位数字和字母组合!"
     func isRulerPassword(password:String) -> Bool {
        let passwordRule = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$"
        let regexPassword = NSPredicate(format: "SELF MATCHES %@",passwordRule)
        if regexPassword.evaluate(with: password) == true {
            return true
        }else
        {
            return false
        }
    }
    
    /// 判断字符串中是否有中文
    func isIncludeChinese() -> Bool {
        for ch in self.unicodeScalars {
            if (0x4e00 < ch.value  && ch.value < 0x9fff) { return true } // 中文字符范围：0x4e00 ~ 0x9fff
        }
        return false
    }
    
    /// 将中文字符串转换为拼音
    ///
    /// - Parameter hasBlank: 是否带空格（默认不带空格）
    func transformToPinyin(hasBlank: Bool = false) -> String {
        
        let stringRef = NSMutableString(string: self) as CFMutableString
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false) // 转换为带音标的拼音
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false) // 去掉音标
        let pinyin = stringRef as String
        return hasBlank ? pinyin : pinyin.replacingOccurrences(of: " ", with: "")
    }
    
    /// 获取中文首字母
    ///
    /// - Parameter lowercased: 是否小写（默认大写）
    func transformToPinyinHead(lowercased: Bool = false) -> String {
        let pinyin = self.transformToPinyin(hasBlank: true).capitalized // 字符串转换为首字母大写
        var headPinyinStr = ""
        for ch in pinyin {
            if ch <= "Z" && ch >= "A" {
                headPinyinStr.append(ch) // 获取所有大写字母
            }
        }
        return lowercased ? headPinyinStr.lowercased() : headPinyinStr
    }
    
    // SHA1 编码
    func sha1() -> String {
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        
        CC_SHA1([UInt8](data), CC_LONG(data.count), &digest)
        
        /*
        // 原始的28位
        let resultBytes = Data(bytes: digest, count: Int(CC_SHA1_DIGEST_LENGTH))
        let resultStr = resultBytes.base64EncodedString()
        return resultStr
        */
        
        // 无需base64输出,装换为16进制字符串输出
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
    
    //MD5加密
    func md5Encrypt() -> String {
        let utf8_str = self.cString(using: .utf8)
        let str_len = CC_LONG(self.lengthOfBytes(using: .utf8))
        let digest_len = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digest_len)
        CC_MD5(utf8_str, str_len, result)
        let str = NSMutableString()
        for i in 0..<digest_len {
            str.appendFormat("%02X", result[i])
        }
        result.deallocate()
        return str as String
    }
}
