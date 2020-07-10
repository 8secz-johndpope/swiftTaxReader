//
//  TaxReaderUserAPI.swift
//  TaxReader
//
//  Created by asdc on 2020/6/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//  header 中的 token 作为字典值 设置

import UIKit
import Moya
import HandyJSON
import SwiftyJSON

// 原先
let TaxReaderUserAPIProvider = MoyaProvider<TaxReaderUserAPI>()

public enum TaxReaderUserAPI {
    case userLoginOut
    case userInfo
    case userUpInfo(UserNickName: String, UserRealName: String, UserGender: String, UserBirthDate: String,AreaTreePath: String)
    case userUppass(oldPass: String, newPass: String)
    case userFindPass(UserName: String, VeriCode: String, NewPass: String, UserMobileAreaCode: String,UserRegIP: String)
    case userBindCode(ActivationCodeSN: String, ActivationCodePWD: String)
    
    // 开票信息
    case invoiceInfo
    case invoiceDelete(UserInvoiceID: String)
    case invoiceSetDefault(UserInvoiceID: String)
    case invoiceAdd(UserInvoiceID: String, UserID: String, UserInvoiceReceiveType: String, UserInvoiceTitle: String,UserInvoiceContent: String, UserInvoicePhone: String, UserInvoiceEmail: String, UserInvoiceTaxpayerNo: String, UserInvoiceorAddress: String, UserInvoiceBuyerTel: String, UserInvoiceBuyerBankName: String, UserInvoiceBankAcount: String, UserInvoiceDefault: String)
    case invoiceEdit(UserInvoiceID: String, UserID: String, UserInvoiceReceiveType: String, UserInvoiceTitle: String,UserInvoiceContent: String, UserInvoicePhone: String, UserInvoiceEmail: String, UserInvoiceTaxpayerNo: String, UserInvoiceorAddress: String, UserInvoiceBuyerTel: String, UserInvoiceBuyerBankName: String, UserInvoiceBankAcount: String, UserInvoiceDefault: String)
    
    // 收货地址
    case addressInfo
    case addressAdd(UserAddrID: String, UserID: String, UserAddressMan: String, UserAddressCountry: String,UserAddressProv: String, UserAddressCity: String, UserAddressDistrict: String, UserAddressStreet: String, UserAddressDetail: String, UserAddressMobile: String, UserAddressPhone: String, UserAddressZIPCode: String, UserAddressIsDefault: String, UserAddressManGender: String)
    case addressEdit(UserAddrID: String, UserID: String, UserAddressMan: String, UserAddressCountry: String,UserAddressProv: String, UserAddressCity: String, UserAddressDistrict: String, UserAddressStreet: String, UserAddressDetail: String, UserAddressMobile: String, UserAddressPhone: String, UserAddressZIPCode: String, UserAddressIsDefault: String, UserAddressManGender: String)
    case addressDelete(UserAddrID: String)
    case addressSetDefault(UserAddrID: String)
    case addressGetDefault
    
    // Product
    case productReadType
    case productLast
    case productRotchart
    case productRecd
    case productDetail(PubIssueID: String, PubID: String, Year: String)
    case productGetYearPubIssue(PubIssueID: String, PubID: String, Year: String)
    case productGetPubIssueByYear(PubIssueID: String, PubID: String, Year: String)
    case publicationGetPubIssueList(ReadType: String, PageIndex: String, PageSize: String)
    case productGetIssueNumber(PubIssueID: String, PubID: String, Year: String)
    
    // Article
    case articleRecd
    case articleGetTopNews(NewsID: String, Number: String)
    case articleSearch(KeyWord: String, PageIndex: String, PageSize: String)
    case articleDetail(ArticleID: String)
    case articleGetHtmlContent(ArticleID: String)
    case articleNewDetail(NewsID: String, Number: String)
    
