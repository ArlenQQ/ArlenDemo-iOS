//
//  ASVideoCachesTool.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASVideoCachesTool.h"

static NSString *const ASVideoCachesToolId = @"ASVideoCachesToolId";

@interface ASVideoCachesTool ()
{
    NSMutableArray<NSString *> *_cachesUrls;
}
@end

@implementation ASVideoCachesTool


- (void)downLoad:(NSString *)url {
    [_cachesUrls addObject:url.copy];
    [self.downloadManager download:url];
    [_cachesUrls writeToFile:self.filePath atomically:YES];
}

- (void)deleteFile:(NSString *)url {
    [_cachesUrls enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:url]) {
            [self->_cachesUrls removeObject:obj];
        }
    }];
    
    [self.downloadManager.downloadInfoArray removeObject:[self.downloadManager downloadInfoForURL:url]];
    [_cachesUrls writeToFile:self.filePath atomically:YES];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _cachesUrls = [NSMutableArray arrayWithContentsOfFile:self.filePath];
        
        if (!_cachesUrls) {
            [[NSFileManager defaultManager] createDirectoryAtPath:[self.filePath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
            _cachesUrls = [NSMutableArray array];
            // 写入文件
            [_cachesUrls writeToFile:self.filePath atomically:YES];
        }
        
        [_cachesUrls enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.downloadManager downloadInfoForURL:obj];
        }];
    }
    return self;
}

- (NSString *)filePath
{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"videoDownload/downloadData.plist"];
    return filePath;
}


#pragma mark - getter
+ (instancetype)sharedTool {
    static ASVideoCachesTool *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (MJDownloadManager *)downloadManager
{
    if(!_downloadManager)
    {
        _downloadManager = [MJDownloadManager managerWithIdentifier:ASVideoCachesToolId];
    }
    return _downloadManager;
}

@end
