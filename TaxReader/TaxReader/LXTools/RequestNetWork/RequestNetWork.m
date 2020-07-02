//
//  RequestNetWork.m
//  eplatform
//
//  Created by asdc on 2017/11/28.
//  Copyright © 2017年 TongFangXL. All rights reserved.
//

#import "RequestNetWork.h"
#import "XLPicModel.h"
#import "AFNetworking.h"
//#import "PublicUtil"

@implementation RequestNetWork

XLSingletonM(RequestNetWork) // 单例实现

/**
 *  网络监测(在什么网络状态)
 *
 *  @param unknown          未知网络
 *  @param reachable        无网络
 *  @param reachableViaWWAN 蜂窝数据网
 *  @param reachableViaWiFi WiFi网络
 */
+ (void)networkStatusUnknown:(Unknown)unknown reachable:(Reachable)reachable reachableViaWWAN:(ReachableViaWWAN)reachableViaWWAN reachableViaWiFi:(ReachableViaWiFi)reachableViaWiFi
{
    // 创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 注意：有开就需要有关，否则会一直在监听状态，就算在其他页面
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status)
        {
            case AFNetworkReachabilityStatusUnknown:
                unknown();
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                reachable();
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                reachableViaWWAN();
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                reachableViaWiFi();
                break;
                
            default:
                break;
        }
    }] ;
    [manager stopMonitoring];
}


/**
 封装的POST请求使用setHTTPBody方式

 @param URLString 地址
 @param jsonString 由字典转为的JSON串
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)POSTHttpBody:(NSString *)URLString JsonString:(NSString *)jsonString success:(Success)success failure:(Failure)failure {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; //不设置会报-1016或者会有编码问题
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; //不设置会报 error 3840
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",nil]];
    
    NSMutableURLRequest *req = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:nil error:nil];
    
    req.timeoutInterval = 10;
    
    
    
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"049e73d6e0744a7491c1592977904723" forHTTPHeaderField:@"nonce"];
    [req setValue:@"a3ab7c3642bf7eda103edb374be30b022ee4765d" forHTTPHeaderField:@"signature"];
    [req setValue:@"1592977904723" forHTTPHeaderField:@"timestamp"];
    [req setValue:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI0NDU5IiwibGF0IjoxNTkyOTQ5MTMzNTcxfQ.3kssoNVDuhxN7scXtEv97Yg7p34OM4LSZ-pAkmfTW3I" forHTTPHeaderField:@"timestamp"];
    
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error)
        {
            success(responseObject);
        }else {
            failure(error);
        }
    }] resume];
}





/**
 *  封装的POST请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+(void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //    NSString *str = [NSString stringWithFormat:@"%@%@",@"userToken=",[UserDefultTool getUserToken]];
    //    [manager.requestSerializer setValue:str forHTTPHeaderField:@"Cookie"];
    [manager.requestSerializer setValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"application/json",
                                                         @"text/json",
                                                         @"text/javascript",
                                                         @"text/html",
                                                         @"text/xml",
                                                         @"text/plain",
                                                         @"application/x-www-form-urlencoded",
                                                         nil];
    

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES]; // 开启状态栏动画
    
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]; // 关闭状态栏动画
    }];
    
}

/**
 *  封装的get请求
 *
 *  @param URLString  请求的链接
 *  @param parameters 请求的参数
 *  @param success    请求成功回调
 *  @param failure    请求失败回调
 */
+ (void)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manager.requestSerializer setValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success)
        {
            success(responseObject);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure)
        {
            failure(error);
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}


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
+(void)UploadCheckWithUrl:(NSString *)URLString Parameters:(NSDictionary *)parameters FileData:(NSData *)fileData ParamName:(NSString *)name MimeType:(NSString *)mimeType Progress:(Progress)progress success:(Success)success failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [manager.requestSerializer setValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];

    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSString *type = [mimeType containsString:@"image"]?@"jpg":@"wav";
        [formData appendPartWithFileData:fileData name:name fileName:[NSString stringWithFormat:@"%ld%d.%@",random(),rand(),type] mimeType:mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress)
        {
            progress(uploadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
        }
        
    }];
}

/**
 *  下载
 *
 *  @param URLString       请求的链接
 *  @param progress        进度的回调
 *  @param destination     返回URL的回调
 *  @param downLoadSuccess 发送成功的回调
 *  @param failure         发送失败的回调
 */
+ (NSURLSessionDownloadTask *)downLoadWithURL:(NSString *)URLString progress:(Progress)progress destination:(Destination)destination downLoadSuccess:(DownLoadSuccess)downLoadSuccess failure:(Failure)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.requestSerializer setValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];

    NSURL *url = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progress)
        {
            progress(downloadProgress); // HDLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        if (destination)
        {
            return destination(targetPath, response);
        }
        else
        {
            return nil;
        }
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error)
        {
            failure(error);
        }
        else
        {
            downLoadSuccess(response, filePath);
        }
    }];
    
    // 开始启动任务
    [task resume];
    
    return task;
}

@end
