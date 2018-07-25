//
//  ModelViewController.h
//  UIPageViewControllerTest
//
//  Created by QinTuanye on 2018/7/25.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelViewController : UIViewController
@property (nonatomic, strong) UILabel *indexLabel;

// 创建自身类对象的类方法
+ (ModelViewController *)createWithIndex:(int)index;
@end
