//
//  ViewController.m
//  UIViewAnimationTest
//
//  Created by QinTuanye on 2018/7/11.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *colorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.colorView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*
     * UIView层过渡动画支持的属性有：
     *      frame:  为控件的位置与尺寸改变增加过渡动画效果
     *      bounds: 为控件的内部坐标系原点改变与尺寸改变增加过渡动画
     *      center: 为控件的中心点左边改变增加过渡动画
     *      transform:  为控件的数学变换增加过渡动画
     *      alpha:  为控件的透明度改变增加过渡动画
     *      backgroundColor:    为控件的背景色改变增加过渡动画
     *      contentStretch: 为UIImageView改变其图片的拉伸方式过程增加过渡动画
     *    frame与bounds都是CGRect类型的属性，其在使用CGRectMake()方法进行设置时，
     * 后两个参数的含义一致，都是设置控件的尺寸大小。但其前两个参数含义却相差甚远，frame
     * 属性的横纵坐标决定了控件在其父视图上的位置，这是对外外界而言的。bounds属性的横纵
     * 坐标决定了控件内部坐标系的原点，不会影响控件对于其父视图的相对位置，但是会影响它
     * 与其父视图的相对位置，但是会影响它与其内部子视图的相对位置。
     *    控件的transform属性用于设置控件UI上的一些数学变换，如翻转、旋转、平移、缩放等。
     *    contentStretch属性是针对UIImageView而言的，在为UIImageView设置内容图片时，
     * 如果图片过小，则UIImageView会对图片进行整体缩放处理，使其充满整个UIImageView控件。
     * 图片进行缩放的具体区域是由contentStretch属性设置的，这个属性也需要设置为CGRect类型，
     * 其默认为(0, 0, 1, 1)，代表从图片的左上角到右下角都是图片拉伸缩放的区域，即对图片整体
     * 进行拉伸缩放操作。如果要设置图片中心点右侧区域和中心点下侧区域为可拉伸缩放的区域，
     * 则需将contentStretch属性设置为（0.5, 0.5, 1, 1).
     */
    
    // UIView的animateWithDuration: animations: completion:方法用于创建和执行过渡动画。
    /*
     * 第1个参数用来设置动画的执行时间
     * 第2个参数是一个block代码块，开发者需要将要执行动画的过渡操作代码放入其中。
     * 第3个参数也是一个block代码块，这个block中的代码将在动画执行完成之后调用。
     */
//    [UIView animateWithDuration:3 animations:^{
//        self.colorView.frame = CGRectMake(100, 100, 100, 100);
//    } completion:^(BOOL finished) {
//        NSLog(@"动画完成");
//    }];
    
    // UIView另一个用于创建和执行过渡动画的方法
    /*
     * 第1个参数用于设置动画的执行时间。
     * 第2个参数设置动画延时多长时间开始执行。
     * 第3个参数设置动画执行的配置参数。
     * 第4个参数为要执行动画动作的block代码块。
     * 第5个参数为动画效果完成之后执行的代码块。
     */
    /*
     * 可用的动画执行配置参数有：
     * //这部分是基础属性的设置
     * UIViewAnimationOptionLayoutSubviews              // 设置子视图随父视图展示动画
     * UIViewAnimationOptionAllowUserInteraction        // 允许在动画执行时用户与其进行交互
     * UIViewAnimationOptionBeginFromCurrentState       // 允许在动画执行时执行新的动画
     * UIViewAnimationOptionRepeat                      // 设置动画循环执行
     * UIViewAnimationOptionAutoreverse                 // 设置动画反向执行，必须和重复执行一起使用
     * UIViewAnimationOptionOverrideInheritedDuration   // 强制动画使用内层动画的时间值
     * UIViewAnimationOptionOverrideInheritedCurve      // 强制动画使用内层动画曲线值
     * UIViewAnimationOptionAllowAnimatedContent        // 设置动画视图实时刷新
     * UIViewAnimationOptionShowHideTransitionViews     // 设置视图切换时隐藏，而不是移除
     * UIViewAnimationOptionOverrideInheritedOptions    //
     * // 这部分属性设置动画播放的时间函数效果
     * UIViewAnimationOptionCurveEaseInOut              // 淡入淡出首末减速
     * UIViewAnimationOptionCurveEaseIn                 // 淡入，初始减速
     * UIViewAnimationOptionCurveEaseOut                // 淡出，末尾减速
     * UIViewAnimationOptionCurveLinear                 // 线性，匀速执行
     * // 这部分设置UIView切换效果
     * UIViewAnimationOptionTransitionNone              // 默认
     * UIViewAnimationOptionTransitionFlipFromLeft      // 从左边切入
     * UIViewAnimationOptionTransitionFlipFromRight     // 从右边切入
     * UIViewAnimationOptionTransitionCurlUp            // 从上面立体进入
     * UIViewAnimationOptionTransitionCurlDown          // 从下面立体进入
     * UIViewAnimationOptionTransitionCrossDissolve     // 溶解效果
     * UIViewAnimationOptionTransitionFlipFromTop       // 从上面切入
     * UIViewAnimationOptionTransitionFlipFromBottom    // 从下面切入
     * UIViewAnimationOptionPreferredFramesPerSecondDefault         //
     * UIViewAnimationOptionPreferredFramesPerSecond60  //
     * UIViewAnimationOptionPreferredFramesPerSecond30  //
     */
