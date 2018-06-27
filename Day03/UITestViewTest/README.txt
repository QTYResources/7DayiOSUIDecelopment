UITextView使用示例代码

（1）创建UITextView控件
	UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 100, 280, 200)];

（2）设置背景颜色
	textView.backgroundColor = [UIColor grayColor];

（3）设置字体
	textView.font = [UIFont italicSystemFontOfSize:20];

（4）设置字体颜色
	textView.textColor = [UIColor whiteColor];

（5）设置支持的超链接类型
	/*
	 * 支持的超链接类型有：
	 *      UIDataDetectorTypePhoneNumber // 电话号码
	 *      UIDataDetectorTypeLink // 网址链接
	 *      UIDataDetectorTypeAddress // 地址
	 *      UIDataDetectorTypeCalendarEvent // 日历事件
	 *      UIDataDetectorTypeNone // 不支持任何链接类型
	 *      UIDataDetectorTypeAll // 所有链接类型
	 *
	 */
	textView.dataDetectorTypes = UIDataDetectorTypeAll;
    提示：
	被识别的链接显示出蓝色的字样，当用户点击这串数字时，系统会自动跳转到拨号界面。注意，只有在真机上才能看到跳转效果，模拟器并没有拨号界面，不能进行跳转。

（6）设置是否允许用户输入
	textView.editable = NO;

（7）设置是否可以进行文字选中操作
	textView.selectable = YES;

（8）设置默认显示的文字
	textView.text = @"PhoneNum:\n13859939873";

（9）设置文字对齐方式
	textView.textAlignment = NSTextAlignmentCenter;

（10）设置代理
	// 视图控制器实现UITextViewDelegate协议
	@interface ViewController ()<UITextViewDelegate>
	@end

	// 设置UITextView的代理
	textView.delegate = self;

	// 实现UITextViewDelegate协议
	#pragma mark -- 实现UITextViewDelegate协议
	// UITextView控件中字符将要改变时触发的方法
	- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
		return YES;
	}

	// UITextView控件已经开始编辑时触发的方法
	- (void)textViewDidBeginEditing:(UITextView *)textView {
	}

	// UITextView控件将要开始编辑时触发的方法
	- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
		return YES;
	}

	// UITextView控件中选中的文字改变时触发的方法
	- (void)textViewDidChangeSelection:(UITextView *)textView {
	}

	// UITextView控件中字符改变后触发的方法
	- (void)textViewDidChange:(UITextView *)textView {
	}

	// UITextView控件结束编辑时触发的方法
	- (void)textViewDidEndEditing:(UITextView *)textView {
	}

	// UITextView控件将要结束编辑时触发的方法
	- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
		return YES;
	}

    UITextViewDelegate中约定了许多监听UITextView的状态供给开发者进行使用。UITextView继承于UIScrollView，UITextViewDelegate也是由UIScrollViewDelegate扩展而来的，因此所有UIScrollViewDelegate协议中的方法在UITextViewDelegate中都有定义。

    提示：
	关于UITextView的选中文字，我们可以通过下面属性来获取UITextView对象中选中的文字范围。
	- (void)textViewDidChangeSelection:(UITextView *)textView {
		NSRange range = textView.selectedRange;
	}