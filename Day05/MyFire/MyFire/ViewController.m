//
//  ViewController.m
//  MyFire
//
//  Created by QinTuanye on 2018/7/12.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// 发射器对象
@property (strong, nonatomic)  CAEmitterLayer *fireEmitter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    /*
         粒子效果的创建基于两个部分，一部分是粒子发射器，用于配置粒子的整体效
     果；另一部分是粒子单元，用于配置粒子的具体属性。
         CAEmitterLayer中常用的属性含义如下：
            // 粒子单元数组，例如在绘制火焰效果时，你可以创建两个单元，一个单元负责烟雾，一个单元负责火苗
            @property(copy) NSArray *emitterCells;
            // 粒子的创建速率，默认哦1/s
            @property float birthRate;
            // 粒子的存活时间，默认1s
            @property float lifetime;
            // 发射器在XY平面的中心位置
            @property CGPoint emitterPosition;
            // 发射器在Z轴的位置
            @property CGFloat emitterZPositon;
            // 发射器的大小
            @property CGSize emitterSize;
            // 发射器的深度，在某些模式下会产生立体效果
            @property CGFloat emitterDepth;
            // 发射器的形状
            @property(copy) NSString *emitterShape;
            // 发射器的发射模式
            @property(copy) NSString *emitterMode;
            // 发射器的渲染模式
            @property(copy) NSString *renderMode;
            // 是否开启景深效果
            @property BOOL preservesDepth;
            // 粒子的运动速度
            @property float velocity;
            // 粒子的缩放大小
            @property float scale;
            // 粒子的旋转位置
            @property float spin;
         上面属性中，emitterShape属性决定粒子发射器的形状，可选参数如下：
            kCAEmitterLayerPoint        // 点的形状
            kCAEmitterLayerLine         // 线的形状，粒子从一条线发出
            kCAEmitterLayerRectangle    // 矩形形状，粒子从一个矩形中发出
            kCAEmitterLayerCuboid       // 立方体形状，会影响Z平面的效果
            kCAEmitterLayerCircle       // 圆形，粒子会在圆形范围发射
            kCAEmitterLayerShere        // 球形
        emitterMode属性决定粒子在发射器中发射的位置，可选参数如下：
            kCAEmitterLayerPoints       // 从发射器中发出
            kCAEmitterLayerOutline      // 从发射器边缘发出
            kCAEmitterLayerSurface      // 从发射器表面发出
            kCAEmitterLayerVolume       // 从发射器中心发出
        renderMode属性设置发射器的粒子渲染模式，可选参数如下：
            kCAEmitterLayerUnordered    // 这种模式下，粒子是无序出现的，多个发射源将混合
            kCAEmitterLayerOldestFirst  // 这种模式下，声明久的粒子会被渲染在最上层
            kCAEmitterLayerOldestLast   // 这种模式下，年轻的粒子会被渲染在最上层
            kCAEmitterLayerBackToFront  // 这种模式，粒子的渲染按照Z轴的前后顺序进行
            kCAEmitterLayerAdditive     // 这种模式会进行粒子混合
     
        CAEmitterLayer中的属性主要是对粒子的创建周期、发射速度等整体属性进
     行设置，而具体粒子的UI展现、颜色、速度以及各种随机选项等是由粒子单元CAEmitterCell来进行设置与维护的。
        CAEmitterCell中常用属性以及含义如下：
            // 类方法创建发射单元
            + (instancetype)emitterCell;
            // 设置发射单元的名称
            @property(copy) NSString *name;
            // 粒子的创建速率
            @property float birthRate;
            // 粒子的生存时间
            @property float lifetime;
            // 粒子的生存时间容差
            @property float lifetimeRange;
            // 粒子在Z轴方向的发射角度
            @property CGFloat emissionLatitude;
            // 粒子在XY平面的发射角度
            @property CGFloat emissionLongitude;
            // 粒子发射角度的容差
            @property CGFloat emissionRange;
            // 粒子的速度
            @property CGFloat velocity;
            // 粒子速度的容差
            @property CGFloat velocityRange;
            // 粒子X、Y、Z三个方向的加速度
            @property CGFloat xAcceleration;
            @property CGFloat yAcceleration;
            @property CGFloat zAcceleration;
            // 粒子的缩放大小，缩放容差和缩放速度
            @property CGFloat scale;
            @property CGFloat scaleRange;
            @property CGFloat scaleSpeed;
            // 粒子的旋转度与旋转容差
            @property CGFloat spin;
            @property CGFloat spinRange;
            // 粒子的颜色
            @property CGColorRef color;
            // 粒子在RGB三个色相上的容差和透明度的容差
            @property float redRange;
            @property float greenRange;
            @property float blueRange;
            @property float alphaRange;
            // 粒子在RGB三个色相上的变化速度和透明度的变化速度
            @property float redSpeed;
            @property float greenSpeed;
            @property float blueSpeed;
            @property float alphaSpeed;
            // 粒子的渲染对象，可以设置为一个CGImage的对象
            @property(strong) id contents;
     */
    // 设置发射器
    self.fireEmitter = [[CAEmitterLayer alloc]init];
    // 设置发射器在XY平面的中心位置
    self.fireEmitter.emitterPosition = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 20);
    // 设置发射器大小
    self.fireEmitter.emitterSize = CGSizeMake(self.view.frame.size.width - 100, 20);
    // 设置渲染模式
    self.fireEmitter.renderMode = kCAEmitterLayerAdditive;
    // 发射单元
    // 火焰
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    // 设置创建速度
    fire.birthRate = 1600;
    // 设置生命周期
    fire.lifetime = 4.0;
    // 设置生命周期容差
    fire.lifetimeRange = 1.5;
    // 设置颜色
    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    // 设置渲染对象
    fire.contents = (id)[UIImage imageNamed:@"Particles_fire.png"].CGImage;
    // 设置名称
    [fire setName:@"fire"];
    // 设置速度
    fire.velocity = 160;
    // 设置速度容差
    fire.velocityRange = 80;
    // 设置粒子在XY平面的发射角度
    fire.emissionLongitude = M_PI + M_PI_2;
    // 设置粒子发射角度的容差
    fire.emissionRange = M_PI_2;
    // 设置缩放大小
    fire.scaleSpeed = 0.3;
    // 设置粒子的旋转度
    fire.spin = 0.2;
    
    // 烟雾
    CAEmitterCell *smoke = [CAEmitterCell emitterCell];
    // 设置创建速度
    smoke.birthRate = 800;
    // 设置生存时间
    smoke.lifetime = 6.0;
    // 设置生存时间容差
    smoke.lifetimeRange = 1.5;
    // 设置颜色
    smoke.color = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.05]CGColor];
    // 设置渲染对象
    smoke.contents = (id)[[UIImage imageNamed:@"Particles_fire.png"]CGImage];
    // 设置速度
    smoke.velocity = 250;
    // 设置速度容差
    smoke.velocityRange = 100;
    // 设置粒子在XY平面的发射角度
    smoke.emissionLongitude = M_PI + M_PI_2;
    // 设置粒子发射角度的容差
    smoke.emissionRange = M_PI_2;
    // 设置发射器的粒子单元
    self.fireEmitter.emitterCells = [NSArray arrayWithObjects:smoke,fire,nil];
    [self.view.layer addSublayer:self.fireEmitter];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
