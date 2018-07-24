//
//  ViewController.m
//  MPMoviePlayerViewControllerTest
//
//  Created by QinTuanye on 2018/7/24.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playMovie:(id)sender {
    // 使用MPMoviePlayerViewController需要导入#import <MediaPlayer/MediaPlayer.h>头文件
    // 初始化视频文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"iphone" ofType:@"mp4"];
    // 创建视频文件URL对象
    NSURL *url = [NSURL fileURLWithPath:path];
    // 初始化MPMoviePalyerViewController视图控件
    MPMoviePlayerViewController *controller = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    // 播放视频，视频会自动播放
    [self presentMoviePlayerViewControllerAnimated:controller];
}

@end
