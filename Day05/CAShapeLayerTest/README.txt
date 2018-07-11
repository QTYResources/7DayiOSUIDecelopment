CAShapeLayer（图形渲染层）使用方法

（1）创建CAShapeLayer对象
	CAShapeLayer *layer = [CAShapeLayer layer];

（2）设置位置
	layer.position = CGPointMake(0, 0);

（3）设置图形路径
	// 创建图形路径
	CGMutablePathRef path = CGPathCreateMutable();
    	// 路径起始点
	/*
	 * 第1个参数为绘图路径对象
	 * 第2个参数为transform变化参数
	 * 第3个参数为x点坐标
	 * 第4个参数为y点坐标
	 */
	CGPathMoveToPoint(path, 0, 100, 100);
	// 转折点1，参数说明与CGPathMoveToPoint一样
	CGPathAddLineToPoint(path, 0, 300, 100);
	// 转折点2
	CGPathAddLineToPoint(path, 0, 200, 200);
	// 转折点3
	CGPathAddLineToPoint(path, 0, 100, 100);
	// 设置路径
	layer.path = path;

（4)设置填充颜色
	layer.fillColor = [UIColor redColor].CGColor;

（5）设置边框颜色
	layer.strokeColor = [UIColor blueColor].CGColor;

（6）设置边框起始点，这个值是一个比例值，为占周长的比例。
	layer.strokeStart = 0.3;

（7）设置边框结束点，这个值是一个比例值，为占周长的比例。
	layer.strokeEnd = 0.8;

（8）设置边框线条宽度
	layer.lineWidth = 4;

（9）显示图层
	[self.view.layer addSublayer:layer];