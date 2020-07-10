//
//  TaxReaderViewModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/1.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import HandyJSON
import SwiftyJSON

class TaxReaderViewModel: NSObject {
    
    // 数据源更新
    typealias APIDataBlock = () -> Void
    var updateBlock: APIDataBlock?
    
    // Home
    typealias APIDataBlockHomeReadType = () -> Void
    var homeReadTypeBlock: APIDataBlockHomeReadType?
    
    typealias APIDataBlockHomeRotchart = () -> Void
    var homeRotchartBlock: APIDataBlockHomeRotchart?
    
    typealias APIDataBlockHomeRecd = () -> Void
    var homeRecdBlock: APIDataBlockHomeRecd?
    
    typealias APIDataBlockHomeArticleRecd = () -> Void
    var homeArticleRecdBlock: APIDataBlockHomeArticleRecd?
    
    typealias APIDataBlockHomeArticleGetTopNews = () -> Void
    var homeArticleGetTopNewsBlock: APIDataBlockHomeArticleGetTopNews?
    
    typealias APIDataBlockHomeProductLast = () -> Void
    var homeproductLastBlock: APIDataBlockHomeProductLast?
    
    // 数据源更新 readType 富文本
    typealias APIDataBlockArticleDetail = () -> Void
    var articleDetailUpdateBlock: APIDataBlockArticleDetail?
    
    typealias APIDataBlockArticleGetHtmlContent = () -> Void
    var articleGetHtmlContentUpdateBlock: APIDataBlockArticleGetHtmlContent?
    
    
    typealias APIDataBlockProductGetIssueNumber = () -> Void
    var getIssueNumberUpdateBlock: APIDataBlockProductGetIssueNumber?
    
    typealias APIDataBlockCartGetByID = () -> Void
    var getCartByIDUpdateBlock: APIDataBlockCartGetByID?
    
    // 登录
    var loginServe: TRLoginModel?
    
    // 注册
    var registerModel: TRRegisterModel?
    var getCodeModel: TRGetCodeModel?
    
    // User
    var userLoginOutModel: TRUserLoginOutModel?
    var userInfoModel: TRUserInfoModel?
    var userUpInfoModel: TRUserUpInfoModel?
    var userUppassModel: TRUserUppassModel?
    var userFindPassModel: TRUserFindPassModel?
    var userBindCodeModel: TRUserBindCodeModel?
    
    // Invoice info
    var invoiceInfoModel: TRInvoiceInfoModel?
    var invoiceDeleteModel: TRInvoiceDeleteModel?
    var invoiceAddModel: TRInvoiceAddModel?
    
    // Address
    var addressInfoModel: TRAddressInfoModel?
    var addressAddModel: TRAddressAddModel?
    var addressEditModel: TRAddressEditModel?
    var addressDeleteModel: TRAddressDeleteModel?
    var addressSetDefaultModel: TRAddressSetDefaultModel?
    var addressGetDefaultModel: TRAddressGetDefaultModel?
    
    // Product
    var productReadtypeModel: TRproductReadTypeModel?
    var productRotchartModel: TRProductRotchartModel?
    var productLastModel: TRproductLastModel?
    var productRecdModel: TRProductRecdModel?
    var productGetIssueNumberModel: TRProductGetIssueNumberModel?
    
    var articleGetTopNewsModel: TRArticleGettopnewsModel?
    var articleRecdModel: TRArticleRecdModel?
    var articleSearchModel: TRArticleSearchModel?
    var articleDetailModel: TRArticleDetailModel?
    var articleGetHtmlContentModel: TRArticleGetHtmlContentModel?
    var articleNewsDetailModel: TRNewsDetailModel?
    
    var productDetailModel: TRProductDetailModel?
    var productGetPubYearIssueModel: TRProductGetPubYearIssueModel?
    var productGetPubIssueByYearModel: TRProductGetPubIssueByYearModel?
    var publicationGetPubIssueListModel: TRPublicationGetPubIssueListModel?
    
    //Favor
    var favorFindModel: TRFavorFindModel?
    var favorCancelModel: TRFavorCancelModel?
    var favorAddModel: TRFavorAddModel?
    
    // Order
    var orderFindModel: TROrderFindModel?
    var orderActivityCodeModel: TROrderActivityCodeModel?
    var orderFindDetailModel: TROrderFindDetailModel?
    var orderCreateModel: TROrderCreateModel?
    
