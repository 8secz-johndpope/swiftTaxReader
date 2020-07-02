//
//  LXHeader.swift
//  demoSwift
//
//  Created by asdc on 2019/12/31.
//  Copyright © 2019 TongFangXL. All rights reserved.
//

import Foundation
import UIKit

let LXScreenWidth = UIScreen.main.bounds.size.width
let LXScreenHeight = UIScreen.main.bounds.size.height

let LXButtonColor = UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let LXDownColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)
let LXGrayColor = UIColor.init(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1)
let LXSlightGrayColor = UIColor.init(red: 235/255.0, green: 236/255.0, blue: 239/253.0, alpha: 1)
let LXTableViewBackgroundColor = UIColor.init(red: 240/255.0, green: 240/255.0, blue: 243/253.0, alpha: 1)

//// iphone X
//let isIphoneX = LXScreenHeight == 812 ? true : false
//// LXNavBarHeight
//let LXNavBarHeight : CGFloat = isIphoneX ? 88 : 64
//// LXTabBarHeight
//let LXTabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49

let iphoneLHNavHeight = 24
let iphoneLHBarHeight = 34
let LXSize = UIScreen.main.bounds.size
let notchValue: Int = Int(LXSize.width / LXSize.height * 100)
let isIphoneLH = ((notchValue == 216) || (notchValue == 46)) ? true : false
// LXNavBarHeight
let LXNavBarHeight : CGFloat = isIphoneLH ? 88 : 64
// LXTabBarHeight
let LXTabBarHeight : CGFloat = isIphoneLH ? 49 + 34 : 49

let LXPhoneLHNavHeight : CGFloat = isIphoneLH ? 22 : 0
let LXPhoneLHBarHeight : CGFloat = isIphoneLH ? 34 : 0

let itemMargin: CGFloat = 12
let itemLabel: CGFloat = 30
let itemButton: CGFloat = 38

let scaleHeightSE2nd: CGFloat = LXScreenHeight / 667.0





//屏幕-宽-高-bounds
public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height
public let ScreenBounds: CGRect = UIScreen.main.bounds


//navigation
public let NavigationH:CGFloat = 64

//全局整体背景色
public let GlobalBackgroundColor = UIColor.colorWithCustom(r: 239, g: 239, b: 239)

//cell分割线颜色
public let CellDivisionColor = UIColor.lightGray

//Notification-通知
public let GuideViewControllerDidFinish = "GuideViewControllerDidFinish"

/** 判断是否是iPhoneX */
let IsiPhonX = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), UIScreen.main.currentMode!.size) : false
/** 判断是否是iPhoneXR*/
let IsiPhonXR = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 828, height: 1792), UIScreen.main.currentMode!.size) : false
/** 判断是否是iPhoneXS*/
let IsiPhonXS = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), UIScreen.main.currentMode!.size) : false
/** 判断是否是iPhoneXS_MAX*/
let IsiPhonXS_MAX = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1242, height: 2688), UIScreen.main.currentMode!.size) : false
/** 是否全面屏*/
let IsFullScreen = (IsiPhonX || IsiPhonXR || IsiPhonXS || IsiPhonXS_MAX) ? true : false

/** 计算多行文字高度 */
func GETSTRHEIGHT(fontSize: CGFloat, width: CGFloat, words: String) -> CGFloat {
    let font = UIFont.systemFont(ofSize: fontSize)
    let rect = NSString(string: words).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    return rect.height //ceil(rect.height)
}
/** 字体(参数：字号，字体名) */
func FontWithName(_ name:String, _ font:CGFloat) -> UIFont {
    return UIFont.init(name: name, size: font)!
}
/** 时间转字符串 */
func dateToStr(dateFormat:String,date:Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    let dateStr = formatter.string(from: date)
    return dateStr
}

/** 16进制颜色 */
func RGB16(value: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(value & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

/** rgb颜色 */
func RGB_COLOR(r: Float, g: Float, b: Float) -> UIColor{
    return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue: CGFloat(b / 255.0), alpha: 1)
}

