//
//  ASVideoTableViewViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASVideoTableViewViewController.h"
#import <ZFPlayer.h>
#import "ASVideo.h"
#import "ASVideoCell.h"
#import "ASVideoCachesTool.h"

@interface ASVideoTableViewViewController ()<ZFPlayerDelegate>

/**网络数据*/
@property (nonatomic, strong) NSMutableArray<ASVideo *> *videos;
/** 单利播放 */
@property (nonatomic, strong) ZFPlayerView *playerView;

@end

@implementation ASVideoTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    // 这里设置横竖屏不同颜色的statusbar
    if (ZFPlayerShared.isLandscape) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return ZFPlayerShared.isStatusBarHidden;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ASVideoCell *tableViewVideoCell = [tableView dequeueReusableCellWithIdentifier:@"tableViewVideoCell"];
    
    [tableViewVideoCell setModel:self.videos[indexPath.row]];
    @WeakObj(self)
    [tableViewVideoCell setPlayHandler:^(ASVideoCell *cell) {
        [selfWeak cellPlayClick:cell];
    }];
    
    return tableViewVideoCell;
}

- (void)cellPlayClick:(ASVideoCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    ASVideo *video = self.videos[indexPath.row];
    
    // 分辨率字典（key:分辨率名称，value：分辨率url)
    NSString *url = [video.video_url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSDictionary *dic = @{ @"高清": url, @"标清": url};
    // 取出字典中的第一视频URL
    NSURL *videoURL = [NSURL URLWithString:dic.allValues.firstObject];
    
    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc] init];
    playerModel.title            = video.title;
    playerModel.videoURL         = videoURL;
    playerModel.placeholderImageURLString = [video.thumbnail_url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    playerModel.scrollView       = self.tableView;
    playerModel.indexPath        = indexPath;
    // 赋值分辨率字典
    playerModel.resolutionDic    = dic;
    // player的父视图tag, imageView 199
    playerModel.fatherViewTag    = [cell getImageViewTag];
    
    // 设置播放控制层和model
    [self.playerView playerControlView:nil playerModel:playerModel];
    // 下载功能
    self.playerView.hasDownload = YES;
    // 自动播放
    [self.playerView autoPlayTheVideo];
}

// 页面消失时候
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.playerView resetPlayer];
}

#pragma mark - ZFPlayerDelegate
- (void)zf_playerDownload:(NSString *)url {
    // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
    [[ASVideoCachesTool sharedTool] downLoad:url];
}

- (ZFPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [ZFPlayerView sharedPlayerView];
        _playerView.delegate = self;
        // 当cell播放视频由全屏变为小屏时候，不回到中间位置
        _playerView.cellPlayerOnCenter = NO;
        
        // 当cell划出屏幕的时候停止播放
        // _playerView.stopPlayWhileCellNotVisable = YES;
        //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
        // _playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
        // 静音
        // _playerView.mute = YES;
        // 移除屏幕移除player
        // _playerView.stopPlayWhileCellNotVisable = YES;
        
        _playerView.forcePortrait = NO;
        
        //        ZFPlayerShared.isLockScreen = YES;
        ZFPlayerShared.isStatusBarHidden = NO;
    }
    return _playerView;
}

- (void)requestData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *videoList = [rootDict objectForKey:@"list"];
    self.videos = [[NSMutableArray alloc] initWithCapacity:videoList.count];
    for (NSDictionary *dataDic in videoList) {
        ASVideo *video = [ASVideo mj_objectWithKeyValues:dataDic];
        [self.videos addObject:video];
    }
}

@end
