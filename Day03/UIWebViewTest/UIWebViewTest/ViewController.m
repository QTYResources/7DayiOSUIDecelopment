//
//  ViewController.m
//  UIWebViewTest
//
//  Created by QinTuanye on 2018/6/28.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // 创建UIWebView对象
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
//    // 创建网站URL对象
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
//    // 创建网络请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    // 加载请求
//    [webView loadRequest:request];
    
    // 创建HTML字符串
//    NSString *htmlStr = @"<html><head><meta charset=\"UTF-8\"><title>主标题 | 副标题</title></head><body><p>hello world</p></body></html>";
//    // 创建UIWebView对象
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
//    // 加载HTML字符串
//    [webView loadHTMLString:htmlStr baseURL:nil];
    
    // 创建UIWebView对象
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    // 创建NSURL对象
    NSURL *imageUrl = [[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle]pathForResource:@"image" ofType:@"png"]];
    // 创建NSData对象
    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
    // 设置探测类型
    webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber | UIDataDetectorTypeLink;
    // 设置代理
    webView.delegate = self;
    // 加载Data数据
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现UIWebViewDelegate协议
#pragma mark -- 实现UIWebViewDelegate协议
// 加载失败时调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
}

// 将要加载请求时调用
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

// 加载数据结束时调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
}

// 已经开始加载数据时调用
- (void)webViewDidStartLoad:(UIWebView *)webView {
}

@end
