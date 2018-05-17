
//
//  NetRequestClass.m
//  Zhiputong
//
//  Created by xianHong on 2017/10/19.
//  Copyright © 2017年 Leju. All rights reserved.
//

#import "NetRequestClass.h"
#import "PPNetworkHelper.h"
#import "AlertPopView.h"
#import "MMAlertAction.h"
#import "MMAlertController.h"
#import "HomePageViewController.h"
#import "JdbTabBarController.h"
#import "LJLoginUtil.h"

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
    [PPNetworkHelper setValue:[LJDeviceUtil uuid] forHTTPHeaderField:@"device-id"];
    [PPNetworkHelper setValue:[NSString stringWithFormat:@"%f",IOSVersion] forHTTPHeaderField:@"os-version"];
    [PPNetworkHelper setValue:@"9" forHTTPHeaderField:@"dev-model"];
    [PPNetworkHelper setValue:kMyVersion forHTTPHeaderField:@"version-code"];
    [PPNetworkHelper setValue:@"9" forHTTPHeaderField:@"dev-type"];
    
    NSLog(@"%@",[LJDeviceUtil accessToken]);
    [PPNetworkHelper setValue:[LJDeviceUtil accessToken] forHTTPHeaderField:@"token"];
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
        // 如果errorCode等于0，调用successBlock(dic)
        if ([[responseObject objectForKey:@"errcode"] intValue] == 0) {
            // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
            successBlock(responseObject);
        } else {
            errorBlock(responseObject);
        }
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
    
    //如果没有Token 不是登录请求 不做网络请求
    if ([[LJDeviceUtil accessToken] isEqualToString:@""]) {
        if ([requestURLString containsString:@"/login/"] || [requestURLString containsString:@"/common/captcha"] || [requestURLString containsString:@"/forgetpassword/"] || [requestURLString containsString:@"/weixinlogin/"]) {
            //nothing
        } else {
            return;
        }
    }
    /** 特殊处理优惠券数据统计接口 */
//    bool isCouponStatisResquest = false;
//    if ([requestURLString containsString:kCouponStatis]) {
//        isCouponStatisResquest = true;
//    }
    // 发起请求
    [PPNetworkHelper POST:requestURLString parameters:parameter success:^(id responseObject) {
        // 如果errorCode等于0，调用successBlock(dic)
        if ([responseObject objectForKey:@"code"] != nil && [[responseObject objectForKey:@"code"] intValue] == 0) {
            if ([[responseObject objectForKey:@"data"] isKindOfClass:[NSArray class]]) {
                // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
                successBlock(responseObject);
            }
//            if (isCouponStatisResquest) {
//                if ([[responseObject objectForKey:@"data"] isKindOfClass:[NSDictionary class]]) {
//                    successBlock(responseObject);
//                }
//            }
            
//            // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
//            successBlock(responseObject);
        } else {
            NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
            if (code == 5250 || code == 5249 || code == 5248) {
                NSString *msg = [responseObject objectForKey:@"msg"];
                if ([requestURLString containsString:kRefreshToken]) {
                    return;
                }
                [self showLoginAlertTitle:@"提示" message:msg];
                return;
            }
            errorBlock(responseObject);
        }
    } failure:^(NSError *error) {
        
        //网络异常
        AlertPopView *alert = [[AlertPopView alloc] init];
        alert.msg = @"网络异常，请检查网络连接";//@"网络异常！";
        [alert show];
        
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
        if ([responseObject objectForKey:@"code"] != nil && [[responseObject objectForKey:@"code"] intValue] == 0) {
            // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
            if (successBlock) {
                successBlock(responseObject);
            }
        } else {
            
            NSInteger code = [[responseObject objectForKey:@"code"] integerValue];
            if (code == 5250 || code == 5249 || code == 5248) {
                NSString *msg = [responseObject objectForKey:@"msg"];
                [self showLoginAlertTitle:@"提示" message:msg];
                return;
            }
            if (errorBlock) {
                errorBlock(responseObject);
            }
            
        }
    } failure:^(NSError *error) {
        if (failureBlock) {
            failureBlock(error);
        }
    }];
}

+(void) showLoginAlertTitle:(NSString *)title message:(NSString *)message{
    [SVProgressHUD dismiss];
    [LJLoginUtil lj_showReloginAlertWithTitle:title msg:message];
}

@end

