//
//  ViewController.m
//  CATextLayerTest
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
    // CATextLayer用于进行视图上文本的绘制，UIKit框架中最基础的UILabel控件就是基于CATextLayer而实现的。
    // CALayer家族中还有一个十分强大的类--CAEmitterLayer，其专门用来处理一些粒子效果生成的动画。
    // 创建CATextLayer对象
    CATextLayer *layer = [CATextLayer layer];
    // 设置尺寸
    layer.bounds = CGRectMake(0, 0, 320, 100);
    // 设置位置
    layer.position = CGPointMake(160, 100);
    // 设置文本
    layer.string = @"我是文字Layer";
    // 设置文本大小
    layer.fontSize = 25;
    // 设置文字颜色
    layer.foregroundColor = [UIColor redColor].CGColor;
    // 设置文字对齐方式
    layer.alignmentMode = kCAAlignmentCenter;
    // 显示图层
    [self.view.layer addSublayer:layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
