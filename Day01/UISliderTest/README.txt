UISlider使用示例代码

（1）创建UISlider控件
	UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];

（2）UISlider控件的value值属性取值范围默认是0~1，可以通过下面属性进行自定义的设置：minimumValue属性设置value属性取值的最小值，maximumValue属性设置value取值的最大值。
	// 设置最小值
	slider.minimumValue = 0;
	// 设置最大值
	slider.maxmumValue = 10;

（3）设置中轴左边颜色
	slider.minimumTrackTintColor = [UIColor blueColor];

（4）设置中轴右边颜色
	slider.maxmumTrackTintColor = [UIColor greenColor];

（5）设置滑块的颜色
	slider.thumbTintColor = [UIColor purpleColor];

（6）设置左边挂件图片
	slider.minmumValueImage = [UIImage imageNamed:@"cj_mxz_xingxing"];

（7）设置右边挂件图片
	slider.maxmumValueImage = [UIImage imageNamed:@"cj_xz_xingxing"];

（8）UISlider控件的continuous属性是一个BOOL类型的值，默认为YES，这时只要用户滑动滑块，添加的触发方法就会连续调用。如果设置为NO，则当用户按住滑块进行拖曳操作时，控件提那家的触发方法并不会调用，只有当用户松开手指时，触发方法才会被调用一次，Slider控制的value值为最终变化到的value值
    slider.continuous = NO;

（9）设置UISlider的触发方法
	// 设置控件触发方法
	[slider addTarget:self action:@selector(changeBG:) forControlEvents:UIControlEventValueChanged];

	// 实现UISlider控件的触发方法
	- (void)changeBG:(UISlider *)slider {
    		self.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1 - slider.value];
	}