//    [UIView animateWithDuration:3 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.colorView.frame = CGRectMake(100, 100, 100, 100);
//    } completion:^(BOOL finished) {
//        NSLog(@"动画完成");
//    }];
    
    // 阻尼动画
    /*
     * 第1个参数设置动画执行的时长
     * 第2个参数设置动画延时多长时间开始执行。
     * 第3个参数设置阻尼动画的阻尼度，这个参数的取值为0-1之间，越接近1则阻尼越大。
     * 第4个参数设置动画的初始速度。
     * 第5个参数设置动画的配置参数。
     * 第6个参数为要执行动画的属性改变block代码块。
     * 第7个参数为动画执行后的回调block代码。
     */
//    [UIView animateWithDuration:3 delay:1 usingSpringWithDamping:1 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        self.colorView.frame = CGRectMake(100, 100, 100, 100);
//    } completion:nil];
    
    // 多个动画同时执行
//    [UIView animateWithDuration:3 animations:^{
//        self.colorView.frame = CGRectMake(100, 100, 200, 200);
//        self.colorView.backgroundColor = [UIColor blueColor];
//    }];
    
    // 多个动画依次执行
//    [UIView animateWithDuration:3 animations:^{
//        self.colorView.frame = CGRectMake(100, 100, 100, 100);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:2 animations:^{
//            self.colorView.frame = CGRectMake(100, 100, 200, 200);
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:1 animations:^{
//                self.colorView.backgroundColor = [UIColor blueColor];
//            }];
//        }];
//    }];
    
    // 顺时针旋转控件90度
//    [UIView animateWithDuration:3 animations:^{
//        self.colorView.transform = CGAffineTransformMakeRotation(M_PI_4);
//    } completion:^(BOOL finished) {
//    }];
    
    // 使用commit方式进行UIView层过渡动画的创建
    // 注意：
    //  （1）下面过渡动画的4个部分顺序不能颠倒。
    //  （2）如果不调用setAnimationDelegate:方法进行代理的设置，则使用setAnimationWillStartSelector:
    // 方法与setAnimationDidStopSelector：方法设置的回调方法将无效。
    // 提示：
    //      使用block的方式和使用commit的方式完成相同的动画效果，commit的方法更加复杂，代码量也偏多。
    // 如果进行组合动画的开发，则block方式的优势会更加明显。因此，无论从方便开发者角度还是官方推荐的角度，
    // 使用block方式进行UiView层过渡动画都是开发者的首选。
    // 第1部分 开始动画标志
    /*
     * 首先，使用UIView的类方法beginAnimations: context:标记动画开始
     * 第1个参数设置此动画动作的标识符
     * 第2个参数设置
     */
    [UIView beginAnimations:@"test" context:nil];
    // 第2部分 设置动画属性
    // 设置接收动画开始与结束消息的代理类对象
    [UIView setAnimationDelegate:self];
    // 设置动画开始时回调的代理方法
    [UIView setAnimationWillStartSelector:@selector(start)];
    // 设置动画结束后回调的代理方法
    [UIView setAnimationDidStopSelector:@selector(stop)];
    // 设置动画执行的时间
    [UIView setAnimationDuration:3.0];
    // 设置动画结束后回调的代理方法
    [UIView setAnimationDelay:1];
    // 设置动画执行的时间函数类型
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // 设置动画是否自动逆向执行
    [UIView setAnimationRepeatAutoreverses:YES];
    // 设置动画执行的循环次数
    [UIView setAnimationRepeatCount:3];
    // 第3部分 设置要执行动画的属性
    self.colorView.backgroundColor = [UIColor blueColor];
    // 第4部分 提交动画
    // 调用UIView的类方法commintAnimations进行动画的提交。
    // 调用此方法后，过渡动画开始正式执行。
    [UIView commitAnimations];
}

@end
