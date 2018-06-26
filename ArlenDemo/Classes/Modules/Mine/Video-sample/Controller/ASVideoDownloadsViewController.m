//
//  ASVideoDownloadsViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASVideoDownloadsViewController.h"
#import "ASVideoCachesTool.h"
#import "ASVideoDownLoadedCell.h"
#import "ASVideoDownLoadingCell.h"
#import "ASVideoNormalViewController.h"

@interface ASVideoDownloadsViewController ()

@end

@implementation ASVideoDownloadsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    /** 下载进度发生改变的通知 */
    //    extern NSString * const MJDownloadProgressDidChangeNotification;
    //    /** 下载状态发生改变的通知 */
    //    extern NSString * const MJDownloadStateDidChangeNotification;
    //    /** 利用这个key从通知中取出对应的MJDownloadInfo对象 */
    //    extern NSString * const MJDownloadInfoKey;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MJDownloadProgressDidChange:) name:MJDownloadProgressDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MJDownloadStateDidChange:) name:MJDownloadStateDidChangeNotification object:nil];
}

- (void)MJDownloadProgressDidChange:(NSNotification *)noti {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray<ASVideoDownloadingCell *>  *VIDDownLoadingCells = self.tableView.visibleCells;
        MJDownloadInfo *fileInfo = noti.userInfo[MJDownloadInfoKey];
        
        [VIDDownLoadingCells enumerateObjectsUsingBlock:^(ASVideoDownloadingCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[ASVideoDownloadingCell class]]) {
                if ([obj.fileInfo.url isEqualToString:fileInfo.url]) {
                    obj.fileInfo = fileInfo;
                }
            }
        }];
    });
}

- (void)MJDownloadStateDidChange:(NSNotification *)noti {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (!ASVideoCachesTool.sharedTool.downloadManager.downloadInfoArray.count) {
        return 0;
    }
    
    if (section == 0) {
        return [ASVideoCachesTool.sharedTool.downloadManager.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state!=%d", MJDownloadStateCompleted]].count;
    }else {
        return [ASVideoCachesTool.sharedTool.downloadManager.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state==%d", MJDownloadStateCompleted]].count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"下载中";
    }else {
        return @"已下载";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const downLoading = @"ASVideoDownloadingCell";
    static NSString *const downLoaded = @"ASVideoDownloadedCell";
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:downLoading];
        ASVideoDownloadingCell *downloadingCell = (ASVideoDownloadingCell *)cell;
        NSArray<MJDownloadInfo *> *infos = [ASVideoCachesTool.sharedTool.downloadManager.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state!=%d", MJDownloadStateCompleted]];
        downloadingCell.fileInfo = infos[indexPath.row];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:downLoaded];
        ASVideoDownloadedCell *downloadedCell = (ASVideoDownloadedCell *)cell;
        NSArray<MJDownloadInfo *> *infos = [ASVideoCachesTool.sharedTool.downloadManager.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state==%d", MJDownloadStateCompleted]];
        downloadedCell.fileInfo = infos[indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }else {
        return 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        return;
    }
    
    NSArray<MJDownloadInfo *> *infos = [ASVideoCachesTool.sharedTool.downloadManager.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state==%d", MJDownloadStateCompleted]];
    MJDownloadInfo *info = infos[indexPath.row];
    ASVideoNormalViewController *playerVc = [[ASVideoNormalViewController alloc] init];
    playerVc.videoURL = [NSString stringWithFormat:@"file://%@", info.file];
    [self.navigationController pushViewController:playerVc animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return YES;
    }else {
        return NO;
    }
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    @WeakObj(self);
    UITableViewRowAction *removeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSArray<MJDownloadInfo *> *infos = [ASVideoCachesTool.sharedTool.downloadManager.downloadInfoArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"state==%d", MJDownloadStateCompleted]];
        [ASVideoCachesTool.sharedTool deleteFile:infos[indexPath.row].url];
        
        [selfWeak.tableView deleteRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationLeft];
    }];
    
    return @[removeAction];
}


@end
