//
//  ViewController.m
//  UITabBarControllerTest
//
//  Created by QinTuanye on 2018/7/4.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建UITableController视图控制器
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    // 创建用于存储子视图的数组
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 6; i++) {
        // 创建子视图
        UIViewController *con = [[UIViewController alloc]init];
        // 设置子背景颜色
        con.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
        // 创建UITabBarItem的方法有以下几种：
        // 创建系统风格的标签
        /*
         * 标签的系统风格有以下几种：
         * UITabBarSystemItemMore       // 更多风格
         * UITabBarSystemItemFavorites  // 喜爱风格
         * UITabBarSystemItemFeatured   // 关注风格
         * UITabBarSystemItemTopRated   // 排行风格
         * UITabBarSystemItemRecents    // 最近记录风格
         * UITabBarSystemItemContacts   // 联系人风格
         * UITabBarSystemItemHistory    // 历史风格
         * UITabBarSystemItemBookmarks  // 书签风格
         * UITabBarSystemItemSearch     // 搜索风格
         * UITabBarSystemItemDownloads  // 下载风格
         * UITabBarSystemItemMostRecent // 记录列表风格
         * UITabBarSystemItemMostViewed // 浏览列表风格
         */
        con.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemHistory tag:i];
        // 通过标签、常态图片和选中图片创建
        con.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"title" image:[UIImage imageNamed:@"image"] selectedImage:[UIImage imageNamed:@"image"]];
        // 通过标题和常态图片创建
        con.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"title" image:[UIImage imageNamed:@"image"] tag:i];
        // 设置标签控制器中标签的标题
        con.tabBarItem.title = [NSString stringWithFormat:@"%d视图", i];
        // 设置标签控制器中标签的图片
        con.tabBarItem.image = [UIImage imageNamed:@"tab_bar_icon_home"];
        // 设置标签控制器中标签选择后的图片
        con.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_bar_icon_home_selected"];
        [array addObject:con];
    }
    // 设置标签控制器的控制视图数组
    tabBar.viewControllers = array;
    // 启动标签控制器
    [self presentViewController:tabBar animated:YES completion:nil];
}


@end
