//
//  ViewController.m
//  UIPageControlTest
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
    self.view.backgroundColor = [UIColor redColor];
    
    // 创建分页控制器控件
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(20, 100, 280, 30)];
    // 设置分页数
    pageControl.numberOfPages = 10;
    // 设置当前所在的分页点
    pageControl.currentPage = 5;
    // 进行颜色设置
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    // 添加触发方法
    [pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现分页控制器的触发方法
- (void)pageChange:(UIPageControl *)page {
    // 打印当前所在页码
    NSLog(@"%lu", page.currentPage);
}


@end
