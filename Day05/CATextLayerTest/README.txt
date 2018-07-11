CATextLayer（文本绘制层）使用方法

    CATextLayer用于进行视图上文本的绘制，UIKit框架中最基础的UILabel控件就是基于CATextLayer而实现的。CALayer家族中还有一个十分强大的类--CAEmitterLayer，其专门用来处理一些粒子效果生成的动画。
  
（1）创建CATextLayer对象
	CATextLayer *layer = [CATextLayer layer];

（2）设置尺寸
	layer.bounds = CGRectMake(0, 0, 320, 100);

（3）设置位置
	layer.position = CGPointMake(160, 100);

（4）设置文本
	layer.string = @"我是文字Layer";

（5）设置文本大小
	layer.fontSize = 25;

（6）设置文字颜色
	layer.foregroundColor = [UIColor redColor].CGColor;

（7）设置文字对齐方式
	layer.alignmentMode = kCAAlignmentCenter;

（8）显示图层
	[self.view.layer addSublayer:layer];

