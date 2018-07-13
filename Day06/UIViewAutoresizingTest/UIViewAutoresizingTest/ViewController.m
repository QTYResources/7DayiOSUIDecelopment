//
//  ViewController.m
//  UIViewAutoresizingTest
//
//  Created by QinTuanye on 2018/7/13.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // UIViewAutoresizing实际上是UIKit框架中的一个枚举，其枚举值与含义如下：
    //      UIViewAutoresizingNone                  // 默认
    //      UIViewAutoresizingFlexibleLeftMargin    // 与父视图右边间距固定，左边距可变
    //      UIViewAutoresizingFlexibleWidth         // 视图宽度可变
    //      UIViewAutoresizingFlexibleRightMargin   // 与父视图左边间距固定，右边距可变
    //      UIViewAutoresizingFlexibleTopMargin     // 与符视图下边距固定，上边距可变
    //      UIViewAutoresizingFlexibleHeight        // 视图高度可变
    //      UIViewAutoresizingFlexibleBottomMargin  // 与父视图上边间距固定，下边距可变
    // 提示：由NS_OPTIONS可以得知，UIViewAutoresizing枚举中的枚举值是可以进行按位或运算来结合使用的。
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 200, 200)];
    view1.backgroundColor = [UIColor redColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    view2.backgroundColor = [UIColor greenColor];
    [view1 addSubview:view2];
    [self.view addSubview:view1];
    // 设置自适应模式
    view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    view1.frame = CGRectMake(20, 40, 300, 300);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
