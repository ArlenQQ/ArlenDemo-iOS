//
//  ASVideoCollectionCell.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASVideoCollectionCell.h"
#import "ASVideo.h"


typedef void(^ASPlayHandler)(ASVideoCollectionCell *cell);

@interface ASVideoCollectionCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (nonatomic,copy) ASPlayHandler playBlock;

@end

@implementation ASVideoCollectionCell


-(void)awakeFromNib{
    [super awakeFromNib];
    [_bgImageView setContentMode:(UIViewContentModeScaleAspectFill)];
}

-(void)setModel:(ASVideo *)model{
    self.titleLable.text = ASIsEmpty(model.title)? @"无标题" : model.title;
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_url]];
    
}

- (IBAction)playAction:(UIButton *)sender {
    if (self.playBlock) {
        self.playBlock(self);
    }
}

-(void)setPlayHandler:(void (^)(ASVideoCollectionCell *))handler{
    self.playBlock = handler;
}

-(NSInteger) getImageViewTag{
    return 1990;
}

@end
