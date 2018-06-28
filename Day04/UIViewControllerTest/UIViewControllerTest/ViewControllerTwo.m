//
//  ViewControllerTwo.m
//  UIViewControllerTest
//
//  Created by QinTuanye on 2018/6/28.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewControllerTwo.h"

@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 返回到跳转前的视图控制器
    /*
     * 第1个参数决定是否在返回时展示动画效果
     * 第2个参数是返回完成后回调的block函数块
     */
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
