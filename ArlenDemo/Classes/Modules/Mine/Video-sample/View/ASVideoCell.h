//
//  ASVideoCell.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASVideo;
@class ASVideoCell;
typedef void(^ASPlayBlock)(ASVideoCell *cell);

@interface ASVideoCell : UITableViewCell


-(void) setModel:(ASVideo *) model;

-(void) setPlayHandler:(ASPlayBlock) handler;

-(NSInteger) getImageViewTag;
@end
