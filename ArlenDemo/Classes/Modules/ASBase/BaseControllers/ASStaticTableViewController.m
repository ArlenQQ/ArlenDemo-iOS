//
//  ASBaseSettingViewController.m
//  NetLottery
//
//  Created by apple on 16/6/23.
//  Copyright © 2016年 163. All rights reserved.
//

#import "ASStaticTableViewController.h"
#import "ASSettingCell.h"

const UIEdgeInsets tableViewDefaultSeparatorInset = {0, 15, 0, 0};
const UIEdgeInsets tableViewDefaultLayoutMargins = {8, 8, 8, 8};

@interface ASStaticTableViewController ()

@end

@implementation ASStaticTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"self.tableView.separatorInset = %@, self.tableView.separatorInset = %@", NSStringFromUIEdgeInsets(self.tableView.separatorInset), NSStringFromUIEdgeInsets(self.tableView.layoutMargins));
    //    self.tableView.separatorInset = UIEdgeInsetsZero;
    //    self.tableView.layoutMargins = UIEdgeInsetsZero;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections[section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASWordItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    
    ASSettingCell *cell = [ASSettingCell cellWithTableView:tableView andCellStyle:UITableViewCellStyleValue1];
    
    cell.item = item;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ASWordItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    // 普通的cell
    if(item.itemOperation)
    {
        item.itemOperation(indexPath);
        return;
    }
    
    // 带箭头的cell
    if([item isKindOfClass:[ASWordArrowItem class]])
    {
        ASWordArrowItem *arrowItem = (ASWordArrowItem *)item;
        
        if(arrowItem.destVc)
        {
            UIViewController *vc = [[arrowItem.destVc alloc] init];
            if ([vc isKindOfClass:[UIViewController class]]) {
                vc.navigationItem.title = arrowItem.title;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    }
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sections[section].headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return self.sections[section].footerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.sections[indexPath.section].items[indexPath.row].cellHeight;
}

- (NSMutableArray<ASItemSection *> *)sections
{
    if(_sections == nil)
    {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

- (ASStaticTableViewController *(^)(ASWordItem *))addItem {
    
    @WeakObj(self);
    if (!self.sections.firstObject) {
        [self.sections addObject:[ASItemSection sectionWithItems:@[] andHeaderTitle:nil footerTitle:nil]];
    }
    return  ^(ASWordItem *item) {
        [selfWeak.sections.firstObject.items addObject:item];
        return selfWeak;
    };
}

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


@end
