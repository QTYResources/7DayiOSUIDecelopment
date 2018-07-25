//
//  ViewController.m
//  UIVisualffectViewTest
//
//  Created by QinTuanye on 2018/7/25.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"image"];
    [self.view addSubview:bg];
    
    // UIVisualEffectView类用于创建虚化背景效果的视图，可以理解为一块毛玻璃，其放在哪个视图上面，相应的视图就被蒙上了一层毛玻璃。UIVisualEffectView类的initWithEffect:方法通过一个模糊处理对象来实例化自身对象，UIBlurEffect类用于创建模糊处理对象，在创建时，有以下几种风格可供选择，如下：
    //      UIBlurEffectStyleExtraLight // 高亮风格
    //      UIBlurEffectStyleLight      // 亮化风格
    //      UIBlurEffectStyleDark       // 暗化风格
    //      UIBlurEffectStyleExtraDark
    //      UIBlurEffectStyleRegular
    //      UIBlurEffectStyleProminent
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    // 设置虚化度
    effectView.alpha = 1;
    effectView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    [bg addSubview:effectView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
