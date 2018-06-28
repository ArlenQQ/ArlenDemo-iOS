//
//  ASMineViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASMineViewController.h"
#import "ASChartHomeViewController.h"

@interface ASMineViewController ()

@end

@implementation ASMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    ASWordItem *item00 = [ASWordItem itemWithTitle:@"列表视频" subTitle: @"Video"];
    @WeakObj(self);
    [item00 setItemOperation:^(NSIndexPath *indexPath){
        [selfWeak presentViewController:[[UIStoryboard storyboardWithName:@"Video" bundle:[NSBundle mainBundle]] instantiateInitialViewController] animated:YES completion:nil];
    }];
    
    ASWordArrowItem *item01 = [ASWordArrowItem itemWithTitle:@"数据统计-图表📈" subTitle:@"AAChartKit"];
    item01.destVc = [ASChartHomeViewController class];
    
    
    ASItemSection *section0 = [ASItemSection sectionWithItems:@[item00,item01] andHeaderTitle:nil footerTitle:nil];
    
    [self.sections addObject:section0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSMutableAttributedString *)asNavigationBarTitle:(ASNavigationBar *)navigationBar{
    
    return [self changeTitle:@"第三方功能整合演示"];
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
