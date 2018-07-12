//
//  ViewController.m
//  CABasicAnimationTest
//
//  Created by QinTuanye on 2018/7/12.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.layer = [CALayer layer];
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.position = CGPointMake(160, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 渐变动画
    // 背景色渐变动画
//    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    /*
     * 提示：
     *     CABasicAnimation类中还有byValue这样一个属性，fromeValue和byValue两个属性值的差别如下：
     *      fromValue和toValue不为空：动画的值由fromValue变化到toValue。
     *      fromValue和byValue不为空：动画的值由fromValue变化到fromValue+byValue。
     *      byValue和toValue不为空：动画的值由toValue-byValue变化到toValue。
     *      只要fromValue不为空：动画的值由fromValue变化到layer的当前状态值。
     *      只要toValue不为空：动画的值由layer当前的值变化到toValue。
     *      只要byValue不为空：动画的值由layer当前的值变化到layer当前的值+byValue。
     */
    // 设置起始颜色，从红色开始
//    ani.fromValue = (id)[UIColor redColor].CGColor;
    // 设置要渐变成的颜色，渐变成蓝色
//    ani.toValue = (id)[UIColor blueColor].CGColor;
    // 设置动画执行时间，时间2s
//    ani.duration = 2;
    // 执行动画
    /*
     * 第1个参数为要执行的动画动作对象
     * 第2个参数将这个动作设置一个标识符
     */
//    [self.layer addAnimation:ani forKey:@""];
    
    // 旋转动画
    // 绕Z轴旋转的动画
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform"];
    // 从0度开始
    ani.fromValue = @0;
    // 旋转到180度
    ani.toValue = [NSNumber numberWithFloat:M_PI];
    // 时间2s
    ani.duration = 2;
    // 设置为沿Z轴旋转
    /*
     * 上面创建CABasicAnimation对象时，设置其keyPath为transform。但具体的变换方式是由valueFunction属性决定的，可用的transform变换方式的值有：
     *      kCAValueFunctionRotateX     // 设置沿X轴旋转操作
     *      kCAValueFunctionRotateY     // 设置沿Y轴旋转操作
     *      kCAValueFunctionRotateZ     // 设置沿Z轴旋转操作
     *      kCAValueFunctionScale
     *      kCAValueFunctionScaleX      // 设置沿X轴缩放操作
     *      kCAValueFunctionScaleY      // 设置沿Y轴缩放操作
     *      kCAValueFunctionScaleZ      // 设置沿Z轴缩放操作
     *      kCAValueFunctionTranslate
     *      kCAValueFunctionTranslateX  // 设置沿X轴平移操作
     *      kCAValueFunctionTranslateY  // 设置沿Y轴平移操作
     *      kCAValueFunctionTranslateZ  // 设置沿Z轴平移操作
     */
    ani.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateX];
    // 执行动画
    [self.layer addAnimation:ani forKey:@""];
    
    // CASpringAnimation动画和CABasicAnimation动画相比只是多了一些关于阻尼操作的参数，开发者可以设置这些参数在动画展现过程中添加类似弹簧的阻尼效果，可用属性如下：
    //      // 这个属性设置类似弹簧重物的质量，会影响惯性，必须大于0，默认为1
    //      @property CGFloat mass;
    //      // 设置弹簧的刚度系数，必须大于0，默认100，这个系数越大，则回弹越快
    //      @property CGFloat stiffness;
    //      // 阻尼系数，默认为10，必须大于0，这个值越大，回弹的幅度越小
    //      @property CGFloat damping;
    //      // 初始速度
    //      @property CGFloat initialVelocity;
    //      //获取动画停下来需要的时间，只读属性
    //      @property(readonly) CFTimeInterval settlingDuration;
}


@end
