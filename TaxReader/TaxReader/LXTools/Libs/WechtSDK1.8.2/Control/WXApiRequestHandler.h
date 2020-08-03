//
//  WXApiRequestHandler.h
//  TaxReader
//
//  Created by asdc on 2020/8/3.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApiObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface WXApiRequestHandler : NSObject

+ (void)sendLinkURL:(NSString *)urlString
            TagName:(NSString *)tagName
              Title:(NSString *)title
        Description:(NSString *)description
         ThumbImage:(UIImage *)thumbImage
            InScene:(enum WXScene)scene;


@end

NS_ASSUME_NONNULL_END
