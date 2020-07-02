//
//  ExtensionDate.swift
//  TaxReader
//
//  Created by asdc on 2020/5/15.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import Foundation

//MARK: -时间转时间戳函数
func timeToTimeStamp(time: String) -> Double {
    let dfmatter = DateFormatter()
    //yyyy-MM-dd HH:mm:ss
    dfmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
    let last = dfmatter.date(from: time)
    let timeStamp = last?.timeIntervalSince1970
    return timeStamp!
}

//MARK: -时间戳转时间函数
func timeStampToString(timeStamp: Double)->String {
    //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
    let timeSta:TimeInterval = TimeInterval(timeStamp / 1000)
    let date = NSDate(timeIntervalSince1970: timeSta)
    let dfmatter = DateFormatter()
    //yyyy-MM-dd HH:mm:ss
    dfmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
    return dfmatter.string(from: date as Date)
}

// 时间戳获取
extension Date {
    /// 获取当前 秒级 时间戳 - 10位
    var timeStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }

    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
    
    //获取当前时间
    func getCurrentTime()->String{
        //获取当前时间
        let now = Date()
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //当前时间转为字符串
        let timeStr = dformatter.string(from: now)
        return timeStr
    }
    
    //获取当前时间
    func getCurrentDay()->String{
        //获取当前时间
        let now = Date()
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd"
        //当前时间转为字符串
        let timeStr = dformatter.string(from: now)
        return timeStr
    }
}

