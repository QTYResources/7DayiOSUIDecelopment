//
//  ViewController.m
//  UITestViewTest
//
//  Created by QinTuanye on 2018/6/27.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UITextView控件
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 100, 280, 200)];
    // 设置背景颜色
    textView.backgroundColor = [UIColor grayColor];
    // 设置字体
    textView.font = [UIFont italicSystemFontOfSize:20];
    // 设置字体颜色
    textView.textColor = [UIColor whiteColor];
    // 设置支持的超链接类型
    /*
     * 支持的超链接类型有：
     *      UIDataDetectorTypePhoneNumber // 电话号码
     *      UIDataDetectorTypeLink // 网址链接
     *      UIDataDetectorTypeAddress // 地址
     *      UIDataDetectorTypeCalendarEvent // 日历事件
     *      UIDataDetectorTypeNone // 不支持任何链接类型
     *      UIDataDetectorTypeAll // 所有链接类型
     *
     */
    textView.dataDetectorTypes = UIDataDetectorTypeAll;
    // 设置是否允许用户输入
    textView.editable = NO;
    // 设置是否可以进行文字选中操作
    textView.selectable = YES;
    // 设置默认显示的文字
    textView.text = @"PhoneNum:\n13859939873";
    // 设置文字对齐方式
    textView.textAlignment = NSTextAlignmentCenter;
    // 设置代理
    textView.delegate = self;
    [self.view addSubview:textView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现UITextViewDelegate协议
#pragma mark -- 实现UITextViewDelegate协议
// UITextView控件中字符将要改变时触发的方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;
}

// UITextView控件已经开始编辑时触发的方法
- (void)textViewDidBeginEditing:(UITextView *)textView {
}

// UITextView控件将要开始编辑时触发的方法
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}

// UITextView控件中选中的文字改变时触发的方法
- (void)textViewDidChangeSelection:(UITextView *)textView {
}

// UITextView控件中字符改变后触发的方法
- (void)textViewDidChange:(UITextView *)textView {
}

// UITextView控件结束编辑时触发的方法
- (void)textViewDidEndEditing:(UITextView *)textView {
}

// UITextView控件将要结束编辑时触发的方法
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;
}

@end
