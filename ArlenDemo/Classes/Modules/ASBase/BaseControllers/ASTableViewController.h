//
//  ASTableViewController.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/11.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASBaseViewController.h"

@interface ASTableViewController : ASBaseViewController<UITableViewDelegate, UITableViewDataSource>

// 这个代理方法如果子类实现了, 必须调用super
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

/** <#digest#> */
@property (weak, nonatomic) IBOutlet UITableView *tableView;

// tableview的样式, 默认plain
- (instancetype)initWithStyle:(UITableViewStyle)style;
@end
