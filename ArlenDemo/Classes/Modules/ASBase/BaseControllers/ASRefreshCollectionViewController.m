//
//  ASRefreshCollectionViewController.m
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/11.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASRefreshCollectionViewController.h"

@interface ASRefreshCollectionViewController ()

@end

@implementation ASRefreshCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @WeakObj(self);
    self.collectionView.mj_header = [ASNormalRefreshHeader headerWithRefreshingBlock:^{
        [selfWeak loadIsMore:NO];
    }];
    
    self.collectionView.mj_footer = [ASAutoRefreshFooter footerWithRefreshingBlock:^{
        [selfWeak loadIsMore:YES];
    }];
    
    [self.collectionView.mj_header beginRefreshing];
}


// 内部方法
- (void)loadIsMore:(BOOL)isMore
{
    // 控制只能下拉或者上拉
    if (isMore) {
        if ([self.collectionView.mj_header isRefreshing]) {
            [self.collectionView.mj_footer endRefreshing];
            return;
        }
        self.collectionView.mj_header.hidden = YES;
        self.collectionView.mj_footer.hidden = NO;
    }else
    {
        if ([self.collectionView.mj_footer isRefreshing]) {
            [self.collectionView.mj_header endRefreshing];
            return;
        }
        self.collectionView.mj_header.hidden = NO;
        self.collectionView.mj_footer.hidden = YES;
    }
    [self loadMore:isMore];
}

// 结束刷新
- (void)endHeaderFooterRefreshing
{
    // 结束刷新状态
    ![self.collectionView.mj_header isRefreshing] ?: [self.collectionView.mj_header endRefreshing];
    ![self.collectionView.mj_footer isRefreshing] ?: [self.collectionView.mj_footer endRefreshing];
    self.collectionView.mj_header.hidden = NO;
    self.collectionView.mj_footer.hidden = NO;
}


// 子类需要调用调用
- (void)loadMore:(BOOL)isMore
{
    //        NSAssert(0, @"子类必须重载%s", __FUNCTION__);
}


@end
