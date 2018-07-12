//
//  ViewController.m
//  CATransitionTest
//
//  Created by QinTuanye on 2018/7/12.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建CALayer对象
    CALayer *layer =[CALayer layer];
    // 设置尺寸
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // 设置位置
    layer.position = CGPointMake(100, 100);
    // 设置背景颜色
    layer.backgroundColor = [UIColor redColor].CGColor;
    // 创建CATransition对象
    CATransition *ani = [CATransition animation];
    // 设置转场动画的类型
    /*
     * 提示：关于CATransition类中type属性定义的动画效果，除了官方文档中定义的上述4种外，还有一些私有的类型可以使用。需要注意的是，使用私有的动画类型在提交AppStore时很可能会被拒绝。可用的私有动画类型如下：
     *      pageCurl        // 翻页效果动画
     *      rippleEffect    // 滴水效果动画
     *      suckEffect      // 收缩效果，如一块布被抽走
     *      cube            // 立方体效果
     *      oglFlip         // 上下翻转效果
     */
    /*
     * 可选的参数字符串有：
     *      kCATransitionFade       // 淡入
     *      kCATransitionMoveIn     // 移入
     *      kCATransitionPush       // 压入
     *      kCATransitionReveal     // 溶解
     */
    ani.type = kCATransitionPush;
    // 设置动画执行的方向
    /*
     * 可选的参数字符串有：
     *      kCATransitionFromRight      // 从右测进
     *      kCATransitionFromLeft       // 从左侧进
     *      kCATransitionFromTop        // 从上侧进
     *      kCATransitionFromBottom     // 从下侧进
     */
    ani.subtype = kCATransitionFromRight;
    // 设置动画时间
    ani.duration = 3;
    // 添加动画
    [layer addAnimation:ani forKey:@""];
    // 执行动画
    [self.view.layer addSublayer:layer];
    
}


@end
