//
//  ViewController.m
//  AutolayoutTestFour
//
//  Created by QinTuanye on 2018/7/17.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    // 使用constraintsWithVisualFormat: options: metrics: views: 方法用于根据VFL格式化字符串创建一系列的NSLayoutConstraint约束对象，这些创建出来的约束对象会以数组的形式返回。
    // VFL即Visual-Format-Language格式化约束语言，对应于下面代码的字符串：
    //      H:|-20-[view(100@1000)]
    //      V:|-100-[view(100)]
    // 上面的第一条语句实际是约束了view视图右侧距离父视图20个单位，宽度为100个单位，并且这条约束的优先级为1000.第二条语句约束了view视图上侧距离父视图100个单位，view视图的高度为100.
    // 现在可以解释一下VFL语言的语法含义了，最前面的H或者V代表约束的布局方向，H为为水平方向添加约束，V为为竖直方向添加约束。“|”表示父视图的边缘。在H约束布局中，如果“|”出现在字符串的左端，则代表父视图的左边界；如果“|”出现在字符串的右端，则代表父视图的右边界。在V约束布局中，如果“|”出现在字符串的左边，则代表父视图的上边界；如果“|”出现在字符串的右端，则代表父视图的下边界。“-x-”表示具体的约束距离，x既可为常量也可以为变量，例如前面示例中的20就是常量，为变量的情况后面会有讨论。[]内为要布局摆放的控件名称，()内约束控件的尺寸。在H约束布局中，其含义是约束控件的宽度。在V约束布局中，其含义是约束控件的高度。@符号后面的值为设置此约束的优选级。
    /*
     * 第1个参数为创建约束的VFL字符串
     * 第2个参数设置所约束控件的对齐模式，其需要设置为NSLayoutFormatOptions类型的枚举。
     * 第3个参数为变量映射字典，如果VFL字符串中需要使用到某些变量，则需要使用这个参数将变量映射到VFL字符串中，示例如下：
     *      NSNumber *width = @20;
     *      NSArray *constraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-width-[view(100@1000)]" options:0 metrics:@{@"width":width} views:NSDictionaryOfVariableBindings(view)];
     * 第4个参数是一个约束对象映射字典。与变量映射的原理一样，需要将VFL中使用到的具体控件名映射成视图控件对象。NSDictionaryOfVariableBindings()宏可以帮助开发者快捷地创建这个映射字典，开发者只需将使用到视图控件对象直接传入即可。需要注意的是，使用NSDictionaryOfVariableBindings()宏进行快捷映射字典创建时，视图控件的名称必须和VFL中的名称完全一致。如果手写这个映射字典，则上面的代码和下面是等价的：
     *      NSArray *constraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-width-[view(100@1000)]" options:0 metrics:@{@"width":width} views:@{@“view":view}];
     *
     * 下面是NSLayoutFormatOptions类型的常用枚举值及含义如下：
     *      NSLayoutFormatAlignAllLeft          // 约束的控件左对齐
     *      NSLayoutFormatAlignAllRight         // 约束的控件右对齐
     *      NSLayoutFormatAlignAllTop           // 约束的控件上对齐
     *      NSLayoutFormatAlignAllBottom        // 约束的控件下对齐
     *      NSLayoutFormatAlignAllLeading       // 约束的控件前对齐
     *      NSLayoutFormatAlignAllTrailing      // 约束的控件后对齐
     *      NSLayoutFormatAlignAllCenterX       // 约束的控件Y轴中心对齐
     *      NSLayoutFormatAlignAllCenterY       // 约束的控件X轴中心对齐
     *      NSLayoutFormatAlignAllBaseline // 约束的控件文字基线对齐
     *
     * 除了已经介绍的添加约束的方法外，autolayout框架中还提供了一些移除约束的方法。对于进行autolayout约束的视图控件而言，其中所有可用的有关设置约束的方法如下：
     *      // 为控件添加一个约束对象
     *      - (void)addConstraint:(NSLayoutConstraint *)constraint;
     *      // 为控件添加一组约束对象
     *      - (void)addConstraints:(NSArray<__kindof NSLayoutConstraint *> *)constraints;
     *      // 移除控件上的一个约束对象
     *      - (void)removeConstraint:(NSLayoutConstraint *)constraint;
     *      // 移除控件上的一组约束对象
     *      - (void)removeConstraints:(NSArray<__kindof NSLayoutConstraint *> *)constraints;
     */
    NSArray *constraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[view(100@1000)]" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(view)];
    NSArray *constraintArray2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[view(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)];
    [self.view addConstraints:constraintArray];
    [self.view addConstraints:constraintArray2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
