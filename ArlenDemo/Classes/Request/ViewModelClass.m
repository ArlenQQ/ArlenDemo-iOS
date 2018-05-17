//
//  ViewModelClass.m
//  Zhiputong
//
//  Created by xianHong on 2017/10/19.
//  Copyright © 2017年 Leju. All rights reserved.
//

#import "ViewModelClass.h"

@implementation ViewModelClass

#pragma 接收传过来的block, 自动缓存
- (void)setBlockWithCacheBlock:(HttpResponseCache)cacheBlock
                   ReturnBlock:(ReturnValueBlock)returnBlock
                    ErrorBlock:(ErrorCodeBlock)errorBlock
                  FailureBlock:(FailureBlock)failureBlock
{
    _cacheBlock = cacheBlock;
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

#pragma 接收传过来的block, 无缓存
- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                     ErrorBlock: (ErrorCodeBlock) errorBlock
                   FailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}
#pragma 文件上传 - 传入交互的Block块, 无缓存
- (void)setBlockWithProgressBlock:(ProgressBlock) progressBlock
                      ReturnBlock: (ReturnValueBlock) returnBlock
                       ErrorBlock: (ErrorCodeBlock) errorBlock
                     FailureBlock: (FailureBlock) failureBlock{
    _progressBlock = progressBlock;
    _errorBlock = errorBlock;
    _returnBlock = returnBlock;
    _failureBlock = failureBlock;
}

/**
 对ErrorCode进行处理
 
 @param errorDic 错误
 */
-(void) errorCodeWithDic: (NSDictionary *) errorDic {
    self.errorBlock(errorDic);
}

/**
 对网路异常进行处理
 */
-(void) netFailure:(NSError *)error {
    self.failureBlock(error);
}

@end
