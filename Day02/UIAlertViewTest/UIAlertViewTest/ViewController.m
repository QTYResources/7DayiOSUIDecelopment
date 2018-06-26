//
//  ViewController.m
//  UIAlertViewTest
//
//  Created by QinTuanye on 2018/6/26.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 常见警告框控件
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告标题" message:@"警告内容" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    // 设置警告框风格
    alert.alertViewStyle = UIAlertViewStyleDefault;
    // 弹出警告框
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现UIAlertViewDelegate协议方法
#pragma mark -- 实现UIAlertViewDelegate协议方法
// 点击按钮后系统调用的方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
}

// 警告框将要消失时调用的方法
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
}

// 警告框已经消失时调用的方法
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
}
@end
