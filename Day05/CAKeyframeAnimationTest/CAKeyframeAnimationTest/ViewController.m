//
//  ViewController.m
//  CAKeyframeAnimationTest
//
//  Created by QinTuanye on 2018/7/12.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layer = [CALayer layer];
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer.position = CGPointMake(50, 100);
    [self.view.layer addSublayer: self.layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建关键帧动画
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 设置关键帧数组
    ani.values = @[[NSValue valueWithCGPoint:CGPointMake(50, 100)], [NSValue valueWithCGPoint:CGPointMake(120, 100)], [NSValue valueWithCGPoint:CGPointMake(120, 200)],[NSValue valueWithCGPoint:CGPointMake(200, 200)]];
    // 设置每段动画的时间占比，其取值范围在0-1之间且递增
    ani.keyTimes = @[@0, @0.5, @0.8, @1];
    // 设置动画时间
    ani.duration = 3;
    // 执行动画
    [self.layer addAnimation:ani forKey:@""];
}

@end
