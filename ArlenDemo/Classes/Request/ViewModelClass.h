//
//  ViewModelClass.h
//  Zhiputong
//
//  Created by xianHong on 2017/10/19.
//  Copyright © 2017年 Leju. All rights reserved.
//

#import "NetRequestClass.h"
#import "AlertPopView.h"

@interface ViewModelClass : NSObject

@property (strong, nonatomic) HttpResponseCache cacheBlock;
@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ErrorCodeBlock errorBlock;
@property (strong, nonatomic) FailureBlock failureBlock;
@property (strong, nonatomic) ProgressBlock progressBlock;

#pragma 传入交互的Block块, 自动缓存
- (void)setBlockWithCacheBlock: (HttpResponseCache) cacheBlock
                   ReturnBlock: (ReturnValueBlock) returnBlock
                    ErrorBlock: (ErrorCodeBlock) errorBlock
                  FailureBlock: (FailureBlock) failureBlock;

#pragma 传入交互的Block块, 无缓存
- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                     ErrorBlock: (ErrorCodeBlock) errorBlock
                   FailureBlock: (FailureBlock) failureBlock;

#pragma 文件上传 - 传入交互的Block块, 无缓存
- (void)setBlockWithProgressBlock:(ProgressBlock) progressBlock
                    ReturnBlock: (ReturnValueBlock) returnBlock
                     ErrorBlock: (ErrorCodeBlock) errorBlock
                   FailureBlock: (FailureBlock) failureBlock;

/**
 对ErrorCode进行处理
 
 @param errorDic 错误
 */
-(void)errorCodeWithDic: (NSDictionary *) errorDic;

/**
 对网路异常进行处理
 */
-(void)netFailure:(NSError *)error;

@end
