//
//  TRTestViewController.m
//  TaxReader
//
//  Created by asdc on 2020/6/21.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

#import "TRTestViewController.h"

#import "AFNetworking.h"
#import "PaymaxSDK.h"

#define mock_server_url @"https://test.wsmsd.cn/uat2/boss/boss-mocker-server/prod/wechat_app" //uat

@interface TRTestViewController ()

@end

@implementation TRTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.redColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    AFSecurityPolicy *securityPolicy =  [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    manager.securityPolicy = securityPolicy;
    
    NSDictionary *params=[self createOrderParams];
#ifdef DEBUG
    NSLog(@"%@ ==>%@",mock_server_url,params);
#endif
    AFJSONRequestSerializer *jsonSeri= [AFJSONRequestSerializer serializer];
    NSMutableURLRequest* request=[jsonSeri requestWithMethod:@"POST" URLString:mock_server_url parameters:params error:nil];
    
    
    NSURLSessionDataTask *dataTask=[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if(!error){
#ifdef DEBUG
            NSLog(@"response data==>body:%@ headers:%@",responseObject,((NSHTTPURLResponse*)response).allHeaderFields);
#endif
            NSString *code=[responseObject objectForKey:@"code"];
            
            if(![code isEqualToString:@"000000"]){
                NSLog(@"下单返回错误...");
                UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"下单错误" message:[responseObject objectForKey:@"message"] preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                    NSLog(@"点击取消");
                    
                }]];
                [self presentViewController:alert animated:YES completion:^{
                    
                }];
                return ;
            }

            {
                [PaymaxSDK payWithAliToken:responseObject viewController:self completion:^(PaymaxResult * _Nonnull result) {
                    switch (result.type) {
                        case PAYMAX_CODE_SUCCESS:
                            
                            break;
                        case PAYMAX_CODE_FAIL_CANCEL:
                            break;
                        case PAYMAX_CODE_ERROR_CHARGE_PARAMETER:
                            break;
                        case PAYMAX_CODE_FAILURE:
                            break;
                            
                        case PAYMAX_CODE_ERROR_DEAL:
                            
                            break;
                        case PAYMAX_CODE_ERROR_CONNECT:
                            
                            break;
                        case PAYMAX_CODE_CHANNEL_WRONG:
                            
                            break;
                        case PAYMAX_CODE_ERROR_WX_NOT_INSTALL:
                            
                            break;
                        case PAYMAX_CODE_ERROR_WX_NOT_SUPPORT_PAY:
                            
                            break;
                        case PAYMAX_CODE_ERROR_WX_UNKNOW:
                            
                            break;
                        default:
                            ;
                    }
                }];
            }
            
        }else{
            
        }
        
    }];
    [dataTask resume];
}

-(NSDictionary*)createOrderParams{
    NSLog(@"uuid = %@",[self uuidString]);
        
    NSMutableDictionary *reqData=[NSMutableDictionary new];
  //  [reqData setObject:channel forKey:@"channel"];
    [reqData setObject:alipay forKey:@"tradeType"];
    [reqData setObject:@"商户名称iOS" forKey:@"merchantName"];
    [reqData setObject:[self uuidString] forKey:@"orderId"];
    [reqData setObject:@"00" forKey:@"validUnit"];
    [reqData setObject:@"10" forKey:@"validNum"];
    
    
    [reqData setObject:@"100" forKey:@"purchaser_id"];
    [reqData setObject:@100 forKey:@"totalAmount"];
    [reqData setObject:@"CNY" forKey:@"currency"];
    [reqData setObject:@"1" forKey:@"split_type"];
    NSMutableArray *detailOrder=[NSMutableArray new];
    [detailOrder addObject:@{@"orderAmt":@100,
                             @"rev_merchant_id":@"100",
                             @"shareFee":@"10",
                             @"rcvMerchantIdName":@"子商户名称1",
                             @"productName":@"商品名称1",
                             @"showUrl":@"http://test.url",
                             @"orderSeqNo":@"001",
                             @"detailOrderId":[self uuidString],
                             @"productId":@"1011",
                             @"productDesc":@"test"
                             }];

    
    [reqData setObject:detailOrder forKey:@"orderDetail"];
    return reqData;
    
}

-(NSString *)uuidString
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [[uuid lowercaseString] substringToIndex:20];
}

@end