    // cart
    var cartInfoModel: TRCartInfoModel?
    var cartInfoJson: JSON?
    var cartUpdateNumbeModel: TRCartUpdateNumberModel?
    var cartAddModel: TRCartAddModel?
    var cartGetByIDModel: TRCartGetCartByIDModel?
}

// User
extension TaxReaderViewModel {
    func refreshDataSource_Login(userName: String, UserPWD: String) {
        TaxReaderAPIProvider.request(TaxReaderAPI.login(UserName: userName, UserPWD: UserPWD)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("login = \(json)")
                if let mappedObject = JSONDeserializer<TRLoginModel>.deserializeFrom(json: json.description) {
                    self.loginServe = mappedObject
                }
                self.updateBlock?()
            }
        }
    }
    
    
    func refreshDataSource_Register(UserName: String, UserMobile: String, UserRegIP: String, AreaTreePath: String,AreaFullName: String,UserPWD: String, UserMobileAreaCode: String, UseFrom: String,SMSCode: String) {
        TaxReaderAPIProvider.request(TaxReaderAPI.register(UserName: UserName, UserMobile: UserMobile, UserRegIP: UserRegIP, AreaTreePath: AreaTreePath, AreaFullName: AreaFullName, UserPWD: UserPWD, UserMobileAreaCode: UserMobileAreaCode, UseFrom: UseFrom, SMSCode: SMSCode)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("register = \(json.description)")
                
                self.updateBlock?()
                
            }
        }
    }
    
    /// 获取短信类型 1(获取注册码01) 2（获取激活码02） 3（找回密码03）
    func refreshDataSource_GetCode(NKValidateCodeReceive: String,
                                   UserMobileAreaCode: String,
                                   NKValidateCodeType: String,
                                   UserRegIP: String) {
        TaxReaderAPIProvider.request(TaxReaderAPI.getCode(NKValidateCodeReceive: NKValidateCodeReceive, UserMobileAreaCode: UserMobileAreaCode, NKValidateCodeType: NKValidateCodeType, UserRegIP: UserRegIP)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("mobileSMS = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRGetCodeModel>.deserializeFrom(json: json.description) {
                    self.getCodeModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    
    // User 中需要 token 作为 header 中的一部分
    func refreshDataSource_LoginOut() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.userLoginOut) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("loginOut = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRUserLoginOutModel>.deserializeFrom(json: json.description) {
                    self.userLoginOutModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_Info() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.userInfo) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("info = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRUserInfoModel>.deserializeFrom(json: json.description) {
                    self.userInfoModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_UpInfo(UserNickName: String,
                                  UserRealName: String,
                                  UserGender: String,
                                  UserBirthDate: String,
                                  AreaTreePath: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.userUpInfo(UserNickName: UserNickName, UserRealName: UserRealName, UserGender: UserGender, UserBirthDate: UserBirthDate, AreaTreePath: AreaTreePath)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("Upinfo = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRUserUpInfoModel>.deserializeFrom(json: json.description) {
                    self.userUpInfoModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_Uppass(oldPass: String, newPass: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.userUppass(oldPass: oldPass, newPass: newPass)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("Uppass = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRUserUppassModel>.deserializeFrom(json: json.description) {
                    self.userUppassModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_FindPass(UserName: String,
                                    VeriCode: String,
                                    NewPass: String,
                                    UserMobileAreaCode: String,
                                    UserRegIP: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.userFindPass(UserName: UserName, VeriCode: VeriCode, NewPass: NewPass, UserMobileAreaCode: UserMobileAreaCode, UserRegIP: UserRegIP)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("Uppass = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRUserFindPassModel>.deserializeFrom(json: json.description) {
                    self.userFindPassModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_BindCode(ActivationCodeSN: String, ActivationCodePWD: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.userBindCode(ActivationCodeSN: ActivationCodeSN, ActivationCodePWD: ActivationCodePWD)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("userBindCode = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRUserBindCodeModel>.deserializeFrom(json: json.description) {
                    self.userBindCodeModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    // 开票信息
    func refreshDataSource_InvoiceInfo() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.invoiceInfo) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("invoiceInfo = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRInvoiceInfoModel>.deserializeFrom(json: json.description) {
                    self.invoiceInfoModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_InvoiceDelete(UserInvoiceID: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.invoiceDelete(UserInvoiceID: UserInvoiceID)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("invoiceDelete = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRInvoiceDeleteModel>.deserializeFrom(json: json.description) {
                    self.invoiceDeleteModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_InvoiceSetDefault(UserInvoiceID: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.invoiceSetDefault(UserInvoiceID: UserInvoiceID)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("invoiceSetDefault = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRInvoiceDeleteModel>.deserializeFrom(json: json.description) {
                    self.invoiceDeleteModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_InvoiceAdd(UserInvoiceID: String,
                                      UserID: String,
                                      UserInvoiceReceiveType: String,
                                      UserInvoiceTitle: String,
                                      UserInvoiceContent: String,
                                      UserInvoicePhone: String,
                                      UserInvoiceEmail: String,
                                      UserInvoiceTaxpayerNo: String,
                                      UserInvoiceorAddress: String,
                                      UserInvoiceBuyerTel: String,
                                      UserInvoiceBuyerBankName: String,
                                      UserInvoiceBankAcount: String,
                                      UserInvoiceDefault: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.invoiceAdd(UserInvoiceID: UserInvoiceID, UserID: UserID, UserInvoiceReceiveType: UserInvoiceReceiveType, UserInvoiceTitle: UserInvoiceTitle, UserInvoiceContent: UserInvoiceContent, UserInvoicePhone: UserInvoicePhone, UserInvoiceEmail: UserInvoiceEmail, UserInvoiceTaxpayerNo: UserInvoiceTaxpayerNo, UserInvoiceorAddress: UserInvoiceorAddress, UserInvoiceBuyerTel: UserInvoiceBuyerTel, UserInvoiceBuyerBankName: UserInvoiceBuyerBankName, UserInvoiceBankAcount: UserInvoiceBankAcount, UserInvoiceDefault: UserInvoiceDefault)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("invoiceAdd = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRInvoiceAddModel>.deserializeFrom(json: json.description) {
                    self.invoiceAddModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_InvoiceEdit(UserInvoiceID: String,
                                      UserID: String,
                                      UserInvoiceReceiveType: String,
                                      UserInvoiceTitle: String,
                                      UserInvoiceContent: String,
                                      UserInvoicePhone: String,
                                      UserInvoiceEmail: String,
                                      UserInvoiceTaxpayerNo: String,
                                      UserInvoiceorAddress: String,
                                      UserInvoiceBuyerTel: String,
                                      UserInvoiceBuyerBankName: String,
                                      UserInvoiceBankAcount: String,
                                      UserInvoiceDefault: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.invoiceEdit(UserInvoiceID: UserInvoiceID, UserID: UserID, UserInvoiceReceiveType: UserInvoiceReceiveType, UserInvoiceTitle: UserInvoiceTitle, UserInvoiceContent: UserInvoiceContent, UserInvoicePhone: UserInvoicePhone, UserInvoiceEmail: UserInvoiceEmail, UserInvoiceTaxpayerNo: UserInvoiceTaxpayerNo, UserInvoiceorAddress: UserInvoiceorAddress, UserInvoiceBuyerTel: UserInvoiceBuyerTel, UserInvoiceBuyerBankName: UserInvoiceBuyerBankName, UserInvoiceBankAcount: UserInvoiceBankAcount, UserInvoiceDefault: UserInvoiceDefault)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("invoiceEdit = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRInvoiceAddModel>.deserializeFrom(json: json.description) {
                    self.invoiceAddModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }

    
    
    // 收货地址
    func refreshDataSource_AddressInfo() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.addressInfo) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("addressInfo = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRAddressInfoModel>.deserializeFrom(json: json.description) {
                    self.addressInfoModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_AddressAdd(UserAddrID: String,
                                       UserID: String,
                                       UserAddressMan: String,
                                       UserAddressCountry: String,
                                       UserAddressProv: String,
                                       UserAddressCity: String,
                                       UserAddressDistrict: String,
                                       UserAddressStreet: String,
                                       UserAddressDetail: String,
                                       UserAddressMobile: String,
                                       UserAddressPhone: String,
                                       UserAddressZIPCode: String,
                                       UserAddressIsDefault: String,
                                       UserAddressManGender: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.addressAdd(UserAddrID: UserAddrID, UserID: UserID, UserAddressMan: UserAddressMan, UserAddressCountry: UserAddressCountry, UserAddressProv: UserAddressProv, UserAddressCity: UserAddressCity, UserAddressDistrict: UserAddressDistrict, UserAddressStreet: UserAddressStreet, UserAddressDetail: UserAddressDetail, UserAddressMobile: UserAddressMobile, UserAddressPhone: UserAddressPhone, UserAddressZIPCode: UserAddressZIPCode, UserAddressIsDefault: UserAddressIsDefault, UserAddressManGender: UserAddressManGender)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("addressAdd = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRAddressAddModel>.deserializeFrom(json: json.description) {
                    self.addressAddModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_AddressEdit(UserAddrID: String,
                                       UserID: String,
                                       UserAddressMan: String,
                                       UserAddressCountry: String,
                                       UserAddressProv: String,
                                       UserAddressCity: String,
                                       UserAddressDistrict: String,
                                       UserAddressStreet: String,
                                       UserAddressDetail: String,
                                       UserAddressMobile: String,
                                       UserAddressPhone: String,
                                       UserAddressZIPCode: String,
                                       UserAddressIsDefault: String,
                                       UserAddressManGender: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.addressEdit(UserAddrID: UserAddrID, UserID: UserID, UserAddressMan: UserAddressMan, UserAddressCountry: UserAddressCountry, UserAddressProv: UserAddressProv, UserAddressCity: UserAddressCity, UserAddressDistrict: UserAddressDistrict, UserAddressStreet: UserAddressStreet, UserAddressDetail: UserAddressDetail, UserAddressMobile: UserAddressMobile, UserAddressPhone: UserAddressPhone, UserAddressZIPCode: UserAddressZIPCode, UserAddressIsDefault: UserAddressIsDefault, UserAddressManGender: UserAddressManGender)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("addressEdit = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRAddressEditModel>.deserializeFrom(json: json.description) {
                    self.addressEditModel = mappedObject
                }

                self.updateBlock?()
                
            }
        }
    }
    
    func refreshDataSource_AddressDelete(UserAddrID: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.addressDelete(UserAddrID: UserAddrID)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("addressDelete = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRAddressDeleteModel>.deserializeFrom(json: json.description) {
                    self.addressDeleteModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_AddressSetDefault(UserAddrID: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.addressSetDefault(UserAddrID: UserAddrID)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("addressSetDefault = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRAddressSetDefaultModel>.deserializeFrom(json: json.description) {
                    self.addressSetDefaultModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }

    func refreshDataSource_AddressGetDefault() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.addressGetDefault) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("addressGetDefault = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRAddressGetDefaultModel>.deserializeFrom(json: json.description) {
                    self.addressGetDefaultModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    
    // 首页
    func refreshDataSource_productReadType() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productReadType) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productReadType = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRproductReadTypeModel>.deserializeFrom(json: json.description) {
                    self.productReadtypeModel = mappedObject
                }

                self.homeReadTypeBlock?()
            }
        }
    }
    
    func refreshDataSource_productRotchart() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productRotchart) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productRotchart = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRProductRotchartModel>.deserializeFrom(json: json.description) {
                    self.productRotchartModel = mappedObject
                }

                self.homeRotchartBlock?()
            }
        }
    }
        
    func refreshDataSource_productRecd() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productRecd) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productRect = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRProductRecdModel>.deserializeFrom(json: json.description) {
                    self.productRecdModel = mappedObject
                }

                self.homeRecdBlock?()
            }
        }
    }
    
    
    func refreshDataSource_articleRecd() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.articleRecd) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("articleRecd = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRArticleRecdModel>.deserializeFrom(json: json.description) {
                    self.articleRecdModel = mappedObject
                }

                self.homeArticleRecdBlock?()
            }
        }
    }
    
    
    func refreshDataSource_productLast() {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productLast) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productLast = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRproductLastModel>.deserializeFrom(json: json.description) {
                    self.productLastModel = mappedObject
                }

                self.homeproductLastBlock?()
            }
        }
    }
    
    func refreshDataSource_productDetail(PubIssueID: String, PubID: String, Year: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productDetail(PubIssueID: PubIssueID, PubID: PubID, Year: Year)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productDetail = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRProductDetailModel>.deserializeFrom(json: json.description) {
                    self.productDetailModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_productGetYearPubIssue(PubIssueID: String, PubID: String, Year: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productGetYearPubIssue(PubIssueID: PubIssueID, PubID: PubID, Year: Year)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productGetYearPubIssue = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRProductGetPubYearIssueModel>.deserializeFrom(json: json.description) {
                    self.productGetPubYearIssueModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }

    func refreshDataSource_productGetPubIssueByYear(PubIssueID: String, PubID: String, Year: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productGetPubIssueByYear(PubIssueID: PubIssueID, PubID: PubID, Year: Year)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productGetPubIssueByYear = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRProductGetPubIssueByYearModel>.deserializeFrom(json: json.description) {
                    self.productGetPubIssueByYearModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_PublicationGetPubIssueList(ReadType: String, PageIndex: String, PageSize: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.publicationGetPubIssueList(ReadType: ReadType, PageIndex: PageIndex, PageSize: PageSize)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("publicationGetPubIssueList = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRPublicationGetPubIssueListModel>.deserializeFrom(json: json.description) {
                    self.publicationGetPubIssueListModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_productGetIssueNumber(PubIssueID: String, PubID: String, Year: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.productGetIssueNumber(PubIssueID: PubIssueID, PubID: PubID, Year: Year)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("productGetIssueNumber = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRProductGetIssueNumberModel>.deserializeFrom(json: json.description) {
                    self.productGetIssueNumberModel = mappedObject
                }

                self.getIssueNumberUpdateBlock?()
            }
        }
    }
    
    // Favor
    func refreshDataSource_FavorFind(FavoriteID: String, ReadFavoriteType: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.favorFind(FavoriteID: FavoriteID, ReadFavoriteType: ReadFavoriteType)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("favorFind = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRFavorFindModel>.deserializeFrom(json: json.description) {
                    self.favorFindModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_FavorCancel(FavoriteID: String, ReadFavoriteType: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.favorCancel(ReadSourceID: FavoriteID, ReadFavoriteType: ReadFavoriteType)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("favorCancel = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRFavorCancelModel>.deserializeFrom(json: json.description) {
                    self.favorCancelModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_FavorAdd(ReadSourceID: String, ReadParentID: String, ReadFavoriteType: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.favorAdd(ReadSourceID: ReadSourceID, ReadParentID: ReadParentID, ReadFavoriteType: ReadFavoriteType)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("favorAdd = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRFavorAddModel>.deserializeFrom(json: json.description) {
                    self.favorAddModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }

    
    // Order
    func refreshDataSource_OrderFind(OrderStatus: String, PageIndex: String, PageSize: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.orderFind(OrderStatus: OrderStatus, PageIndex: PageIndex, PageSize: PageSize)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("orderFind = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TROrderFindModel>.deserializeFrom(json: json.description) {
                    self.orderFindModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    // Order
    func refreshDataSource_OrderFindDetail(OrderID: String, PageIndex: String, PageSize: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.orderFindDetail(OrderID: OrderID, PageIndex: PageIndex, PageSize: PageSize)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("orderFindDetail = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TROrderFindDetailModel>.deserializeFrom(json: json.description) {
                    self.orderFindDetailModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_OrderGetActivityCode(OrderID: String,OrderDetailID: String, PageIndex: String, PageSize: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.orderGetActivityCode(OrderID: OrderID, OrderDetailID: OrderDetailID, PageIndex: PageIndex, PageSize: PageSize)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("orderGetActivityCode = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TROrderActivityCodeModel>.deserializeFrom(json: json.description) {
                    self.orderActivityCodeModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_OrderSecpay(OrderForm: String,PayModel: String, OrderID: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.orderSecpay(OrderForm: OrderForm, PayModel: PayModel, OrderID: OrderID)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("orderSecpay = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TROrderCreateModel>.deserializeFrom(json: json.description) {
                    self.orderCreateModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_ArticleSearch(KeyWord: String, PageIndex: String, PageSize: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.articleSearch(KeyWord: KeyWord, PageIndex: PageIndex, PageSize: PageSize)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("articleSearch = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRArticleSearchModel>.deserializeFrom(json: json.description) {
                    self.articleSearchModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_articleGetTopNews(NewsID: String, Number: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.articleGetTopNews(NewsID: NewsID, Number: Number)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("articleGetTopNews = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRArticleGettopnewsModel>.deserializeFrom(json: json.description) {
                    self.articleGetTopNewsModel = mappedObject
                }

                self.homeArticleGetTopNewsBlock?()
            }
        }
    }
    
    func refreshDataSource_ArticleDetail(ArticleID: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.articleDetail(ArticleID: ArticleID)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()

                guard let returnData = data else {
                    print("returnData nil")
                    return
                }

                let json = JSON(returnData)
                print("articleDetail = \(json.description)")

                if let mappedObject = JSONDeserializer<TRArticleDetailModel>.deserializeFrom(json: json.description) {
                    self.articleDetailModel = mappedObject
                }

                self.articleDetailUpdateBlock?()
            }
        }
        
//        let path = Bundle.main.path(forResource: "homeDetail", ofType: "json")
//        if let jsonPath = path {
//            let jsonData = NSData(contentsOfFile: jsonPath)
//            do {
//                let json = JSON(jsonData!)
//                print(json.description)
//
//                if let mappedObject = JSONDeserializer<TRArticleDetailModel>.deserializeFrom(json: json.description) {
//                    self.articleDetailModel = mappedObject
//                }
//
//                self.articleDetailUpdateBlock?()
//            }
//        }
    }

    func refreshDataSource_ArticleGetHtmlContent(ArticleID: String) {
//        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.articleGetHtmlContent(ArticleID: ArticleID)) { (result) in
//            if case let .success(response) = result {
//                let data = try? response.mapJSON()
//
//                guard let returnData = data else {
//                    print("returnData nil")
//                    return
//                }
//
//                let json = JSON(returnData)
//                print("articleGetHtmlContent = \(json.description)")
//
//                if let mappedObject = JSONDeserializer<TRArticleGetHtmlContentModel>.deserializeFrom(json: json.description) {
//                    self.articleGetHtmlContentModel = mappedObject
//                }
//
//                self.articleGetHtmlContentUpdateBlock?()
//            }
//        }
        
        let path = Bundle.main.path(forResource: "articleDetail", ofType: "json")
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do {
                let json = JSON(jsonData!)
                print(json.description)
                
                if let mappedObject = JSONDeserializer<TRArticleGetHtmlContentModel>.deserializeFrom(json: json.description) {
                    self.articleGetHtmlContentModel = mappedObject
                }

                self.articleGetHtmlContentUpdateBlock?()
            }
        }
    }
    
    func refreshDataSource_articleNewsDetail(NewsID: String, Number: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.articleNewDetail(NewsID: NewsID, Number: Number)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("articleNewDetail = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRNewsDetailModel>.deserializeFrom(json: json.description) {
                    self.articleNewsDetailModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    // cart
    func refreshDataSource_cartInfo(PageIndex: String, PageSize: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.cartInfo(PageIndex: PageIndex, PageSize: PageSize)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("cartInfo = \(json.description)")
                
                self.cartInfoJson = json
                
                if let mappedObject = JSONDeserializer<TRCartInfoModel>.deserializeFrom(json: json.description) {
                    self.cartInfoModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_cartUpdateNumber(CartItemID: String, Number: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.cartUpdateNumber(CartItemID: CartItemID, Number: Number)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("cartUpdateNumber = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRCartUpdateNumberModel>.deserializeFrom(json: json.description) {
                    self.cartUpdateNumbeModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }

    func refreshDataSource_cartAdd(ProductID: String, ProductCount: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.cartAdd(ProductID: ProductID, ProductCount: ProductCount)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("cartAdd = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRCartAddModel>.deserializeFrom(json: json.description) {
                    self.cartAddModel = mappedObject
                }

                self.updateBlock?()
            }
        }
    }
    
    func refreshDataSource_CartGetCartByID(CartItemIDS: String) {
        TaxReaderUserAPIProvider.request(TaxReaderUserAPI.cartGetCartByID(CartItemIDS: CartItemIDS)) { (result) in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                
                guard let returnData = data else {
                    print("returnData nil")
                    return
                }
                
                let json = JSON(returnData)
                print("cartGetCartByID = \(json.description)")
                
                if let mappedObject = JSONDeserializer<TRCartGetCartByIDModel>.deserializeFrom(json: json.description) {
                    self.cartGetByIDModel = mappedObject
                }

                self.getCartByIDUpdateBlock?()
            }
        }
    }


}
