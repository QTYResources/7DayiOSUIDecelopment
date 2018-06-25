//
//  ViewController.m
//  HelloWord
//
//  Created by QinTuanye on 2018/6/19.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建UILabel控件
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 120, 40)];
    // 设置Label控件文字
    label.text = @"Hello World Hello World Hello World Hello World Hello World Hello World Hello World";
    // 设置文字颜色
    label.textColor = [UIColor redColor];
    // 设置字体
    label.font = [UIFont systemFontOfSize:15];
    // 设置背景颜色
    label.backgroundColor = [UIColor blueColor];
    // 设置文字对齐模式
    label.textAlignment = NSTextAlignmentRight;
    // 设置阴影颜色
    label.shadowColor = [UIColor greenColor];
    // 设置阴影偏移尺寸
    label.shadowOffset = CGSizeMake(5, 5);
    // 设置文字排版行数
    label.numberOfLines = 5;
    // 设置文字的截断和换行模式
    label.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingMiddle;
    // 将控件添加到视图上
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
