//
//  TRTestViewController.h
//  TaxReader
//
//  Created by asdc on 2020/6/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TRTestViewController : UIViewController

@end

NS_ASSUME_NONNULL_END


////        let nextvc = TRTestViewController()
////        self.navigationController?.pushViewController(nextvc, animated: true)
////        return
//        
//        // 测试拉卡拉下的微信支付
//        let configuration = URLSessionConfiguration.default
//        let manager = AFURLSessionManager.init(sessionConfiguration: configuration)
//        manager.responseSerializer = AFJSONResponseSerializer.init()
//        let securityPolicy = AFSecurityPolicy.default()
//        securityPolicy.allowInvalidCertificates = true
//        securityPolicy.validatesDomainName = false
//        manager.securityPolicy = securityPolicy
//
//        var params = [String:Any]()
//        params = [
//            "tradeType": alipay,
//            "merchantName":"商户名称iOS",
//            "orderId": "ea44d7f6-9475-4476-91",
//            "validUnit": "00",
//            "validNum": "10",
//            "purchaser_id": "1234",
//            "totalAmount": 10,
//            "currency": "CNY",
//            "split_type": "1",
//            "orderDetail": ["orderAmt": 10,
//                            "rev_merchant_id": "872100001015006",
//                            "shareFee": "10",
//                            "rcvMerchantIdName": "子商户名称1",
//                            "productName": "商品名称1",
//                            "showUrl": "http://test.url",
//                            "orderSeqNo": "001",
//                            "detailOrderId": "ea44d7f6-9475-4476-9",
//                            "shareproductIdFee": "1011",
//                            "productDesc": "test"],
//            ] as [String : Any]
//
//        /*
//        {
//            code = 000000;
//            data =     {
//                h5JumpUrl = "aHR0cHM6Ly9pbnRwYXkubGFrYWxhLmNvbS9sa2wvaHRtbC9zY2FucGF5L2luZGV4Lmh0bWw/a215UGpSSWc0UTBXS2dIbGxSeEp0ckRyQkNYMW5rd01zclFlcjFyNHNtTU93Y3k2VW5qOHY0d2h0eTcwNWwxcQ==";
//                merchantId = 872100010015005;
//                orderId = "d9885d11-310c-407d-8";
//                returnCode = 000000;
//                returnMessage = SUCCESS;
//                secretKey = "<null>";
//                success = 1;
//                token = 20200624RPM0020200624725381024422436864;
//                tradeNo = 20200624725381024422436864;
//                tradeType = ALIPAYAPP;
//                xcxReqpath = "<null>";
//                xcxUsername = "<null>";
//            };
//            message = "\U4ea4\U6613\U6210\U529f";
//        }
//         */
//
//        let mock_server_url = "https://test.wsmsd.cn/uat2/boss/boss-mocker-server/prod/wechat_app" //uat
//        let jsonSeri = AFJSONRequestSerializer.init()
//        let request = jsonSeri.request(withMethod: "POST", urlString: mock_server_url, parameters: params, error: nil)
//        let dataTask = manager.dataTask(with: request as URLRequest, uploadProgress: nil, downloadProgress: nil) { (response, responseObject, error) in
//            if !(error != nil) {
//                print("response data==>body:\(String(describing: responseObject)) headers:\(response)")
//                PaymaxSDK.pay(withAliToken: responseObject as! [AnyHashable : Any], viewController: self) { (result) in
//                    switch result.type {
//                    case .PAYMAX_CODE_SUCCESS:
//                        break
//                    case .PAYMAX_CODE_FAIL_CANCEL:
//                        break
//                    case .PAYMAX_CODE_ERROR_DEAL:
//                        break
//                    case .PAYMAX_CODE_FAILURE:
//                        break
//                    case .PAYMAX_CODE_ERROR_CONNECT:
//                        break
//                    case .PAYMAX_CODE_CHANNEL_WRONG:
//                        break
//                    case .PAYMAX_CODE_ERROR_CHARGE_PARAMETER:
//                        break
//                    case .PAYMAX_CODE_ERROR_WX_NOT_INSTALL:
//                        break
//                    case .PAYMAX_CODE_ERROR_WX_NOT_SUPPORT_PAY:
//                        break
//                    case .PAYMAX_CODE_ERROR_WX_UNKNOW:
//                        break
//                    @unknown default:
//                        break
//                    }
//                }
//
//            }else {
//
//            }
//        }
//        dataTask.resume()
