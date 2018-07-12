CAKeyframeAnimation使用方法

（1）创建关键帧动画
	CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];

（2）设置关键帧数组
	ani.values = @[[NSValue valueWithCGPoint:CGPointMake(50, 100)], [NSValue valueWithCGPoint:CGPointMake(120, 100)], [NSValue valueWithCGPoint:CGPointMake(120, 200)],[NSValue valueWithCGPoint:CGPointMake(200, 200)]];

（3）设置每段动画的时间占比，其取值范围在0-1之间且递增
	ani.keyTimes = @[@0, @0.5, @0.8, @1];

（4）设置动画时间
	ani.duration = 3;

（5）执行动画
	[self.layer addAnimation:ani forKey:@""];