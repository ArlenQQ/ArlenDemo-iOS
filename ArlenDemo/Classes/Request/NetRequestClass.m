
//
//  NetRequestClass.m
//  Zhiputong
//
//  Created by xianHong on 2017/10/19.
//  Copyright © 2017年 Leju. All rights reserved.
//

#import "NetRequestClass.h"
#import "PPNetworkHelper.h"

@implementation NetRequestClass

/**
 取消所有HTTP请求
 */
+ (void)cancelAllRequest {
    [PPNetworkHelper cancelAllRequest];
}

/**
 取消指定URL的HTTP请求

 @param URL 请求的URL
 */
+ (void)cancelRequestWithURL:(NSString *)URL {
    [PPNetworkHelper cancelRequestWithURL:URL];
}

//统一配置请求头的相关参数
+ (void)setCommonHTTPHeaderField {
//    [PPNetworkHelper setValue:[LJDeviceUtil uuid] forHTTPHeaderField:@"device-id"];
//    [PPNetworkHelper setValue:[NSString stringWithFormat:@"%f",IOSVersion] forHTTPHeaderField:@"os-version"];
//    [PPNetworkHelper setValue:@"9" forHTTPHeaderField:@"dev-model"];
//    [PPNetworkHelper setValue:kMyVersion forHTTPHeaderField:@"version-code"];
//    [PPNetworkHelper setValue:@"9" forHTTPHeaderField:@"dev-type"];
//    
//    NSLog(@"%@",[LJDeviceUtil accessToken]);
//    [PPNetworkHelper setValue:[LJDeviceUtil accessToken] forHTTPHeaderField:@"token"];
}

/**
 POST请求自动缓存

 @param requestURLString 请求的URL
 @param parameter 参数
 @param responseCacheBlock 缓存block回调
 @param successBlock 业务逻辑成功的block回调
 @param errorBlock 业务逻辑失败的block回调
 @param failureBlock 网络失败的block回调
 */
+(void)NetRequestPOSTWithRequestURL:(NSString *)requestURLString
                          Parameter:(NSDictionary *)parameter
                      responseCache:(HttpResponseCache)responseCacheBlock
                   ReturnValeuBlock:(ReturnValueBlock)successBlock
                     ErrorCodeBlock:(ErrorCodeBlock)errorBlock
                       FailureBlock:(FailureBlock)failureBlock
{
    //日志打印开关
    if (kOpenJsonLog) {
        // 开启日志打印
        [PPNetworkHelper openLog];
    } else {
        // 关闭日志打印
        [PPNetworkHelper closeLog];
    }
    
    //统一配置请求头的相关参数
    [self setCommonHTTPHeaderField];

    //发起请求
    [PPNetworkHelper POST:requestURLString parameters:parameter responseCache:^(id responseCache) {
        //缓存block
        responseCacheBlock(responseCache);
    } success:^(id responseObject) {

    } failure:^(NSError *error) {
        // 同上
        failureBlock(error);
    }];
}

/**
 POST请求无缓存
 
 @param requestURLString 请求的URL
 @param parameter 参数
 @param successBlock 业务逻辑成功的block回调
 @param errorBlock 业务逻辑失败的block回调
 @param failureBlock 网络失败的block回调
 */
+(void)NetRequestPOSTWithRequestURL:(NSString *)requestURLString
                          Parameter:(NSDictionary *)parameter
                   ReturnValeuBlock:(ReturnValueBlock)successBlock
                     ErrorCodeBlock:(ErrorCodeBlock)errorBlock
                       FailureBlock:(FailureBlock)failureBlock
{
    //日志打印开关
    if (kOpenJsonLog) {
        // 开启日志打印
        [PPNetworkHelper openLog];
    } else {
        // 关闭日志打印
        [PPNetworkHelper closeLog];
    }
    
    //统一配置请求头的相关参数
    [self setCommonHTTPHeaderField];
    
    [PPNetworkHelper POST:requestURLString parameters:parameter success:^(id responseObject) {
        successBlock(responseObject);
    } failure:^(NSError *error) {
        failureBlock(error);
    }];
}

/**
 上传单/多张图片
 
 @param requestURLString 请求的URL
 @param parameter 参数
 @param name 图片对应服务器上的字段
 @param images 图片数组
 @param fileNames 图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 @param imageType 图片文件的类型,例:png、jpg(默认类型)....
 @param progressBlock 上传进度信息
 @param successBlock 业务逻辑成功的block回调
 @param errorBlock 业务逻辑失败的block回调
 @param failureBlock 网络失败的block回调
 */
+(void)NetUploadImagesWithRequestURL:(NSString *) requestURLString
                         Parameter:(NSDictionary *) parameter
                                Name:(NSString *) name
                              Images:(NSArray <UIImage *>*) images
                           FileNames:(NSArray<NSString *>*) fileNames
                          ImageScale:(CGFloat) imageScale
                           ImageType:(NSString *)imageType
                       ProgressBlock:(ProgressBlock) progressBlock
                  ReturnValeuBlock:(ReturnValueBlock) successBlock
                    ErrorCodeBlock:(ErrorCodeBlock) errorBlock
                        FailureBlock:(FailureBlock) failureBlock{
    //日志打印开关
    if (kOpenJsonLog) {
        // 开启日志打印
        [PPNetworkHelper openLog];
    } else {
        // 关闭日志打印
        [PPNetworkHelper closeLog];
    }
    
    //统一配置请求头的相关参数
    [self setCommonHTTPHeaderField];

    [PPNetworkHelper uploadImagesWithURL:requestURLString parameters:parameter name:name images:images fileNames:fileNames imageScale:imageScale imageType:imageType progress:^(NSProgress *progress) {
        if (progressBlock) {
            progressBlock(progress);
        }
    } success:^(id responseObject) {
        successBlock(responseObject);
    } failure:^(NSError *error) {
        failureBlock(error);
    }];
}

+(void) showLoginAlertTitle:(NSString *)title message:(NSString *)message{
//    [SVProgressHUD dismiss];
//    [LJLoginUtil lj_showReloginAlertWithTitle:title msg:message];
}

@end

