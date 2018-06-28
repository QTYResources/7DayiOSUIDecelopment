//
//  ViewController.m
//  UIViewControllerTest
//
//  Created by QinTuanye on 2018/6/28.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerTwo.h"

// 创建一个变量用于跟踪程序
int tip = 0;

@interface ViewController ()

@end

@implementation ViewController

// 类的初始化方法
+ (void)initialize {
    [super initialize];
    NSLog(@"%d initialize", ++tip);
}

// 对象初始化方法
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    NSLog(@"%d init", ++tip);
    return self;
}

// 从归档初始化
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    NSLog(@"%d initWithCoder", ++tip);
    return self;
}

// 从nib文件初始化
- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%d awakeFromNib", ++tip);
}

// 加载视图
- (void)loadView {
    [super loadView];
    NSLog(@"%d loadView", ++tip);
}

// 加载视图完成
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%d viewDidLoad", ++tip);
    // 创建子视图
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 280, 300)];
    subView.backgroundColor = [UIColor redColor];
    [self.view addSubview:subView];
    // 创建标签控件
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 240, 30)];
    label.backgroundColor = [UIColor blueColor];
    [subView addSubview:label];
    // 创建按钮控件
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 70, 240, 30)];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(changeController) forControlEvents:UIControlEventTouchUpInside];
    [subView addSubview:button];
}

// 将要布局子视图
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"%d viewWillLayoutSubviews", ++tip);
}

// 已经布局子视图
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"%d viewDidLayoutSubview", ++tip);
}

// 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"%d didReceiveMemoryWarning", ++tip);
}

// 将要展示
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%d viewWillAppear", ++tip);
}

// 已经展示
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%d viewDidAppear", ++tip);
}

// 将要消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%d viewWillDisAppear", ++tip);
}

// 已经消失
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%d viewDidDisappear", ++tip);
}

// 被释放
- (void)dealloc {
    NSLog(@"%d dealloc", ++tip);
}

// 切换视图控制器
- (void)changeController {
    // 创建要切换的视图控制器
    ViewControllerTwo *controller = [[ViewControllerTwo alloc]init];
    // 切换视图控制器
    /*
     * 第1个参数是将要跳转的视图控制器
     * 第2个参数决定跳转的过程是否展示动画
     * 第3个参数为一个block函数，在跳转完成后，block的代码会被执行。
     */
    [self presentViewController:controller animated:YES completion:^ {
        NSLog(@"切换完成");
    }];
}

@end
