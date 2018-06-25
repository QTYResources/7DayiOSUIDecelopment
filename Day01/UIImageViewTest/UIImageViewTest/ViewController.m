//
//  ViewController.m
//  UIImageViewTest
//
//  Created by QinTuanye on 2018/6/25.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    // 设置UIImageView显示的图片
//    imageView.image = [UIImage imageNamed:@"灯泡"];
    // 设置UIImageView为高亮状态
//    imageView.highlighted = YES;
    // 将UIImageView控件添加在视图上
    
    // 设置初始图片
    imageView.image = [UIImage imageNamed:@"跳-1-0"];
    // 创建并初始化一个可变数组，用于存放每一帧图片
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    // 循环向数组中添加图片帧
    for (int i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"跳-1-%d", i]];
        [imageArray addObject:image];
    }
    // 将图片帧数组设置为ImageView的帧动画素材数组
    imageView.animationImages = imageArray;
    // 设置动画每播放一轮的时间
    imageView.animationDuration = 1;
    // 设置动画播放的循环次数
    imageView.animationRepeatCount = 0;
    // 开始播放动画
    [imageView startAnimating];
    
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
