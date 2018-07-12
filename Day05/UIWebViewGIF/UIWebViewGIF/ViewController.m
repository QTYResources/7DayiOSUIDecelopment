//
//  ViewController.m
//  UIWebViewGIF
//
//  Created by QinTuanye on 2018/7/12.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 使用UIWebView播放GIF动态图
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(20, 100, 280, 200)];
    // 读取素材数据
    NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"gifImage" ofType:@"gif"]];
    [web loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:web];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
