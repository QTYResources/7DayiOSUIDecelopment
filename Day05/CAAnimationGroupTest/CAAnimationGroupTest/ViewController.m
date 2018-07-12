//
//  ViewController.m
//  CAAnimationGroupTest
//
//  Created by QinTuanye on 2018/7/12.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layer = [CALayer layer];
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.position = CGPointMake(100, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建动画1
    CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    ani1.toValue = (id)[UIColor blueColor].CGColor;
    // 创建动画2
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"position"];
    ani2.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    // 创建动画组合
    CAAnimationGroup *group = [CAAnimationGroup animation];
    // 设置动画时间
    group.duration = 3;
    // 设置动画数组
    group.animations = @[ani1, ani2];
    // 执行动画
    [self.layer addAnimation:group forKey:@""];
}

@end
