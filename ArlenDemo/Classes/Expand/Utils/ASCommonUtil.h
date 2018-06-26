//
//  ASCommonUtil.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/17.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASCommonUtil : NSObject

//字典转为Json字符串
+ (NSString *)dictionaryToJson:(NSDictionary *)dic;
//obj转为Json字符串
+ (NSString *)objToJson:(id)obj;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  手机号码验证
 */
+ (BOOL)checkPhone:(NSString *)phone;
/** 密码验证 */
+ (BOOL)checkPassword:(NSString *)pwd;
/** 文件大小 格式化 */
+(NSString *)transferNumberToString:(double)number;

+(NSInteger)getNowTimestamp;
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
/** 是否安装微信 */
+(Boolean) weixinInstalled;

@end
