CATransition（转场动画）使用方法

（1）创建CALayer对象
	CALayer *layer =[CALayer layer];

（2）设置尺寸
	layer.bounds = CGRectMake(0, 0, 100, 100);

（3）设置位置
	layer.position = CGPointMake(100, 100);

（4）设置背景颜色
	layer.backgroundColor = [UIColor redColor].CGColor;

（5）创建CATransition对象
	CATransition *ani = [CATransition animation];

（6）设置转场动画的类型
	/*
	 * 可选的参数字符串有：
	 *      kCATransitionFade       // 淡入
	 *      kCATransitionMoveIn     // 移入
	 *      kCATransitionPush       // 压入
	 *      kCATransitionReveal     // 溶解
	 */
	ani.type = kCATransitionPush;

（7）设置动画执行的方向
	/*
	 * 可选的参数字符串有：
	 *      kCATransitionFromRight      // 从右测进
	 *      kCATransitionFromLeft       // 从左侧进
	 *      kCATransitionFromTop        // 从上侧进
	 *      kCATransitionFromBottom     // 从下侧进
	 */
	ani.subtype = kCATransitionFromRight;

（8）设置动画时间
	ani.duration = 3;

（9）添加动画
	[layer addAnimation:ani forKey:@""];

（10）执行动画
	[self.view.layer addSublayer:layer];

（11）提示：关于CATransition类中type属性定义的动画效果，除了官方文档中定义的上述4种外，还有一些私有的类型可以使用。需要注意的是，使用私有的动画类型在提交AppStore时很可能会被拒绝。可用的私有动画类型如下：
	pageCurl        // 翻页效果动画
	rippleEffect    // 滴水效果动画
	suckEffect      // 收缩效果，如一块布被抽走
	cube            // 立方体效果
	oglFlip         // 上下翻转效果