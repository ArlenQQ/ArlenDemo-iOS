//
//  ASConst.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/17.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

//邮件接收人
UIKIT_EXTERN NSString *const kMail_cc_ToRecipients_Address;

//网络状态监控地址
UIKIT_EXTERN NSString *const kURL_Reachability__Address;

// 友盟统计
UIKIT_EXTERN NSString *const ASThirdSDKUMConfigInstanceAppKey;

// 渠道
UIKIT_EXTERN NSString *const ASThirdSDKUMConfigInstanceChannelId;

// 友盟社交
UIKIT_EXTERN NSString *const ASThirdSDKUMSocialAppkey;

// 友盟推送
UIKIT_EXTERN NSString *const ASThirdSDKUMessageStartWithAppkey;

// 友盟推送
UIKIT_EXTERN NSString *const ASThirdSDKUMessageAppMasterSecret;


// UM 微信登录
UIKIT_EXTERN NSString *const ASThirdSDKWeChatAppKey;

UIKIT_EXTERN NSString *const ASThirdSDKWeChatAppSecret;

UIKIT_EXTERN NSString *const ASThirdSDKWeChatRedirectURL;


//sina 对应的 bundleID: com.github.njhu
// 不对应第三方用不了
UIKIT_EXTERN NSString *const ASThirdSDKSinaAppKey;

UIKIT_EXTERN NSString *const ASThirdSDKSinaAppSecret;

UIKIT_EXTERN NSString *const ASThirdSDKSinaRedirectURL;

// UMQQ
UIKIT_EXTERN NSString *const ASThirdSDKQQAppKey;

UIKIT_EXTERN NSString *const ASThirdSDKQQAppSecret;

UIKIT_EXTERN NSString *const ASThirdSDKQQRedirectURL;

// 魔窗 ios 9 通用链接, 可以服务器自己做
UIKIT_EXTERN NSString *const ASThirdSDKMagicWindow;

//百度地图, 对应的 bundleID: com.github.njhu
// 不对应的话会失败
UIKIT_EXTERN NSString *const ASThirdSDKBaiduMapKey;

// 科大讯飞
UIKIT_EXTERN NSString *const  USER_APPID;

// 通知
UIKIT_EXTERN NSString *const ASUMSocialShareSucceedNotification;

// tableviewcontroller dealloc 通知
UIKIT_EXTERN NSString *const ASTableViewControllerDeallocNotification;

// 服务器XMG
UIKIT_EXTERN NSString *const ASXMGBaseUrl;
