//
//  ASRequestBaseViewController.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/24.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASTextViewController.h"
#import <Reachability.h>

@class ASRequestBaseViewController;
@protocol ASRequestBaseViewControllerDelegate <NSObject>

@optional
#pragma mark - 网络监听
/*
 NotReachable = 0,
 ReachableViaWiFi = 2,
 ReachableViaWWAN = 1,
 ReachableVia2G = 3,
 ReachableVia3G = 4,
 ReachableVia4G = 5,
 */
- (void)networkStatus:(NetworkStatus)networkStatus inViewController:(ASRequestBaseViewController *)inViewController;

@end



@interface ASRequestBaseViewController : ASTextViewController<ASRequestBaseViewControllerDelegate>
#pragma mark - 加载框

- (void)showLoading;

- (void)dismissLoading;

@end
