//
//  ViewController.m
//  CAReplicatorLayerTest
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
    // CARepliccatorLayer类可以理解为一个Layer层， 其作用并非进行具体某一个CALayer对象UI的展现，而是复制一个已存在的CALayer对象进行备份渲染
    // 创建一个普通layer
    CALayer *layer = [CALayer layer];
    // 设置尺寸
    layer.bounds = CGRectMake(0, 0, 50, 50);
    // 设置位置
    layer.position = CGPointMake(50, 100);
    // 设置背景颜色
    layer.backgroundColor = [UIColor redColor].CGColor;
    // 创建备份容器
    CAReplicatorLayer *reLayer = [CAReplicatorLayer layer];
    // 设置每个备份的副本背景色中红基色的偏移量
    // 与其对应的还有instanceGreenOffset、instanceBlueOffset和instanceAlphaOffset属性，分别设置背景色中蓝基色、绿基色和透明度的偏移量。
    reLayer.instanceRedOffset = -0.2;
    // 设置备份位置
    reLayer.position = CGPointMake(0, 0);
    // 设置备份视图的3D变化属性
    reLayer.instanceTransform = CATransform3DMakeTranslation(100, 0, 0);
    // 设置加上原本要备份出的层视图个数
    reLayer.instanceCount = 3;
    // 显示备份视图
    [reLayer addSublayer:layer];
    [self.view.layer addSublayer:reLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
