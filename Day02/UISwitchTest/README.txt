UISwitch 使用示例代码

（1）创建UISwitch控件
	UISwitch *swi = [[UISwitch alloc]init];

（2）设置中心位置，UISwitch控件有特定的UI样式，因此开发者不需要设置其大小尺寸，只需设置它的位置即可。
	swi.center = CGPointMake(100, 100);

（3）设置开启状态的颜色
	swi.onTintColor = [UIColor greenColor];

（4）设置正常状态的颜色
	swi.tintColor = [UIColor redColor];

（5）设置滑块的颜色
	swi.thumbTintColor = [UIColor orangeColor];

（6）设置触发方法
	// 设置触发方法
	[swi addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];

	// 实现触发方法
	- (void)change:(UISwitch *)swi {
    		NSLog(@"%d", swi.on);
	}