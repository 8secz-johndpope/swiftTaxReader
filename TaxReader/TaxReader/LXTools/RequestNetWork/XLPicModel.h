//
//  XLPicModel.h
//  eplatform
//
//  Created by asdc on 2017/11/28.
//  Copyright © 2017年 TongFangXL. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface XLPicModel : NSObject

/**
 *  上传的图片的名字
 */
@property (nonatomic, copy) NSString *picName;

/**
 *  上传的图片
 */
//@property (nonatomic, strong, nullable) UIImage *pic;

/**
 *  上传的二进制文件
 */
@property (nonatomic, strong) NSData *picData;

/**
 *  上传的资源url
 */
@property (nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
