//
//  ViewController.m
//  autolayoutTestThree
//
//  Created by QinTuanye on 2018/7/16.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view1 = [[UIView alloc]init];
    // 禁止Autoresizing布局模式
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.backgroundColor = [UIColor redColor];
    // 添加约束前，必须将子视图添加到父视图上
    [self.view addSubview:view1];
    // 将view1视图约束在屏幕竖直方向的中间
    /*
     * 第1个参数设置要约束的第一个视图对象。
     * 第2个参数设置约束属性，具体参数意义后面介绍。
     * 第3个参数设置约束属性键的关系，参数具体意义后面介绍。
     * 第4个参数设置约束的第二个视图对象。
     * 第5个参数设置第二个视图对象的约束属性。
     * 第6个参数设置约束的比例。
     * 第7个参数设置约束的值。
     * 第2个参数和第5个参数都需要设置为NSLayoutAttribute类型的枚举，枚举值为要约束控件的具体属性，常用枚举及含义如下：
     *      NSLayoutAttributeLeft           // 约束控件的左边
     *      NSLayoutAttributeRight          // 约束控件的右边
     *      NSLayoutAttributeTop            // 约束控件的顶部
     *      NSLayoutAttributeBottom         // 约束控件的地步
     *      NSLayoutAttributeLeading        // 约束控件的前边
     *      NSLayoutAttributeTrailing       // 约束控件的后背
     *      NSLayoutAttributeWidth          // 约束控件的宽度
     *      NSLayoutAttributeHeight         // 约束控件高度
     *      NSLayoutAttributeCenterX        // 约束控件中心的横轴位置
     *      NSLayoutAttributeCenterY        // 约束控件中心的纵轴位置
     *      NSLayoutAttributeLastBaseline   // 约束带文字控件的文字基线位置
     *      NSLayoutAttributeBaseline NS_SWIFT_UNAVAILABLE("Use 'lastBaseline' instead") = NSLayoutAttributeLastBaseline,
     *      NSLayoutAttributeFirstBaseline NS_ENUM_AVAILABLE_IOS(8_0),
     *
     *      NSLayoutAttributeLeftMargin NS_ENUM_AVAILABLE_IOS(8_0),
     *      NSLayoutAttributeRightMargin NS_ENUM_AVAILABLE_IOS(8_0),
     *      NSLayoutAttributeTopMargin NS_ENUM_AVAILABLE_IOS(8_0),
     *      NSLayoutAttributeBottomMargin NS_ENUM_AVAILABLE_IOS(8_0),
     *      NSLayoutAttributeLeadingMargin NS_ENUM_AVAILABLE_IOS(8_0),
     *      NSLayoutAttributeTrailingMargin NS_ENUM_AVAILABLE_IOS(8_0),
     *      NSLayoutAttributeCenterXWithinMargins NS_ENUM_AVAILABLE_IOS(8_0),
     *      NSLayoutAttributeCenterYWithinMargins NS_ENUM_AVAILABLE_IOS(8_0),
     
     *      NSLayoutAttributeNotAnAttribute         // 默认属性
     
     * 上面所有枚举值中，有一个比较特殊，即NSLayoutAttributeNotAnAttribute值，它没有任何意义，只是作为某些情况下方法中的占位。
     
     * 创建约束对象的方法中，第3个参数需要设置为NSLayoutRelation类型的枚举，这个值决定了所约束属性间的关系，枚举值及含义如下：
     *      NSLayoutRelationLessThanOrEqual     // 小于等于所约束的值
     *      NSLayoutRelationEqual               // 严格等于所约束的值
     *      NSLayoutRelationGreaterThanOrEqual  // 大于等于所约束的值
     
     * 创建约束对象方法的最后两个参数决定了约束值，第6个参数设置约束的比例，第7个参数设置具体的约束值。multiplier与constant参数的计算方法遵守如下公式：
            view1 宽度 = view2 宽度 * multiplier + constant
     *
     * 提示：
     *      1. 在使用addConstraint: 方法添加约束之前，必须先将子视图添加到付视图上，否则会出错。
     *      2. 某些与父视图相关的约束，约束对象必须添加在父视图上。
     *      3. 若想使用代码添加控件的autolayout约束，则必须先将控件的translatesAutoresizingMaskIntoConstraints属性设置为NO。
     */
    NSLayoutConstraint *constraintX = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.view addConstraint:constraintX];
    // 将view1视图约束在屏幕水平方向的中间
    NSLayoutConstraint *constraintY = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.view addConstraint:constraintY];
    // 将视图的宽度约束为100
    NSLayoutConstraint *constraintW = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [view1 addConstraint:constraintW];
    // 将视图的高度约束为100
    NSLayoutConstraint *constraintH = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [view1 addConstraint:constraintH];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