    // Favor ReadFavoriteType，20=刊期,30=文章
    case favorFind(FavoriteID: String, ReadFavoriteType: String)
    case favorCancel(ReadSourceID: String, ReadFavoriteType: String)
    case favorAdd(ReadSourceID: String, ReadParentID: String, ReadFavoriteType: String)
    
    // Order
    case orderFind(OrderStatus: String, PageIndex: String, PageSize: String)
    case orderGetActivityCode(OrderID: String, OrderDetailID: String, PageIndex: String, PageSize: String)
    case orderFindDetail(OrderID: String, PageIndex: String, PageSize: String)
    case orderSecpay(OrderForm: String, PayModel: String, OrderID: String)
    
    // Cart
    case cartInfo(PageIndex: String, PageSize: String)
    case cartUpdateNumber(CartItemID: String, Number: String)
    case cartAdd(ProductID: String, ProductCount: String)
    case cartGetCartByID(CartItemIDS: String)
}

extension TaxReaderUserAPI:TargetType {
    public var baseURL: URL {
        return URL(string: appAPI)!
    }
    
    public var path: String {
        switch self {
            case .userLoginOut:
                return "/v1/User/LoginOut"
            case .userInfo:
                return "/v1/User/Info"
            case .userUpInfo(_, _, _, _, _):
                return "/v1/User/UpInfo"
            case .userUppass(_, _):
                return "/v1/User/Uppass"
            case .userFindPass(_, _, _, _, _):
                return "/v1/User/FindPass"
            case .userBindCode(_, _):
                return "/v1/User/BindCode"
                
            // 开票信息
            case .invoiceInfo:
                return "/v1/Invoice/Info"
            case .invoiceDelete(_):
                 return "/v1/Invoice/Delete"
            case .invoiceSetDefault(_):
                 return "/v1/Invoice/SetDefault"
            case .invoiceAdd:
                return "/v1/Invoice/Add"
            case .invoiceEdit:
                return "/v1/Invoice/Edit"
                
            // 收货地址
            case .addressInfo:
                return "/v1/Address/Info"
            case .addressAdd(_,_,_,_,_,_,_,_,_,_,_,_,_,_):
                return "/v1/Address/Add"
            case .addressEdit(_,_,_,_,_,_,_,_,_,_,_,_,_,_):
                return "/v1/Address/Edit"
            case .addressDelete(_):
                return "/v1/Address/Delete"
            case .addressSetDefault(_):
                return "/v1/Address/SetDefault"
            case .addressGetDefault:
                return "/v1/Address/GetDefault"
            
            // Product
            case .productReadType:
                return "/v1/Product/ReadType"
            case .productLast:
                return "/v1/Product/Last"
            case .productRotchart:
                return "/v1/Product/Rotchart"
            case .productRecd:
                return "/v1/Product/Recd"
            case .productDetail:
                return "/v1/Product/Detail"
            case .productGetYearPubIssue:
                return "/v1/Product/GetYearPubIssue"
            case .productGetPubIssueByYear:
                return "/v1/Product/GetPubIssueByYear"
            case .publicationGetPubIssueList:
                return "/v1/Publication/GetPubIssueList"
            case .productGetIssueNumber:
                return "/v1/Product/GetIssueNum"
            
            // Article
            case .articleRecd:
                return "/v1/Article/Recd"
            case .articleGetTopNews:
                return "/v1/Article/GetTopNews"
            case .articleSearch:
                return "/v1/Article/Search"
            case .articleDetail:
                return "/v1/Article/Detail"
            case .articleGetHtmlContent:
                return "/v1/Article/GetHtmlContent"
            case .articleNewDetail:
                return "/v1/Article/NewsDeteil"
            
            // Favor
            case .favorFind:
                return "/v1/Favor/Find"
            case .favorCancel:
                return "/v1/Favor/Cancel"
            case .favorAdd:
                return "/v1/Favor/Add"
            
            // Order
            case .orderFind:
                return "/v1/Order/Find"
            case .orderGetActivityCode:
                return "/v1/Order/GetActivityCode"
            case .orderFindDetail:
                return "/v1/Order/FindDetail"
            case .orderSecpay:
                return "/v1/Order/Secpay"
            
            // cart
            case .cartInfo:
                return "/v1/Cart/Info"
            case .cartUpdateNumber:
                return "/v1/Cart/UpdateNumber"
            case .cartAdd:
                return "/v1/Cart/Add"
            case .cartGetCartByID:
                return "/v1/Cart/GetCartByID"
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
            case .userLoginOut: break
            case .userInfo: break
            case .userUpInfo(let UserNickName, let UserRealName, let UserGender, let UserBirthDate, let AreaTreePath):
                    parmeters = [
                        "UserNickName": UserNickName,
                        "UserRealName":UserRealName,
                        "UserGender": UserGender,
                        "UserBirthDate": UserBirthDate,
                        "AreaTreePath": AreaTreePath,
                        ] as [String : Any]
            case .userUppass(let oldPass, let newPass):
                    parmeters = [
                        "oldPass": oldPass,
                        "newPass":newPass,
                        ] as [String : Any]
            case .userFindPass(let UserName, let VeriCode, let NewPass, let UserMobileAreaCode, let UserRegIP):
                    parmeters = [
                        "UserName": UserName,
                        "VeriCode":VeriCode,
                        "NewPass": NewPass,
                        "UserMobileAreaCode": UserMobileAreaCode,
                        "UserRegIP": UserRegIP,
                        ] as [String : Any]
            case .userBindCode(let ActivationCodeSN, let ActivationCodePWD):
                    parmeters = [
                        "ActivationCodeSN": ActivationCodeSN,
                        "ActivationCodePWD":ActivationCodePWD,
                        ] as [String : Any]
                
            // 开票信息
            case .invoiceInfo: break
            case .invoiceDelete(let UserInvoiceID):
                    parmeters = [ "UserInvoiceID": UserInvoiceID] as [String : Any]
            case .invoiceSetDefault(let UserInvoiceID):
                    parmeters = [ "UserInvoiceID": UserInvoiceID] as [String : Any]
            case .invoiceAdd(let UserInvoiceID, let UserID, let UserInvoiceReceiveType, let UserInvoiceTitle,let UserInvoiceContent, let UserInvoicePhone, let UserInvoiceEmail, let UserInvoiceTaxpayerNo, let UserInvoiceorAddress, let UserInvoiceBuyerTel, let UserInvoiceBuyerBankName, let UserInvoiceBankAcount, let UserInvoiceDefault):
                    parmeters = [
                        "UserInvoiceID": UserInvoiceID,
                        "UserID":UserID,
                        "UserInvoiceReceiveType": UserInvoiceReceiveType,
                        "UserInvoiceTitle": UserInvoiceTitle,
                        "UserInvoiceContent": UserInvoiceContent,
                        "UserInvoicePhone": UserInvoicePhone,
                        "UserInvoiceEmail": UserInvoiceEmail,
                        "UserInvoiceTaxpayerNo": UserInvoiceTaxpayerNo,
                        "UserInvoiceorAddress": UserInvoiceorAddress,
                        "UserInvoiceBuyerTel": UserInvoiceBuyerTel,
                        "UserInvoiceBuyerBankName": UserInvoiceBuyerBankName,
                        "UserInvoiceBankAcount": UserInvoiceBankAcount,
                        "UserInvoiceDefault": UserInvoiceDefault,
                        ] as [String : Any]
            case .invoiceEdit(let UserInvoiceID, let UserID, let UserInvoiceReceiveType, let UserInvoiceTitle,let UserInvoiceContent, let UserInvoicePhone, let UserInvoiceEmail, let UserInvoiceTaxpayerNo, let UserInvoiceorAddress, let UserInvoiceBuyerTel, let UserInvoiceBuyerBankName, let UserInvoiceBankAcount, let UserInvoiceDefault):
                    parmeters = [
                        "UserInvoiceID": UserInvoiceID,
                        "UserID":UserID,
                        "UserInvoiceReceiveType": UserInvoiceReceiveType,
                        "UserInvoiceTitle": UserInvoiceTitle,
                        "UserInvoiceContent": UserInvoiceContent,
                        "UserInvoicePhone": UserInvoicePhone,
                        "UserInvoiceEmail": UserInvoiceEmail,
                        "UserInvoiceTaxpayerNo": UserInvoiceTaxpayerNo,
                        "UserInvoiceorAddress": UserInvoiceorAddress,
                        "UserInvoiceBuyerTel": UserInvoiceBuyerTel,
                        "UserInvoiceBuyerBankName": UserInvoiceBuyerBankName,
                        "UserInvoiceBankAcount": UserInvoiceBankAcount,
                        "UserInvoiceDefault": UserInvoiceDefault,
                        ] as [String : Any]

            
            // 收货地址
            case .addressInfo: break
            case .addressAdd(let UserAddrID, let UserID, let UserAddressMan, let UserAddressCountry, let UserAddressProv, let UserAddressCity, let UserAddressDistrict, let UserAddressStreet, let UserAddressDetail, let UserAddressMobile, let UserAddressPhone, let UserAddressZIPCode, let UserAddressIsDefault, let UserAddressManGender):
                    parmeters = [
                        "UserAddrID": UserAddrID,
                        "UserID":UserID,
                        "UserAddressMan": UserAddressMan,
                        "UserAddressCountry": UserAddressCountry,
                        "UserAddressProv": UserAddressProv,
                        "UserAddressCity": UserAddressCity,
                        "UserAddressDistrict": UserAddressDistrict,
                        "UserAddressStreet": UserAddressStreet,
                        "UserAddressDetail": UserAddressDetail,
                        "UserAddressMobile": UserAddressMobile,
                        "UserAddressPhone": UserAddressPhone,
                        "UserAddressZIPCode": UserAddressZIPCode,
                        "UserAddressIsDefault": UserAddressIsDefault,
                        "UserAddressManGender": UserAddressManGender,
                        ] as [String : Any]
            case .addressEdit(let UserAddrID, let UserID, let UserAddressMan, let UserAddressCountry, let UserAddressProv, let UserAddressCity, let UserAddressDistrict, let UserAddressStreet, let UserAddressDetail, let UserAddressMobile, let UserAddressPhone, let UserAddressZIPCode, let UserAddressIsDefault, let UserAddressManGender):
                    parmeters = [
                        "UserAddrID": UserAddrID,
                        "UserID":UserID,
                        "UserAddressMan": UserAddressMan,
                        "UserAddressCountry": UserAddressCountry,
                        "UserAddressProv": UserAddressProv,
                        "UserAddressCity": UserAddressCity,
                        "UserAddressDistrict": UserAddressDistrict,
                        "UserAddressStreet": UserAddressStreet,
                        "UserAddressDetail": UserAddressDetail,
                        "UserAddressMobile": UserAddressMobile,
                        "UserAddressPhone": UserAddressPhone,
                        "UserAddressZIPCode": UserAddressZIPCode,
                        "UserAddressIsDefault": UserAddressIsDefault,
                        "UserAddressManGender": UserAddressManGender,
                        ] as [String : Any]
            case .addressDelete(let UserAddrID):parmeters = ["UserAddrID": UserAddrID] as [String : Any]
            case .addressSetDefault(let UserAddrID):parmeters = ["UserAddrID": UserAddrID] as [String : Any]
            case .addressGetDefault: break
                
            // Product
            case .productReadType: break
            case .productLast: break
            case .productRotchart: break
            case .productRecd: break
            case .productDetail(let PubIssueID, let PubID, let Year):
                parmeters = ["PubIssueID": PubIssueID,
                             "PubID":PubID,
                             "Year":Year] as [String : Any]
            case .productGetYearPubIssue(let PubIssueID, let PubID, let Year):
                parmeters = ["PubIssueID": PubIssueID,
                             "PubID":PubID,
                             "Year":Year]as [String : Any]
            case .productGetPubIssueByYear(let PubIssueID, let PubID, let Year):
                parmeters = ["PubIssueID": PubIssueID,
                             "PubID":PubID,
                             "Year":Year]as [String : Any]
            case .publicationGetPubIssueList(let ReadType, let PageIndex, let PageSize):
                parmeters = ["ReadType": ReadType,
                             "PageIndex":PageIndex,
                             "SearchType":"1",
                             "PageSize":PageSize]as [String : Any]
            case .productGetIssueNumber(let PubIssueID, let PubID, let Year):
                parmeters = ["PubIssueID": PubIssueID,
                             "PubID":PubID,
                             "Year":Year]as [String : Any]
            
            // Article
            case .articleRecd: break
            case .articleGetTopNews(let NewsID, let Number): parmeters = ["NewsID": NewsID, "Number":Number] as [String : Any]
            case .articleSearch(let KeyWord, let PageIndex, let PageSize):
                parmeters = ["KeyWord": KeyWord,
                             "PageIndex":PageIndex,
                             "PageSize":PageSize]as [String : Any]
            case .articleDetail(let ArticleID): parmeters = ["ArticleID": ArticleID] as [String : Any]
            case .articleGetHtmlContent(let ArticleID): parmeters = ["ArticleID": ArticleID] as [String : Any]
            case .articleNewDetail(let NewsID, let Number): parmeters = ["NewsID": NewsID, "Number":Number] as [String : Any]
            
            // Favor
            case .favorFind(let FavoriteID, let ReadFavoriteType):
                parmeters = ["FavoriteID": FavoriteID,
                             "ReadFavoriteType":ReadFavoriteType]as [String : Any]
            case .favorCancel(let ReadSourceID, let ReadFavoriteType):
                parmeters = ["ReadSourceID": ReadSourceID,
                             "ReadFavoriteType":ReadFavoriteType] as [String : Any]
            case .favorAdd(let ReadSourceID, let ReadParentID, let ReadFavoriteType):
                parmeters = ["ReadSourceID": ReadSourceID,
                             "ReadParentID":ReadParentID,
                             "ReadFavoriteType": ReadFavoriteType] as [String : Any]
            
            // Order
            case .orderFind(let OrderStatus, let PageIndex, let PageSize):
                parmeters = ["OrderStatus": OrderStatus,
                             "PageIndex":PageIndex,
                             "PageSize":PageSize]as [String : Any]
            case .orderGetActivityCode(let OrderID, let OrderDetailID, let PageIndex, let PageSize):
                parmeters = ["OrderID": OrderID,
                             "OrderDetailID": OrderDetailID,
                             "PageIndex":PageIndex,
                             "PageSize":PageSize]as [String : Any]
            case .orderFindDetail(let OrderID, let PageIndex, let PageSize):
                parmeters = ["OrderID": OrderID,
                             "PageIndex":PageIndex,
                             "PageSize":PageSize]as [String : Any]
            case .orderSecpay(let OrderForm, let PayModel, let OrderID):
                parmeters = ["OrderForm": OrderForm,
                             "PayModel":PayModel,
                             "OrderID":OrderID]as [String : Any]
            
            // cart
            case .cartInfo(let PageIndex, let PageSize):
                parmeters = ["PageIndex":PageIndex,
                             "PageSize":PageSize] as [String : Any]
            case .cartUpdateNumber(let CartItemID, let Number):
                parmeters = ["CartItemID":CartItemID,
                             "Number":Number]as [String : Any]
            case .cartAdd(let ProductID, let ProductCount):
                parmeters = ["ProductID":ProductID,
                             "ProductCount":ProductCount]as [String : Any]
            case .cartGetCartByID(let CartItemIDS):
                parmeters = ["CartItemIDS":CartItemIDS]as [String : Any]
        }
        
        print("parmeters = \(parmeters)")
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }

    public var headers: [String : String]? {
        TRAPIHeader(isHasToken: true) as? [String : String]
    }
}
