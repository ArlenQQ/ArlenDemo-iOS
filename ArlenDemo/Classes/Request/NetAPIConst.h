//
//  NetAPIConst.h
//  Zhiputong
//
//  Created by xianHong on 2017/10/25.
//  Copyright © 2017年 Leju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//定义返回请求数据的block类型
typedef void(^HttpResponseCache)(id responseCache);
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock) (NSError *error);
typedef void (^NetWorkBlock) (BOOL netConnetState);
typedef void (^ProgressBlock) (NSProgress *progress);

@interface NetAPIConst : NSObject

/*
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever 1
#define TestSever    0
#define ProductSever 0

/** 接口前缀-开发服务器*/
UIKIT_EXTERN NSString *const kApiPrefix;
/** H5 请求头前缀 */
UIKIT_EXTERN NSString *const kH5BaseUrlPrefix;
/** 接口Log开关*/
UIKIT_EXTERN BOOL kOpenJsonLog;

#pragma mark - Web H5
/** 签单总额统计 */
UIKIT_EXTERN NSString *const kH5LineTotalStatistics;
/** 今日新增客户 */
UIKIT_EXTERN NSString *const kH5CustomerDataStatistics;
/** 今日新增预约 */
UIKIT_EXTERN NSString *const kH5ReservationDataStatistics;
/** 今日新增签单 */
UIKIT_EXTERN NSString *const kH5SignedDataStatistics;
/** 转化分析 */
UIKIT_EXTERN NSString *const kH5CustomerConversionStatistics;
/** 导购分析 */
UIKIT_EXTERN NSString *const kH5GuideDataStatistics;
/** 店铺分析 */
UIKIT_EXTERN NSString *const kH5LineshopDataStatistics;
/** 方案分析 */
UIKIT_EXTERN NSString *const kH5RealcaseDataStatistics;
/** 商品分析 */
UIKIT_EXTERN NSString *const kH5GoodsStatistics;
/** 优惠券分析 */
UIKIT_EXTERN NSString *const kH5CouponStatistics;
/** 优惠券首页 */
UIKIT_EXTERN NSString *const kH5CouponHome;
/** 没有账号 */
UIKIT_EXTERN NSString *const kH5NoAccount;
/** 关于我们 */
UIKIT_EXTERN NSString *const kH5AboutUS;
/** 聚客神器介绍 */
UIKIT_EXTERN NSString *const kH5ToolIntro;
/** 乐居协议 */
UIKIT_EXTERN NSString *const kH5LejuProtocol;

#pragma mark - 公共数据
/** 公共数据*/
UIKIT_EXTERN NSString *const kCommonInfo;
/** 预约单签单筛选条件*/
UIKIT_EXTERN NSString *const kOrderFilterInfo;
/** 客户池筛选条件*/
UIKIT_EXTERN NSString *const kCustomerPoolFilterInfo;
/** 版本信息*/
UIKIT_EXTERN NSString *const kCommonVersion;
/** 旧TOKEN换取新TOKEN */
UIKIT_EXTERN NSString *const kRefreshToken;

#pragma mark - 首页
/** 首页*/
UIKIT_EXTERN NSString *const kHome;

#pragma mark - 微信登录
/** 验证是否授权 */
UIKIT_EXTERN NSString *const kWeiXinLogin;
/** 绑定账号 */
UIKIT_EXTERN NSString *const kWeiXinBind;

#pragma mark - 登录
/** 登录*/
UIKIT_EXTERN NSString *const kLogin;
UIKIT_EXTERN NSString *const kMobileLogin;
UIKIT_EXTERN NSString *const kLoginSendSMS;
UIKIT_EXTERN NSString *const kCommonCaptcha;
UIKIT_EXTERN NSString *const kCheckImageCode;
/** 忘记密码 */
UIKIT_EXTERN NSString *const kForgetPwdCheckMobile;
UIKIT_EXTERN NSString *const kForgetPwdSendSMS;
UIKIT_EXTERN NSString *const kForgetPwdResetPassword;

/** 平台会员退出*/
UIKIT_EXTERN NSString *const kExit;

