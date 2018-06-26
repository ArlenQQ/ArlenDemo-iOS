//
//  ASVideoCollectionCell.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASVideo;

@interface ASVideoCollectionCell : UICollectionViewCell

-(void) setModel:(ASVideo *) model;

-(void) setPlayHandler:(void(^)(ASVideoCollectionCell *cell)) handler;
-(NSInteger) getImageViewTag;
@end
