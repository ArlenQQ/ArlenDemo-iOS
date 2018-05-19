//
//  ASSettingCell.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/11.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASWordItem;

@interface ASSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andCellStyle:(UITableViewCellStyle)style;

/** 静态单元格模型 */
@property (nonatomic, strong)  ASWordItem *item;

@end