#pragma mark - 客户管理
/** 客户列表*/
UIKIT_EXTERN NSString *const kCustormerLists;
/** 模糊搜索列表*/
UIKIT_EXTERN NSString *const kCustomerSearch;
/** 客户详情*/
UIKIT_EXTERN NSString *const kCustormerDetail;
/** 分配客户调用导购列表*/
UIKIT_EXTERN NSString *const kCustormerSalers;
/** 分配导购*/
UIKIT_EXTERN NSString *const kCustormerAllot;
/** 客户池列表*/
UIKIT_EXTERN NSString *const kCustormerPool;
/** 客户池模糊搜索列表*/
UIKIT_EXTERN NSString *const kCustomerPoolSearch;
/** 客户池获取导购列表*/
UIKIT_EXTERN NSString *const kCustormerPoolsalers;
/** 客户池客户详细信息*/
UIKIT_EXTERN NSString *const kCustormerPoolDetail;
/** 客户池分配导购*/
UIKIT_EXTERN NSString *const kCustormerPoolallot;
/** 客户池删除客户*/
UIKIT_EXTERN NSString *const kCustormerPooldel;
/** 客户分配记录*/
UIKIT_EXTERN NSString *const kCustormerAssignedlog;

#pragma mark - 预约管理
/** 预约列表*/
UIKIT_EXTERN NSString *const kReserveListByCustomerId;
/** 预约列表*/
UIKIT_EXTERN NSString *const kReserveLists;
/** 预约详情*/
UIKIT_EXTERN NSString *const kReserveDetail;
/** 预约详情-跟进记录*/
UIKIT_EXTERN NSString *const kfollowLists;

#pragma mark - 签单管理
/** 签单列表*/
UIKIT_EXTERN NSString *const kOrderListByCustomerId;
/** 签单列表*/
UIKIT_EXTERN NSString *const kOrderLists;
/** 签单详情*/
UIKIT_EXTERN NSString *const kOrderDetail;

#pragma mark - 货品列表
/** 货品列表*/
UIKIT_EXTERN NSString *const kGoodsLists;

#pragma mark - 优惠券
/** 优惠券列表 */
UIKIT_EXTERN NSString *const kCouponList;
/** 添加优惠券 */
UIKIT_EXTERN NSString *const kCouponCreate;
/** 经销商门店列表 */
UIKIT_EXTERN NSString *const kLineshop;
/** 提现审核列表 */
UIKIT_EXTERN NSString *const kCouponRebate;
/** 提现审核详情 */
UIKIT_EXTERN NSString *const kCouponView;
/** 提现审核操作 */
UIKIT_EXTERN NSString *const kCouponDochecked;
/** 优惠券统计 */
UIKIT_EXTERN NSString *const kCouponStatis;
/** 优惠首页接口 */
UIKIT_EXTERN NSString *const kCouponHome;

#pragma mark - 个人中心
/** 修改昵称 */
UIKIT_EXTERN NSString *const kCenterChangeNickname;
/** 修改密码 */
UIKIT_EXTERN NSString *const kCenterModifyPwd;
/** 发送旧手机验证码 */
UIKIT_EXTERN NSString *const kModifyMobileSendOldSMS;
/** 验证旧手机 */
UIKIT_EXTERN NSString *const kModifyMobileCheckOldMobile;
/** 发送新手机验证码 */
UIKIT_EXTERN NSString *const kModifyMobileSendNewSMS;
/** 修改手机号 */
UIKIT_EXTERN NSString *const kModifyMobile;
/** 修改头像 */
UIKIT_EXTERN NSString *const kModifyAvatar;
/** 修改保护期 */
UIKIT_EXTERN NSString *const kModifyProtectTime;
/** 绑定微信账号 */
UIKIT_EXTERN NSString *const kCenterBindweichat;
/** 解绑微信账号 */
UIKIT_EXTERN NSString *const kCenterUnbindWeichat;
/** 消息列表 */
UIKIT_EXTERN NSString *const kMessageLists;
/** 获取用户保护期 */
UIKIT_EXTERN NSString *const kCenterGetProtectTime;
/** 修改店长是否能编辑保护期 */
UIKIT_EXTERN NSString *const kCenterEditManagerEdit;
/** 意见反馈 */
UIKIT_EXTERN NSString *const kUserFeedback;
/** 添加图片 */
UIKIT_EXTERN NSString *const kUserFeedbackAddPic;
/** 获取用户资料 */
UIKIT_EXTERN NSString *const kUserProfile;
/** IM权重平均分配修改 */
UIKIT_EXTERN NSString *const kUserSetImAverage;
/** IM权重修改 */
UIKIT_EXTERN NSString *const kUserSetImSetting;
/** IM权重信息读取 */
UIKIT_EXTERN NSString *const kUserGetImSetting;
@end
