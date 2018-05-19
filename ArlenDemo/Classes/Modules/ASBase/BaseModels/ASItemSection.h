//
//  ASItemSection.h
//  GoMeYWLC
//
//  Created by Arlen.S on 2016/10/21.
//  Copyright © 2016年 Arlen.S. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASWordItem;
@interface ASItemSection : NSObject

/** <#digest#> */
@property (nonatomic, copy) NSString *headerTitle;

/** <#digest#> */
@property (nonatomic, copy) NSString *footerTitle;

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray<ASWordItem *> *items;

+ (instancetype)sectionWithItems:(NSArray<ASWordItem *> *)items andHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle;

@end
