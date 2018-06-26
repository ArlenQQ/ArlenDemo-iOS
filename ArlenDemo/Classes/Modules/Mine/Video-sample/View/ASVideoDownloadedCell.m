//
//  ASVideoDownloadedCell.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASVideoDownloadedCell.h"



@interface ASVideoDownloadedCell()

@property (weak, nonatomic) IBOutlet UILabel *fileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fileSizeLabel;
@end

@implementation ASVideoDownloadedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setFileInfo:(MJDownloadInfo *)fileInfo {
    _fileInfo = fileInfo;
    self.fileNameLabel.text = fileInfo.file;
    self.fileSizeLabel.text = [NSString stringWithFormat:@"%.2lf MB", fileInfo.totalBytesExpectedToWrite / 1024.0 / 1024.0];
}

@end
