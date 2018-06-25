//
//  ViewController.m
//  UISegmentedControl
//
//  Created by QinTuanye on 2018/6/25.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建UISegmentedControl控件
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"one", @"two", @"three", @"four"]];
    // 设置UISegmentedControl控件的尺寸
//    segmentedControl.frame = CGRectMake(20, 100, 280, 40);
    // UISegmentedControl中的momentary决定了其“切换”功能的本质。这个属性默认为NO，当用户点击某个切换模块按钮时，这个按钮会保持选中状态。如果设置为YES，则当用户的手指离开屏幕时，按钮的选中状态也会消失。
//    segmentedControl.momentary = YES;
    // 设置当前选中的按钮，下标从0开始
//    segmentedControl.selectedSegmentIndex = 2;
    // 向UISegmentedControl控件中新增一个模块
//    [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"imageName"] atIndex:1 animated:YES];
    // 向UISegmentedControl控件中新增一个模块
//    [segmentedControl insertSegmentWithTitle:@"新增" atIndex:0 animated:YES];
    // 删除UISegmentedControl控件中的某个模块
//    [segmentedControl removeSegmentAtIndex:1 animated:YES];
    // 删除UISegmentedControl控件中的所有模块
//    [segmentedControl removeAllSegments];
    // 修改UISegmentedControl控件中模块的标题
//    [segmentedControl setTitle:@"修改" forSegmentAtIndex:1];
    // 修改UiSegmentedControl控件中模块的图片
//    [segmentedControl setImage:[UIImage imageNamed:@"imageName"] forSegmentAtIndex:1];
    
    // 创建UISegmentedControl控件
    // 如果某个按钮的标题过长，则会被自动省略
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"one++++++", @"two+++++++++", @"three++", @"four"]];
    // 设置UISegmentedControl控件的尺寸
    segmentedControl.frame = CGRectMake(20, 100, 280, 40);
    // 手动修改某个按钮的宽度
//    [segmentedControl setWidth:100 forSegmentAtIndex:1];
    // 设置每个按钮的宽度自适应
    segmentedControl.apportionsSegmentWidthsByContent = YES;
    // 自定义按钮中内容的位置
    [segmentedControl setContentOffset:CGSizeMake(10, 10) forSegmentAtIndex:1];
    
    // 为UISegmentedControl控件添加触发方法
    [segmentedControl addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    
    // 将UISegmentedControl控件添加到视图中
    [self.view addSubview:segmentedControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UISegmentedControl控件的触发方法
- (void)click:(UISegmentedControl *)seg {
    // 获取当前选中的按钮编号
    NSUInteger index = seg.selectedSegmentIndex;
    NSLog(@"%lu", index);
}

@end
