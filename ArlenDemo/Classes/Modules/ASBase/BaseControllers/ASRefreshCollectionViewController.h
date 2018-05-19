//
//  ASRefreshCollectionViewController.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/11.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASCollectionViewController.h"
#import "ASAutoRefreshFooter.h"
#import "ASNormalRefreshHeader.h"

@interface ASRefreshCollectionViewController : ASCollectionViewController

- (void)loadMore:(BOOL)isMore;

// 结束刷新, 子类请求报文完毕调用
- (void)endHeaderFooterRefreshing;

@end
