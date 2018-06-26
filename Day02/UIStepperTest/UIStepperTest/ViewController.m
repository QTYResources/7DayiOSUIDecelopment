//
//  ViewController.m
//  UIStepperTest
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
    
    // 创建步进控制器控件
    UIStepper *stepper = [[UIStepper alloc]init];
    // 设置控件位置
    stepper.center = CGPointMake(100, 100);
    // continuous属性设置是否值一变化就立即调用触发方法。如果设置为YES，则当用户手指按住UIStepper控件上的按钮不松开时，系统会连续调用触发方法。如果设置为NO,则当用户手指按住UISteper控件上的按钮不松开时， autorepeat属性设置控件的值变化是否重复触发。
    stepper.continuous = YES;
    // autorepeat属性设置控件的值的变化是否重复触发。如果设置为YES，则当用户按住UIStepper上的按钮不松开时，UIStepper控件的值会一致改变；如果设置为NO，则值只会改变一次。
    stepper.autorepeat = YES;
    // wraps属性设置UIStepper控件的值是否自动循环，如果设置为NO，则值只会改变一次；如果设置为YES，则当UIStepper的值到达最大值后用户再点击增值按钮则值会变为最小值矩形进行循环。
    stepper.wraps = YES;
    // 设置UIStepper控件的最小值
    stepper.minimumValue = 0;
    // 设置UIStepper控件的最大值
    stepper.maximumValue = 10;
    // 设置UIStepper控件的步长
    stepper.stepValue = 1;
    // 设置UIStepper控件的颜色
    stepper.tintColor = [UIColor redColor];
    // 设置背景图案
    [stepper setBackgroundImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    // 设置分割线图案
    [stepper setDividerImage:[UIImage imageNamed:@"image"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal];
    // 设置增值按钮图片
    [stepper setIncrementImage:[[UIImage imageNamed:@"image"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    // 设置减值按钮图片
    [stepper setDecrementImage:[[UIImage imageNamed:@"iamge"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    // 设置UIStepper控件的触发方法
    [stepper addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现步进控制器控件的触发方法
- (void)valueChange:(UIStepper *)step {
    // 打印UIStepper控件当前的值
    NSLog(@"%f", step.value);
}

@end
