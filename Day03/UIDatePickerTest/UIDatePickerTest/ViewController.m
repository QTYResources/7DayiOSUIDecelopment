//
//  ViewController.m
//  UIDatePickerTest
//
//  Created by QinTuanye on 2018/6/28.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UIDatePicker对象
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(20, 100, 280, 150)];
    // 设置日期选择器模式
    /*
     * UIDatePickerModeTime           // 时间模式
     * UIDatePickerModeDate           // 日期模式
     * UIDatePickerModeDateAndTime    // 时间日期模式
     * UIDatePickerModeCountDownTimer // 计时模式
     */
    datePicker.datePickerMode = UIDatePickerModeTime;
    // 设置触发方法
    [datePicker addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现触发方法
- (void)change:(UIDatePicker *)picker {
    NSLog(@"%@", picker.date);
}
@end
