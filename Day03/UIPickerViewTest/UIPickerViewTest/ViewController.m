//
//  ViewController.m
//  UIPickerViewTest
//
//  Created by QinTuanye on 2018/6/28.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UIPickerView对象
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectMake(20, 100, 280, 150)];
    // 设置代理
    picker.delegate = self;
    // 设置数据源
    picker.dataSource = self;
    [self.view addSubview:picker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现UIPickerViewDataSource协议
#pragma mark -- 实现UIPickerViewDataSource协议
// 设置UIPickerView视图的分区数，也可以理解为选择列表的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// 设置UIPickerView每个分区的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

// 设置列表中每一行的数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%lu 分区%lu数据", component, row];
}

// 设置具体行的行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 44;
}

// 设置分区的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 140;
}

// 实现UIPickerViewDelegate协议
#pragma mark -- 实现UIPickerViewDelegate协议
// 当用户选择数据时调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%lu, %lu", row, component);
}

@end
