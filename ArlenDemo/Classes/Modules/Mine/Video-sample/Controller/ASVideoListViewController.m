//
//  ASVideoListViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/11.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASVideoListViewController.h"
#import "ASVideoNormalViewController.h"

@interface ASVideoListViewController ()

/** 网络视频 */
@property (nonatomic, strong) NSMutableArray<NSString *> *videoUrls;
@end

@implementation ASVideoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoUrls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *videoListCell = [tableView dequeueReusableCellWithIdentifier:@"videoListCell"];
    videoListCell.textLabel.text = self.videoUrls[indexPath.row].lastPathComponent;
    videoListCell.detailTextLabel.text = self.videoUrls[indexPath.row];
    return videoListCell;
}
#pragma mark UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *url = self.videoUrls[indexPath.row];
    ASVideoNormalViewController *moviePlayerVc = [[ASVideoNormalViewController alloc] init];
    moviePlayerVc.videoURL = url;
    [self.navigationController pushViewController:moviePlayerVc animated:YES];
}

- (void)requestData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *videoList = [rootDict objectForKey:@"list"];
    self.videoUrls = [[NSMutableArray alloc] initWithCapacity:videoList.count];
    for (NSDictionary *dataDic in videoList) {
        NSString *url = [dataDic valueForKey:@"video_url"];
        NSString *URLString = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        [self.videoUrls addObject:URLString];
    }
}

@end
