//
//  ViewController.m
//  UISliderTest
//
//  Created by QinTuanye on 2018/6/26.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    // 创建UISlider控件对象
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
    // 设置控件触发方法
    [slider addTarget:self action:@selector(changeBG:) forControlEvents:UIControlEventValueChanged];
    // 设置UISlider控件的最小值
    slider.minimumValue = 0;
    // 设置UISlider控件的最大值
    slider.maximumValue = 10;
    // 设置UISlider控件最小中轴颜色
    slider.minimumTrackTintColor = [UIColor blueColor];
    // 设置UISlider控件最大中轴颜色
    slider.maximumTrackTintColor = [UIColor greenColor];
    // 设置UISlider控件中滑块的颜色
    slider.thumbTintColor = [UIColor purpleColor];
    // 设置UISlider控件的左控件视图
    slider.minimumValueImage = [UIImage imageNamed:@"cj_mxz_xingxing"];
    // 设置UISlider控件的右控件视图
    slider.maximumValueImage = [UIImage imageNamed:@"cj_xz_xingxing"];
    // continuous属性是一个BOOL类型的值，默认为YES，这时只要用户滑动滑块，添加的触发方法就会连续调用。如果设置为NO，则当用户按住滑块进行拖曳操作时，控件提那家的触发方法并不会调用，只有当用户松开手指时，触发方法才会被调用一次，Slider控制的value值为最终变化到的value值
    slider.continuous = NO;
    // 将控件添加到视图上
    [self.view addSubview:slider];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现UISlider控件的触发方法
- (void)changeBG:(UISlider *)slider {
    self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1 - slider.value];
}
@end
