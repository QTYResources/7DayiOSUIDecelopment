CAAnimationGroup（组合动画）使用方法

（1）创建动画1
	CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
	ani1.toValue = (id)[UIColor blueColor].CGColor;

（2）创建动画2
	CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"position"];
	ani2.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];

（3）创建动画组合
	CAAnimationGroup *group = [CAAnimationGroup animation];

（4）设置动画时间
	group.duration = 3;

（5）设置动画数组
	group.animations = @[ani1, ani2];

（6）执行动画
	[self.layer addAnimation:group forKey:@""];