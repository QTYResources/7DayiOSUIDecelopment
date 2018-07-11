//
//  ViewController.m
//  CAGradientLayerTest
//
//  Created by QinTuanye on 2018/7/11.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化CAGradientLayer对象
    // CAGradientLayer类是继承于CALayer类的子类，其专门用来创建颜色梯度渐变的视图效果。
    CAGradientLayer *layer = [CAGradientLayer layer];
    // 设置梯度颜色数组
    layer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor];
    // 设置尺寸
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // 设置位置
    layer.position = CGPointMake(100, 100);
    // 设置颜色梯度分界
    layer.locations = @[@0.2];
    // 设置颜色梯度起始点
    layer.startPoint = CGPointMake(0, 0);
    // 设置颜色梯度终止点
    layer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
