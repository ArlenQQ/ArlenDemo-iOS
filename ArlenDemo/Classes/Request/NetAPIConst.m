//
//  NetAPIConst.m
//  Zhiputong
//
//  Created by xianHong on 2017/10/25.
//  Copyright © 2017年 Leju. All rights reserved.
//

#import "NetAPIConst.h"

@implementation NetAPIConst

#if DevelopSever
/** 接口前缀-开发服务器*/
NSString *const kApiPrefix = @"http://apis.gezlife.net/zhiputong/zhiputong";
NSString *const kH5BaseUrlPrefix = @"http://store.gezlife.net/H5";
BOOL kOpenJsonLog = YES;
#elif TestSever
/** 接口前缀-测试服务器*/
NSString *const kApiPrefix = @"https://apis.gezlife.com/zhiputong/zhiputong";
NSString *const kH5BaseUrlPrefix = @"http://store.gezlife.cc/H5";
BOOL kOpenJsonLog = NO;
#else
/** 接口前缀-生产服务器*/
NSString *const kApiPrefix = @"https://apis.gezlife.com/zhiputong/zhiputong";
NSString *const kH5BaseUrlPrefix = @"https://store.gezlife.com/H5";
BOOL kOpenJsonLog = NO;
#endif

#pragma H5 页面
/** 没有账号 */
NSString *const kH5NoAccount = @"/Account/account.html";
/** 关于我们 */
NSString *const kH5AboutUS = @"/AboutUS/JDBaboutus.html";
/** 聚客神器介绍 */
NSString *const kH5ToolIntro = @"/ToolIntro/toolIntro.html";
/** 乐居协议 */
NSString *const kH5LejuProtocol = @"/Protocol/protocol.html";

/** 签单总额统计 */
NSString *const kH5LineTotalStatistics = @"/DataAnalysis/lineTotalStatistics.html";
/** 今日新增客户 */
NSString *const kH5CustomerDataStatistics = @"/DataAnalysis/customerDataStatistics.html";
/** 今日新增预约 */
NSString *const kH5ReservationDataStatistics = @"/DataAnalysis/reservationDataStatistics.html";
/** 今日新增签单 */
NSString *const kH5SignedDataStatistics = @"/DataAnalysis/signedDataStatistics.html";
/** 转化分析 */
NSString *const kH5CustomerConversionStatistics = @"/DataAnalysis/customerConversionStatistics.html";
/** 导购分析 */
NSString *const kH5GuideDataStatistics = @"/DataAnalysis/guideDataStatistics.html";
/** 店铺分析 */
NSString *const kH5LineshopDataStatistics = @"/DataAnalysis/lineshopDataStatistics.html";
/** 方案分析 */
NSString *const kH5RealcaseDataStatistics = @"/DataAnalysis/realcaseDataStatistics.html";
/** 商品分析 */
NSString *const kH5GoodsStatistics = @"/DataAnalysis/goodsStatistics.html";
/** 优惠券分析 */
NSString *const kH5CouponStatistics = @"/DataAnalysis/couponStatistics.html";
/** 优惠券首页 */
NSString *const kH5CouponHome = @"/DataAnalysis/index.html";
#pragma mark - 公共数据
/** 公共数据*/
NSString *const kCommonInfo = @"/Info/customerSearchInfo";
/** 预约单签单筛选条件*/
NSString *const kOrderFilterInfo = @"/Info/resSearchInfo";
/** 客户池筛选条件*/
NSString *const kCustomerPoolFilterInfo = @"/Info/myCustomerSearchInfo";
/** 版本信息*/
NSString *const kCommonVersion = @"/common/version";
/** 旧TOKEN换取新TOKEN */
NSString *const kRefreshToken = @"/info/refreshtoken";

#pragma mark - 首页
/** 首页*/
NSString *const kHome = @"/statistics/index";

#pragma mark - 微信登录
/** 验证是否授权 */
NSString *const kWeiXinLogin = @"/weixinlogin/checkwechatbind";
/** 绑定账号 */
NSString *const kWeiXinBind = @"/weixinlogin/bindwechatuser";

#pragma mark - 登录
/** 登录*/
NSString *const kLogin = @"/login/usernamelogin";
/** 手机验证码登录*/
NSString *const kMobileLogin = @"/login/mobilelogin";
/** 手机验证码登录*/
NSString *const kLoginSendSMS = @"/login/sendsms";
/** 图片验证码*/
NSString *const kCommonCaptcha = @"/common/captcha";
/** 验证图片验证码*/
NSString *const kCheckImageCode = @"/login/checkimagevalidationcode";
#pragma mark - 忘记密码
/** 发送找回密码手机验证码*/
NSString *const kForgetPwdSendSMS = @"/forgetpassword/sendsms";
/** 验证重置密码手机号 */
NSString *const kForgetPwdCheckMobile = @"/forgetpassword/checkmobile";
/** 重置密码 */
NSString *const kForgetPwdResetPassword = @"/forgetpassword/resetpassword";

