CAGradientLayer(色彩梯度层）使用方法

CAGradientLayer类是继承于CALayer类的子类，其专门用来创建颜色梯度渐变的视图效果。

（1）初始化CAGradientLayer对象
	CAGradientLayer *layer = [CAGradientLayer layer];

（2）设置梯度颜色数组
	layer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor];

（3）设置尺寸
	layer.bounds = CGRectMake(0, 0, 100, 100);

（4）设置位置
	layer.position = CGPointMake(100, 100);

（5）设置颜色梯度分界
	layer.locations = @[@0.2];

（6）设置颜色梯度起始点
	layer.startPoint = CGPointMake(0, 0);

（7）设置颜色梯度终止点
	layer.endPoint = CGPointMake(1, 1);

（8）显示色彩梯度层
	[self.view.layer addSublayer:layer];