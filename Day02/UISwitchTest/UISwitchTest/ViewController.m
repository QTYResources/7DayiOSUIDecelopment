//
//  ViewController.m
//  UISwitchTest
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
    
    // 创建UISwitch控件
    UISwitch *swi = [[UISwitch alloc]init];
    // 设置中心位置，UISwitch控件有特定的UI样式，因此开发者不需要设置其大小尺寸，只需设置它的位置即可。
    swi.center = CGPointMake(100, 100);
    // 设置开启状态的颜色
    swi.onTintColor = [UIColor greenColor];
    // 设置正常状态的颜色
    swi.tintColor = [UIColor redColor];
    // 设置滑块的颜色
    swi.thumbTintColor = [UIColor orangeColor];
    // 设置触发方法
    [swi addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:swi];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现触发方法
- (void)change:(UISwitch *)swi {
    NSLog(@"%d", swi.on);
}
@end
