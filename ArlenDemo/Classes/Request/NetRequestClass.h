
//  NetRequestClass.h
//  Zhiputong
//
//  Created by xianHong on 2017/10/19.
//  Copyright © 2017年 Leju. All rights reserved.
//

#import"AFNetworking.h"

@interface NetRequestClass : NSObject

#pragma 取消所有HTTP请求
+ (void)cancelAllRequest;

#pragma 取消指定URL的HTTP请求
+ (void)cancelRequestWithURL:(NSString *)URL;

+(void) showLoginAlertTitle:(NSString *)title message:(NSString *)message;

#pragma POST请求自动缓存
+(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                          Parameter:(NSDictionary *) parameter
                      responseCache:(HttpResponseCache)responseCacheBlock
                   ReturnValeuBlock:(ReturnValueBlock) successBlock
                     ErrorCodeBlock:(ErrorCodeBlock) errorBlock
                       FailureBlock:(FailureBlock) failureBlock;

#pragma POST请求无缓存
+(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                         Parameter:(NSDictionary *) parameter
                  ReturnValeuBlock:(ReturnValueBlock) successBlock
                    ErrorCodeBlock:(ErrorCodeBlock) errorBlock
                      FailureBlock:(FailureBlock) failureBlock;

#pragma 上传单/多张图片

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
                        FailureBlock:(FailureBlock) failureBlock;

@end
