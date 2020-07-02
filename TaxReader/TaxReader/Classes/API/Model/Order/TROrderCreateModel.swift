//
//  TROrderCreateModel.swift
//  TaxReader
//
//  Created by asdc on 2020/6/24.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

import UIKit
import HandyJSON

struct TROrderCreateModel: HandyJSON {
    var ret: Int = 0
    var msgCode: Int = 0
    var msg: String?
    var data: TROrderCreateDataModel?
}

struct TROrderCreateDataModel: HandyJSON {
    var charset: Int = 0
    
    // 拉卡拉
    var h5JumpUrl: String?
    var merchantId: String?
    var orderId: String?
    var returnCode: Int = 0
    
    var secretKey: String?
    var returnMessage: String?
    var token: String?
    var tradeNo: String?
    
    // 微信
    var orderPKID: Int = 0
    var result_code: String?
    var trade_type: String?
    var timeStamp: String?
    var appSign: String?
    var sign: String?
    var nonce_str: String?
    var mch_id: String?
    var OrderID: String?
    var appid: String?
    var prepay_id: String?
}

/*
    h5JumpUrl = "aHR0cHM6Ly9pbnRwYXkubGFrYWxhLmNvbS9sa2wvaHRtbC9zY2FucGF5L2luZGV4Lmh0bWw/a215UGpSSWc0UTBXS2dIbGxSeEp0ckRyQkNYMW5rd01zclFlcjFyNHNtTU93Y3k2VW5qOHY0d2h0eTcwNWwxcQ==";
    merchantId = 872100010015005;
    orderId = "d9885d11-310c-407d-8";
    returnCode = 000000;
    returnMessage = SUCCESS;
    secretKey = "<null>";
    success = 1;
    token = 20200624RPM0020200624725381024422436864;
    tradeNo = 20200624725381024422436864;
    tradeType = ALIPAYAPP;
    xcxReqpath = "<null>";
    xcxUsername = "<null>";
 */

/*
 
 {
   "msgCode" : "200",
   "msg" : "订单创建成功",
   "data" : {
     "result_code" : "SUCCESS",
     "orderPKID" : 300,
     "trade_type" : "APP",
     "timeStamp" : "1593592186",
     "appSign" : "7995872180bf8be1ec92a147ed06c1e27578ae342c00687b5d6e517f6df3a01a",
     "sign" : "4A5CDDF930D3DDB53991E2654BA676C731E469E1E0E4911A97DF9E5E37DB8779",
     "nonce_str" : "qO93nYH9XND45gJg",
     "mch_id" : "1503726251",
     "OrderID" : "637292177864604374",
     "appid" : "wx8592574799e9e9ba",
     "prepay_id" : "wx01162925537862d13bc792cb1660535200"
   },
   "ret" : true
 }
    {
        "ret":true,
        "msgCode":"200",
        "msg":"订单创建成功",
        "data":{
            "charset":"00",
            "returnCode":"000000",
            "tradeNo":"20200624725378291229401088",
            "merchantId":"872100016015000",
            "orderId":"637286108603528350",
            "serverCert":"308204253082030DA00302010202081C0552511A573A9B300D06092A864886F70D01010B05003081B4310B300906035504061302434E3111300F06035504080C085348414E474841493111300F06035504070C085348414E4748414931333031060355040A0C2A4C616B616C61205061796D656E7420436F204C74642E20416C6C2052696768747320526573657276656431333031060355040B0C2A4C616B616C61205061796D656E7420436F204C74642E20416C6C205269676874732052657365727665643115301306035504030C0C2A2E6C616B616C612E636F6D3020170D3139313130353038323333325A180F35363639313130353038323333325A3060310B300906035504061302434E310B300906035504080C0253483111300F06035504070C085348414E47484149310F300D060355040A0C064C414B414C41310F300D060355040B0C064C414B414C41310F300D06035504030C0653657276657230819F300D06092A864886F70D010101050003818D003081890281810086BBD86339396637EB796113202BBDF409C872D8D9A24F44DCB93F6F42A126CC0AF6AA60F67DDF9F9DA6965BEC7A484294F6E8689C48F54A2C1FFAE16E7F2B773220C4050910787780A535C337AE3C90000404EEF6286D3ECCD81ACDF0C2D8D1AF7960083543ED18E9FB45F745E31B00C3D1F344583621596AB24684DCE322E30203010001A382010E3082010A301D0603551D0E04160414E79ED9CA187A4C109A65340E74B02F72B4AA370C3081E80603551D230481E03081DD80149AD303DAD494941D3F41C9EBE2C2A3CD360D13F2A181BAA481B73081B4310B300906035504061302434E3111300F06035504080C085348414E474841493111300F06035504070C085348414E4748414931333031060355040A0C2A4C616B616C61205061796D656E7420436F204C74642E20416C6C2052696768747320526573657276656431333031060355040B0C2A4C616B616C61205061796D656E7420436F204C74642E20416C6C205269676874732052657365727665643115301306035504030C0C2A2E6C616B616C612E636F6D82081C0552510E3AD00D300D06092A864886F70D01010B050003820101002C218176D753BF03D2A86E166693371E5915A17AC42FEA4F3C10A201642C1C88AD179CDA3CD110B9A1DB023BFA13E5ABC88136ED045CB847B60D9734563673FDA53AB91B557065037CEEC987BCDFA1768BF98AC19C041F3C66AADC52FBB7A7F80DEFBFF9F2512D3F2F6C4C1ABE699B7012A9C3E801F92F87AA8B28ABFFAC82DED9D37EFD0452D8008941B2EFAF91473554CEDEBC174FC69BFEC0BA0C1906BD24DBE16CDC543EAD1F3676CF6138479251FF97861024BE0BC417052B4F6AFC22F2B8DA75C71F2C1BB7AA7D7DDE97469F9AD0067ECB894298BA53E8B861BD96BC28ABB7497E8304CD65E828DDE49ECE3AC00EFFDB18A7E1E488181AF1A517980091",
            "service":"EntOffLinePayment",
            "returnMessage":"SUCCESS",
            "signType":"RSA",
            "serverSign":"3B4FA06DCABEA00634D806851E3356C42757109388AB4996EB322E07293FE79CEA3284FB6CBFFD69ECF7774ABC5ABB0CA204433D4CE01421048EA23B6104036E6546C54CAE26A59688CA8B490636C339299CA558E5144C7C9EBED85291B55FECE48AFFB1E7FB5077BB061F095160D177E452C54FCCB45EABB0004DE8A596C5F5",
            "version":"1.0",
            "token":"20200624RPM0020200624725378291229401088",
            "secretKey":null,
            "payInfo":null,
            "prePayId":null,
            "payOrdNo":null,
            "status":null,
            "failMsg":null,
            "orderTime":null,
            "totalAmount":null,
            "payAmount":null,
            "bankAbbr":null,
            "payTime":null,
            "acDate":null,
            "fee":null,
            "backParam":null,
            "h5JumpUrl":"aHR0cHM6Ly9pbnRwYXkubGFrYWxhLmNvbS9sa2wvaHRtbC9zY2FucGF5L2luZGV4Lmh0bWw/a215UGpSSWc0UTBXS2dIbGxSeEp0Z05wM2dtNHNacEFtT3doRWptVnVXTVJFcjNwMUxXWHNFa1lmRUY3S1VFaA==",
            "feeAmt":null,
            "bankUrl":null,
            "epccGwMsg":null,
            "orderDetail":null
        }
    }

 */
