//
//  LXGetIPAddressTool.h
//  TaxReader
//
//  Created by asdc on 2020/5/22.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXGetIPAddressTool : NSObject

- (NSString *)getIPAddress;
+ (NSString *)getIPAddressWiFiAndTraffic:(BOOL)preferIPv4;

@end

NS_ASSUME_NONNULL_END
