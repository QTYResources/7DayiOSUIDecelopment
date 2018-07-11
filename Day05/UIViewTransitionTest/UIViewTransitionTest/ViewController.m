//
//  ViewController.m
//  UIViewTransitionTest
//
//  Created by QinTuanye on 2018/7/11.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *contentView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.contentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.contentView];
    self.contentView2 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.contentView2.backgroundColor = [UIColor blueColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 重绘UIView视图时使用的转场动画
    /*
     * 第1个参数为要执行转场动画的UIView对象。
     * 第2个参数设置动画执行的时间
     * 第3个参数设置动画执行的一些配置参数
     * 第4个参数为要执行的重绘动作，开发者可以在这个block中进行视图控件的属性改变或者子视图的重新布局。实际上，就算这个block中不编写任何重绘操作代码，视图的转场动画依然会执行，只是执行后的视图没有任何变化。
     * 第5个参数设置动画执行完成后的回调block。
     * UIView的转场动画也支持组合嵌套。
     */
//    [UIView transitionWithView:self.contentView duration:3 options:UIViewAnimationOptionTransitionFlipFromBottom | UIViewAnimationOptionAllowAnimatedContent animations:^{
//        self.contentView.backgroundColor = [UIColor blueColor];
//    } completion:nil];
    
    // 切换UIView视图时使用的转场动画
    /*
     * 第1个参数设置当前显示的View视图
     * 第2个参数设置将要切换的View视图
     * 第3个参数设置执行动画的配置参数
     * 第4个参数为动画执行完毕后的回调block代码块
     */
    [UIView transitionFromView:self.contentView toView:self.contentView2 duration:3 options:UIViewAnimationOptionTransitionFlipFromBottom | UIViewAnimationOptionAllowAnimatedContent completion:nil];
}

@end
