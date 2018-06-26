//
//  ASVideoCell.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASVideoCell.h"
#import "ASVideo.h"

@interface ASVideoCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *bgimageView;
@property (nonatomic,copy) ASPlayBlock playBlock;
@end


@implementation ASVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_bgimageView setTag:1990];
    [_bgimageView setContentMode:(UIViewContentModeScaleAspectFill)];
    _bgimageView.layer.masksToBounds = true;
}

-(void)setModel:(ASVideo *)model{
    self.titleLable.text = ASIsEmpty(model.title)? @"无标题" : model.title;
    [self.bgimageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnail_url]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)playAction:(UIButton *)sender {
    if (self.playBlock) {
        self.playBlock(self);
    }
}

-(void)setPlayHandler:(ASPlayBlock)handler{
    _playBlock = handler;
}

-(NSInteger) getImageViewTag{
    return 1990;
}


@end
