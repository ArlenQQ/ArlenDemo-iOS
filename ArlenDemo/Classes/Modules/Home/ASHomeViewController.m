//
//  ASHomeViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASHomeViewController.h"
#import "ASElementsCollectionViewController.h"
#import "ASVerticalLayoutViewController.h"
#import "ASHorizontalLayoutViewController.h"
#import "ASCuteFlowLayoutViewController.h"

@interface ASHomeViewController ()

@end

@implementation ASHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *homeItem = self.navigationController.tabBarItem;
    [homeItem setBadgeValue:@"3"];
    /** UICollectionView 简单应用 */
    ASWordArrowItem *item100 = [ASWordArrowItem itemWithTitle:@"App首页 CollectionView 常用布局" subTitle: @""];
    
    item100.destVc = [ASElementsCollectionViewController class];
    
    ASWordArrowItem *item101 = [ASWordArrowItem itemWithTitle:@"CollectionView - 垂直流水布局" subTitle: nil];

    item101.destVc = [ASVerticalLayoutViewController class];

    ASWordArrowItem *item102 = [ASWordArrowItem itemWithTitle:@"CollectionView - 水平流水布局" subTitle: nil];

    item102.destVc = [ASHorizontalLayoutViewController class];

    ASWordArrowItem *item103 = [ASWordArrowItem itemWithTitle:@"三种CollectionViewLayout布局" subTitle: @"Cute"];
    item103.destVc = [ASCuteFlowLayoutViewController class];
    
    ASItemSection *section0 = [ASItemSection sectionWithItems:@[item100,item101,item102,item103] andHeaderTitle:@"UICollectionView 应用" footerTitle:@""];
    [self.sections addObject:section0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableAttributedString *)asNavigationBarTitle:(ASNavigationBar *)navigationBar{
    
    return [self changeTitle:@"UI控件"];
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
