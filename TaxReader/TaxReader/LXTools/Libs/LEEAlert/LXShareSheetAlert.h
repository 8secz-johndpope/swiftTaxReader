//
//  LXShareSheetAlert.h
//  TaxReader
//
//  Created by asdc on 2020/8/4.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXShareSheetAlert : NSObject

- (void)showLEEAlertShareSheet;

@property (nonatomic , copy ) void (^openShareTypeBlock)(NSInteger shareType);

@end

NS_ASSUME_NONNULL_END
