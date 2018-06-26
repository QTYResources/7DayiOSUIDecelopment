//
//  ViewController.m
//  UIActivityIndicatorViewTest
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
    self.view.backgroundColor = [UIColor redColor];
    
    // 创建活动指示器对象
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    // 设置活动指示器的中心位置
    activityView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    // 如果不调用活动指示器的startAnimatng方法，则活动指示器不仅不能旋转，也不会展现在视图上。系统的UIActivityIndicatorView控件默认在停止动画的时候自动隐藏，可以通过如下设置使指示器控件不进行自动隐藏
    activityView.hidesWhenStopped = NO;
    // 将活动指示器添加到视图上
    [self.view addSubview:activityView];
    // 开启活动指示器动画
    [activityView startAnimating];
    // 停止活动指示器动画
    [activityView stopAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
