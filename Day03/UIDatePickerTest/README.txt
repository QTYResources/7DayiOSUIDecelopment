UIDatePicker使用示例代码

（1）创建UIDatePicker对象
	UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(20, 100, 280, 150)];

（2）设置日期选择器模式
	/*
	 * UIDatePickerModeTime           // 时间模式
	 * UIDatePickerModeDate           // 日期模式
	 * UIDatePickerModeDateAndTime    // 时间日期模式
	 * UIDatePickerModeCountDownTimer // 计时模式
	 */
	datePicker.datePickerMode = UIDatePickerModeTime;

（3）设置触发方法
	[datePicker addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];

	// 实现触发方法
	- (void)change:(UIDatePicker *)picker {
		NSLog(@"%@", picker.date);
	}