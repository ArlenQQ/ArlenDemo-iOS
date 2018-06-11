//
//  ASVideoCachesTool.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJDownload.h"

@interface ASVideoCachesTool : NSObject

@property (nonatomic, strong) MJDownloadManager *downloadManager;

+ (instancetype)sharedTool;


// 缓存url
- (void)downLoad:(NSString *)url;

// 缓存url
- (void)deleteFile:(NSString *)url;

@end
