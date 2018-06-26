//
//  ASMessageViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASMessageViewController.h"
#import "ASNSThreadViewController.h"
#import "ASGCDViewController.h"
#import "ASNSOperationViewController.h"
#import "ASLockViewController.h"

@interface ASMessageViewController ()

@end

@implementation ASMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.bottom += self.tabBarController.tabBar.as_height;
    self.tableView.contentInset = edgeInsets;
    ASWordArrowItem *item00 = [ASWordArrowItem itemWithTitle:@"Thread 多线程" subTitle:nil];
    item00.destVc = [ASNSThreadViewController class];
    ASWordArrowItem *item01 = [ASWordArrowItem itemWithTitle:@"GCD 多线程" subTitle:nil];
    item01.destVc = [ASGCDViewController class];
    ASWordArrowItem *item02 = [ASWordArrowItem itemWithTitle:@"NSOperation 多线程" subTitle:nil];
    item02.destVc = [ASNSOperationViewController class];
    ASWordArrowItem *item03 = [ASWordArrowItem itemWithTitle:@"同步锁知识" subTitle:@"NSLock @synchronized"];
    item03.destVc = [ASLockViewController class];
    
    ASItemSection *section0 = [ASItemSection sectionWithItems:@[item00,item01,item02,item03] andHeaderTitle:@"多线程" footerTitle:nil];
    [self.sections addObject:section0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableAttributedString *)asNavigationBarTitle:(ASNavigationBar *)navigationBar{
    
    return [self changeTitle:@"基础功能"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
