//
//  Config.h
//  Zhiputong
//
//  Created by xianHong on 2017/10/19.
//  Copyright © 2017年 Leju. All rights reserved.
//

#ifndef Config_h
#define Config_h

#ifdef DEBUG
#define DDLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define DDLog(...)
#endif


//登录token
#define kAccessToken @"accessToken"

//设备token
#define kDeviceToken @"deviceToken"




//强弱引用
#define MMWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define MMStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

//系统版本
#define IOSVersion      [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS7_OR_LATER   ( IOSVersion >= 7.0 )
#define IOS11_OR_LATER   ( IOSVersion >= 11.0 )

//屏幕尺寸
#define UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define UI_IS_IPHONE5           (UI_IS_IPHONE && kScreenHeight == 568.0)
#define UI_IS_IPHONE6           (UI_IS_IPHONE && kScreenHeight == 667.0)
#define UI_IS_IPHONE6P          (UI_IS_IPHONE && kScreenHeight == 736.0 || kScreenWidth == 736.0) // Both orientations
#define UI_IS_IPHONEX           (UI_IS_IPHONE && kScreenHeight == 812.0)

//判断设备是否是iPhoneX
#define kNavigationBariPhoneOffSetY 24


//获取当前版本号
#define kMyVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//每页记录数量，默认10
#define kNums PageMaxCount

/** 列表请求 每页的条数 */
#define PageMaxCount 10

/** 通用方法 */
#define NOTNULL(a,b) (a != nil && ![a isKindOfClass:[NSNull class]] ? a:b)


#endif /* Config_h */
