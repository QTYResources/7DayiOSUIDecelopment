UIAlertView使用示例代码

（1）常见警告框控件
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告标题" message:@"警告内容" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];

（2）设置警告框风格
	/*
 	 * UIAlertViewStyleDefault 默认风格
	 * UIAlertViewStyleSecureTextInput 加密输入风格
	 * UIAlertViewStylePlainTextInput 文本输入风格
	 * UIAlertViewStyleLoginAndPasswordInput 登录信息输入风格	 
	 */
	alert.alertViewStyle = UIAlertViewStyleDefault;

（3）弹出警告框
    [alert show];
    注意：
	1. 创建警告框后，必须调用UIAlertView的类方法show才能弹出警告框。
	2. 警告框中的按钮排列有这样一个规定，如果按钮数不超过两个，则会横向排列；如果按钮数超过两个，则会纵向排列。

（4）设置警告框代理
	// ViewController实现UIAlertViewDelegate协议
	@interface ViewController () <UIAlertViewDelegate>
	@end

	// UIAlertView设置协议
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告标题" message:@"警告内容" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];

	// 实现UIAlertViewDelegate协议方法
	#pragma mark -- 实现UIAlertViewDelegate协议方法
	// 点击按钮后系统调用的方法
	- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	}

	// 警告框将要消失时调用的方法
	- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
	}

	// 警告框已经消失时调用的方法
	- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	}
@end