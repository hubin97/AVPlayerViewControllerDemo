//
//  ViewController.m
//  AVPlayerViewControllerDemo
//
//  Created by Mac on 2016/12/6.
//  Copyright © 2016年 TUTK. All rights reserved.
//



/**
 AVPlayerViewController 基础用法
 */

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()
{
    AVPlayer *_player;   //AVFoundation
    AVPlayerViewController *_playerVc; //AVKit
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#define localVideoPlay

    //!!!!:注意 NSURL的方法,本地与网络路径会有不同
#ifdef  localVideoPlay
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ATS-TEST" ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:path];
#else
    //如果地址为http,必要时请配置info.plist的ATS再次验证
    NSString *path = @"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    //视频的网络路径
    NSURL *url = [NSURL URLWithString:path];
#endif
    
    //初始化AVPlayer
    _player = [[AVPlayer alloc]initWithURL:url];
    
    //初始化AVPlayerViewController
    _playerVc = [[AVPlayerViewController alloc]init];
    
    //绘制frame
    _playerVc.view.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 250);
    
    //添加视图到当前控制器
    [self.view addSubview: _playerVc.view];
    
    //======
    //设置AVPlayerViewController的填充模式
    _playerVc.videoGravity = AVLayerVideoGravityResizeAspect;
    
    //关闭AVPlayerViewController内部的约束
    _playerVc.view.translatesAutoresizingMaskIntoConstraints = YES;
    //======
    
    
    //设置播放器
    _playerVc.player = _player;
    
    //开始播放
    [_playerVc.player play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
