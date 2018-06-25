//
//  ViewController.m
//  UIButtonTest
//
//  Created by QinTuanye on 2018/6/23.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建并初始化UIButton对象
    /*
     * UIButtonTypeCustom // 自定义按钮风格
     * UIButtonTypeSystem // 系统按钮风格
     * UIButtonTypeDetailDisclosure // 详情按钮风格
     * UIButtonTypeInfoLight // 同上
     * UIButtonTypeInfoDark // 同上
     * UIButtonTypeContactAdd // 添加按钮风格
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    // 设置Button位置和尺寸
    button.frame = CGRectMake(100, 100, 100, 30);
    // 设置按钮标题
//    [button setTitle:@"按钮" forState:UIControlStateNormal];
    // 设置按钮标题颜色
    //button.tintColor = [UIColor redColor];
    // 根据按钮的状态设置标题颜色
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    // 设置按钮的背景颜色
//    button.backgroundColor = [UIColor blueColor];
    // 设置按钮控件的背景图片
//    [button setBackgroundImage:[UIImage imageNamed:@"light"] forState:UIControlStateNormal];
    
    [button setTitle:@"变色" forState:UIControlStateNormal];
    // 添加触发方法
    /*
     * UIControlEventTouchDown  // 手指按下时触发
     * UIControlEventTouchDownRepeat    // 重复按下时触发
     * UIControlEventTouchDragInside    // 手指在控件范围内拖动时触发
     * UIControlEventTouchDragOutside   // 手指在控件范围外拖动时触发
     * UIControlEventTouchUpInlside // 手指在控件范围内按下并抬起时触发即点击
     * UIControlEventTouchUpOutside // 手指在控件范围内按下并在控件范围外抬起时触发
     * UIControlEventValueChanged   // 控件的某些值发生变化时触发
     */
    [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    // 将其添加到屏幕上
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 按钮的触发动作
- (void)changeColor {
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
}

@end
