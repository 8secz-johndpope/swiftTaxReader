//
//  RequestNetWork.h
//  eplatform
//
//  Created by asdc on 2017/11/28.
//  Copyright © 2017年 TongFangXL. All rights reserved.
//  在这两个宏之间的代码，所有简单指针对象都被假定为nonnull，因此我们只需要去指定那些nullable的指针

#import <Foundation/Foundation.h>

#import "XLSingleton.h"

NS_ASSUME_NONNULL_BEGIN

@class XLPicModel;

typedef void (^ _Nullable Success)(id responseObject);     // 成功Block
typedef void (^ _Nullable Failure)(NSError *error);        // 失败Blcok
typedef void (^ _Nullable Progress)(NSProgress * _Nullable progress); // 上传或者下载进度Block
typedef NSURL * _Nullable (^ _Nullable Destination)(NSURL *targetPath, NSURLResponse *response); //返回URL的Block
typedef void (^ _Nullable DownLoadSuccess)(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath); // 下载成功的Blcok

typedef void (^ _Nullable Unknown)(void);          // 未知网络状态的Block
typedef void (^ _Nullable Reachable)(void);        // 无网络的Blcok
typedef void (^ _Nullable ReachableViaWWAN)(void); // 蜂窝数据网的Block
typedef void (^ _Nullable ReachableViaWiFi)(void); // WiFi网络的Block

@interface RequestNetWork : NSObject

XLSingletonH(RequestNetWork) // 单例声明

/**
 *  上传图片大小(kb)
 */
@property (nonatomic, assign) NSUInteger picSize;

/**
 *  超时时间(默认20秒)
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 *  可接受的响应内容类型
 */
@property (nonatomic, copy) NSSet <NSString *> *acceptableContentTypes;

/**
 *  网络监测(在什么网络状态)
 *
 *  @param unknown          未知网络
 *  @param reachable        无网络
 *  @param reachableViaWWAN 蜂窝数据网
 *  @param reachableViaWiFi WiFi网络
 */
+ (void)networkStatusUnknown:(Unknown)unknown reachable:(Reachable)reachable reachableViaWWAN:(ReachableViaWWAN)reachableViaWWAN reachableViaWiFi:(ReachableViaWiFi)reachableViaWiFi;


/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;


/**
 封装的POST请求使用setHTTPBody方式
 
 @param URLString 地址
 @param jsonString 由字典转为的JSON串
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)POSTHttpBody:(NSString *)URLString JsonString:(NSString *)jsonString success:(Success)success failure:(Failure)failure;

/**
 *  封装的get请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 *  文件上传：可根据type判断是图片还是语音文件
 *
 *  @param URLString  请求的地址
 *  @param parameters 请求的参数
 *  @param fileData   文件的data数据
 *  @param name       带上传的文件以哪个字段进行提交
 *  @param mimeType   文件的类型
 *  @param progress   进度
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+(void)UploadCheckWithUrl:(NSString *)URLString Parameters:(NSDictionary *)parameters FileData:(NSData *)fileData ParamName:(NSString *)name MimeType:(NSString *)mimeType Progress:(Progress)progress success:(Success)success failure:(Failure)failure;

/**
 *  下载
 *
 *  @param URLString       请求的链接
 *  @param progress        进度的回调
 *  @param destination     返回URL的回调
 *  @param downLoadSuccess 发送成功的回调
 *  @param failure         发送失败的回调
 */
+ (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure;

@end

NS_ASSUME_NONNULL_END
