//
//  ASCommonUtil.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/17.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASCommonUtil.h"

@implementation ASCommonUtil

//字典转为Json字符串
+ (NSString *)dictionaryToJson:(NSDictionary *)dic
{
    if(!dic){
        return nil;
    }
    NSError *error = nil;
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
//obj转为Json字符串
+ (NSString *)objToJson:(id)obj{
    if(!obj){
        return nil;
    }
    NSError *error = nil;
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

/**
 *  手机号码验证
 */
+ (BOOL)checkPhone:(NSString *)phone {
    
    NSString *checkPhone = @"^1[3456789]\\d{9}$";
    
    NSPredicate *regexTestPhone = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",checkPhone];
    
    return [regexTestPhone evaluateWithObject:phone];
}
+ (BOOL)checkPassword:(NSString *)pwd {
    
    NSString *checkPwd = @"^[A-Za-z0-9_@#]+$";
    NSPredicate *regexTestPwd = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",checkPwd];
    BOOL flag = [regexTestPwd evaluateWithObject:pwd];
    return flag;
}

/**
 *  得到Document文件夹
 */
+(NSString *)applicationDocumentPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+(NSString *)transferNumberToString:(double)number
{
    NSString *result=@"";
    
    //byte
    if(number < 1024)
    {
        result = [NSString stringWithFormat:@"%0.1fB",number];
    }
    //kB
    else if(number < 1024*1024)
    {
        result = [NSString stringWithFormat:@"%0.1fK",number/1024.0];
    }
    //MB
    else if(number < 1024*1024*1024)
    {
        result = [NSString stringWithFormat:@"%0.1fM",number/1024.0/1024.0];
    }
    //GB
    else
    {
        result = [NSString stringWithFormat:@"%0.1fG",number/1024.0/1024.0/1024.0];
    }
    return result;
}

//获取当前系统时间的时间戳
#pragma mark - 获取当前时间的 时间戳
+(NSInteger)getNowTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}

//将某个时间转化成 时间戳
#pragma mark - 将某个时间转化成 时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}

//将某个时间戳转化成 时间
#pragma mark - 将某个时间戳转化成 时间
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSLog(@"1296035591  = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

/** 是否安装微信 */
+(Boolean)weixinInstalled{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wechat://"]]) {
        return true;
    }
    return false;
}


@end
