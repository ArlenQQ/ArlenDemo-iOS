//
//  ASLineFlowLayout.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/29.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASLineFlowLayout;

@protocol ASLineFlowLayoutDelegate <NSObject>
@optional

@end

@interface ASLineFlowLayout : UICollectionViewFlowLayout


- (instancetype)initWithDelegate:(id<ASLineFlowLayoutDelegate>)delegate;

+ (instancetype)lineLayoutWithDelegate:(id<ASLineFlowLayoutDelegate>)delegate;
@end
