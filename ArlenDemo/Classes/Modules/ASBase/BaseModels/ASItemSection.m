//
//  ASItemSection.m
//  GoMeYWLC
//
//  Created by Arlen.S on 2016/10/21.
//  Copyright © 2016年 Arlen.S. All rights reserved.
//

#import "ASItemSection.h"


@implementation ASItemSection

+ (instancetype)sectionWithItems:(NSArray<ASWordItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle
{
    ASItemSection *item = [[self alloc] init];
    if (items.count) {
        [item.items addObjectsFromArray:items];
    }
    
    item.headerTitle = headerTitle;
    item.footerTitle = footerTitle;
    
    return item;
}

- (NSMutableArray<ASWordItem *> *)items
{
    if(!_items)
    {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
