//
//  ViewController.m
//  UIAlertControllerTest
//
//  Created by QinTuanye on 2018/6/27.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 不能在这里显示对话框，这样是显示不出来的
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建警告控制器对象
    /**
     * 第1个参数设置警告视图的标题
     * 第2个参数设置警告的内容
     * 第3个参数设置警告控制器的风格，主要有以下风格：
     *      UIAlertControllerStyleActionSheet // 活动列表风格
     *      UIAlertControllerStyleAlert // 警告框风格
     */
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleAlert];
    // 创建按钮
    /**
     * 第1个参数设置按钮的标题
     * 第2个参数设置按钮的风格，主要有以下风格：
     *      UIAlertActionStyleDefault // 默认风格
     *      UIAlertActionStyleCancel  // 取消风格
     *      UIAlertActionStyleDestructive // 注意风格
     * 第3个参数设置点击按钮后的触发方法block
     */
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click");
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click");
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"click");
    }];
    // 添加按钮
    [alertCon addAction:action];
    [alertCon addAction:action2];
    [alertCon addAction:action3];
    
    // 添加一个文本控件
    [alertCon addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"文本框1";
    }];
    [alertCon addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"文本框2";
    }];
    [alertCon addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"文本框3";
    }];
    // 显示警告框
    NSLog(@"显示警告框");
    [self presentViewController:alertCon animated:YES completion:nil];
}


@end
