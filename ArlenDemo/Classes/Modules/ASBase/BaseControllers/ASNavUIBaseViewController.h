//
//  ASBaseViewController.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/3/29.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASNavigationBar.h"
#import "ASNavigationController.h"

@class ASNavUIBaseViewController;
@protocol ASNavUIBaseViewControllerDataSource <NSObject>

@optional
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(ASNavUIBaseViewController *)navUIBaseViewController;
@end

@interface ASNavUIBaseViewController : UIViewController <ASNavigationBarDelegate, ASNavigationBarDataSource, ASNavUIBaseViewControllerDataSource>
/*默认的导航栏字体*/
- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle;
/**  */
@property (weak, nonatomic) ASNavigationBar *as_navgationBar;
@end