/** 平台会员退出*/
NSString *const kExit = @"/exit";

#pragma mark - 客户管理
/** 客户列表*/
NSString *const kCustormerLists = @"/customer/lists";
/** 模糊搜索列表*/
NSString *const kCustomerSearch = @"/customer/customerajax";
/** 客户详情*/
NSString *const kCustormerDetail = @"/customer/detail";
/** 分配客户调用导购列表*/
NSString *const kCustormerSalers = @"/customer/salers";
/** 分配导购*/
NSString *const kCustormerAllot = @"/customer/allot";
/** 客户池列表*/
NSString *const kCustormerPool = @"/customer/pool";
/** 客户池模糊搜索列表*/
NSString *const kCustomerPoolSearch = @"/customer/poolcustomerajax";
/** 客户池获取导购列表*/
NSString *const kCustormerPoolsalers = @"/customer/poolsalers";
/** 客户池客户详细信息*/
NSString *const kCustormerPoolDetail = @"/customer/pooldetail";
/** 客户池分配导购*/
NSString *const kCustormerPoolallot = @"/customer/poolallot";
/** 客户池删除客户*/
NSString *const kCustormerPooldel = @"/customer/pooldel";
/** 客户分配记录*/
NSString *const kCustormerAssignedlog = @"/customer/assignedlog";

#pragma mark - 预约管理
/** 预约列表*/
NSString *const kReserveListByCustomerId = @"/reservation/getListByCustomerId";
/** 预约列表*/
NSString *const kReserveLists = @"/reservation/lists";
/** 预约详情*/
NSString *const kReserveDetail = @"/reservation/detail";
/** 预约详情-跟进记录*/
NSString *const kfollowLists = @"/follow/lists";

#pragma mark - 签单管理
/** 签单列表*/
NSString *const kOrderListByCustomerId = @"/order/getListByCustomerIdv110";
/** 签单列表*/
NSString *const kOrderLists = @"/order/listsv110";
/** 签单详情*/
NSString *const kOrderDetail = @"/order/detailv110";

#pragma mark - 货品列表
/** 货品列表*/
NSString *const kGoodsLists = @"/goods/lists";
#pragma mark - 优惠券
/** 优惠券列表 */
NSString *const kCouponList = @"/coupon/lists";
/** 添加优惠券 */
NSString *const kCouponCreate = @"/coupon/create";
/** 经销商门店列表 */
NSString *const kLineshop = @"/coupon/lineshop";
/** 提现审核列表 */
NSString *const kCouponRebate = @"/coupon/rebate";
/** 提现审核详情 */
NSString *const kCouponView = @"/coupon/view";
/** 提现审核操作 */
NSString *const kCouponDochecked = @"/coupon/dochecked";
/** 优惠券统计 */
NSString *const kCouponStatis = @"/coupon/statis";
/** 优惠首页接口 */
NSString *const kCouponHome = @"/coupon/home";

#pragma mark - 个人中心
/** 修改昵称 */
NSString *const kCenterChangeNickname = @"/user/editnickname";
/** 修改密码 */
NSString *const kCenterModifyPwd = @"/user/editpassword";
/** 发送旧手机验证码 */
NSString *const kModifyMobileSendOldSMS = @"/user/sendchecksms";
/** 验证旧手机 */
NSString *const kModifyMobileCheckOldMobile = @"/user/checkmobile";
/** 发送新手机验证码 */
NSString *const kModifyMobileSendNewSMS = @"/user/sendeditsms";
/** 修改手机号 */
NSString *const kModifyMobile = @"/user/editmobile";
/** 修改头像 */
NSString *const kModifyAvatar = @"/user/editavatar";
/** 修改保护期 */
NSString *const kModifyProtectTime = @"/user/editprotecttime";
/** 绑定微信账号 */
NSString *const kCenterBindweichat = @"/user/bindweachat";
/** 解绑微信账号 */
NSString *const kCenterUnbindWeichat = @"/user/unbindweachat";
/** 获取用户保护期 */
NSString *const kCenterGetProtectTime = @"/user/getProtectTime";
/** 修改店长是否能编辑保护期 */
NSString *const kCenterEditManagerEdit = @"/user/editManagerEdit";
/** 意见反馈 */
NSString *const kUserFeedback = @"/user/feedbacks";
/** 添加图片 */
NSString *const kUserFeedbackAddPic = @"/user/addpic";

/** 获取用户资料 */
NSString *const kUserProfile = @"/user/profile";
/** IM权重平均分配修改 */
NSString *const kUserSetImAverage = @"/user/setimaverage";
/** IM权重修改 */
NSString *const kUserSetImSetting = @"/user/setimsetting";
/** IM权重信息读取 */
NSString *const kUserGetImSetting = @"/user/getimsetting";
#pragma mark - 消息管理

/** 消息列表 */
NSString *const kMessageLists = @"/message/lists";

@end
