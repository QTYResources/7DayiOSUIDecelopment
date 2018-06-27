UIAlertController使用方法

（1）创建警告控制器对象
	/**
	 * 第1个参数设置警告视图的标题
	 * 第2个参数设置警告的内容
	 * 第3个参数设置警告控制器的风格，主要有以下风格：
	 *      UIAlertControllerStyleActionSheet // 活动列表风格
	 *      UIAlertControllerStyleAlert // 警告框风格
	 */
	UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleAlert];

（2）设置警告框按钮
	// 创建按钮
	/**
	 * 第1个参数设置按钮的标题
	 * 第2个参数设置按钮的风格，主要有以下风格：
	 *      UIAlertActionStyleDefault // 默认风格
	 *      UIAlertActionStyleCancel  // 取消风格
	 *      UIAlertActionStyleDestructive // 注意风格
	 * 第3个参数设置点击按钮后的触发方法block
	 */
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
		NSLog(@"click");
	}];
	// 添加按钮
	[alertCon addAction:action];
	
（3）添加一个文本控件
	[alertCon addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		textField.placeholder = @"文本框1";
	}];
    注意：在block参数中可以对要添加的文本输入框进行自由地设置与扩展。

（4）显示警告框
	[self presentViewController:alertCon animated:YES completion:nil];

注意：
    1. 因为UIAlertController是一种视图控制器，所以需要使用presentViewController: animated: completion: 方法进行弹出。
    2. 只有当UIAlertController为UIAlertControllerStyleAlert风格时，才可以使用addTextFieldWithConfiguraactionHandler: 方法进行文本输入框的添加，否则程序运行会出错。
    3. 虽然UIAlertController有很大的优势，但器兼容性并不好，毕竟现在依然存在很多iOS7系统的设备。要增强程序的兼容性，建议不要舍弃UIAlertView和UIActionSheet。