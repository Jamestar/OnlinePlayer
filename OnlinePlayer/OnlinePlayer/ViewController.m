//
//  ViewController.m
//  OnlinePlayer
//
//  Created by vochi on 2017/1/5.
//  Copyright © 2017年 vochi. All rights reserved.
//

#import "ViewController.h"
#import "MyPlayTool.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *playBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playBtn.frame = CGRectMake(20, 64, 100, 50);
    self.playBtn.layer.cornerRadius = 5.0f;
    [self.playBtn setBackgroundColor:[UIColor redColor]];
    [self.playBtn setTitle:@"播放" forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(playBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playBtn];
    
    //播放本地音乐
    //    [[MyPlayTool sharePlayTool] loadLocalMusicUsePath:[[NSBundle mainBundle] pathForResource:@"小苹果.mp3" ofType:nil]];
    
    //播放网络音乐
    //    [[MyPlayTool sharePlayTool] loadNetworkMusicUseUrlStr:@"https://www.gzxct2016.cn/UploadFile/636073152117978423.mp3"];
    
    //播放网络视频
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    videoView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:videoView];
    
    [[MyPlayTool sharePlayTool] loadNetworkVideoUseUrlStr:@"https://www.gzxct2016.cn/UploadFile/45a46984-7230-46d7-90cb-254560378ef4.mp4"];
    [videoView.layer addSublayer:[MyPlayTool sharePlayTool].playerLayer];
    
}

- (void)playBtnClick
{
    if (self.playBtn.isSelected == YES) {
        [self.playBtn setTitle:@"播放" forState:UIControlStateNormal];
        self.playBtn.selected = NO;
        
        //开始播放
        [[MyPlayTool sharePlayTool] pause];
    }
    else
    {
        [self.playBtn setTitle:@"暂停" forState:UIControlStateNormal];
        self.playBtn.selected = YES;
        
        //开始播放
        [[MyPlayTool sharePlayTool] play];
    }
}

@end
