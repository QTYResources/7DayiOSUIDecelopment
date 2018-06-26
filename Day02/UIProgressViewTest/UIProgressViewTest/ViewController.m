//
//  ViewController.m
//  UIProgressViewTest
//
//  Created by QinTuanye on 2018/6/26.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建进度条控件
    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(20, 100, 280, 20)];
    // 设置已走过的进度条的颜色
    progressView.progressTintColor = [UIColor redColor];
    // 设置未走过的进度条的颜色
    progressView.trackTintColor = [UIColor greenColor];
    // 设置已走过的进度条的图片
//    progressView.progressImage = [UIImage imageNamed:@"imageName"];
    // 设置未走过的进度条的图片
//    progressView.trackImage = [UIImage imageNamed:@"imageName"];
    // 设置进度条已走过的进度值
    progressView.progress = 0.5;
    [self.view addSubview:progressView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
