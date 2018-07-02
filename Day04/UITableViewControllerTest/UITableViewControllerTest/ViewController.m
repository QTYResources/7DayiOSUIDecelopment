//
//  ViewController.m
//  UITableViewControllerTest
//
//  Created by QinTuanye on 2018/7/2.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册Cell类
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    // 创建刷新控件
    self.refreshControl = [[UIRefreshControl alloc]init];
    // 设置刷新控件的颜色
    self.refreshControl.tintColor = [UIColor redColor];
    // 设置刷新控件的文字
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"刷新控件"];
    // 设置属性控件触发方法
    [self.refreshControl addTarget:self action:@selector(update:) forControlEvents:UIControlEventValueChanged];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现刷新方法
- (void)update:(UIRefreshControl *)control {
    // 2秒后执行刷新结束方法
    [control performSelector:@selector(endRefreshing) withObject:nil afterDelay:2];
}

#pragma mark -- 实现UITableViewDataSource协议
// 设置分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 设置每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

// 设置每行的视图数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    return cell;
}

@end
