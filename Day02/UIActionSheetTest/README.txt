UIActionSheet使用示例代码

（1）创建活动列表控件
	/*
	 * 创建活动列表控件
	 * 第1个参数设置活动列表的标题
	 * 第2个参数设置UIActionSheet对象的代理
	 * 第3个参数设置取消按钮的标题
	 * 第4个参数设置警告按钮的标题
	 * 第5个参数设置其他按钮的标题，如果还有更多选项的按钮的需求，则可以在后面继续添加参数，以逗号进行分割。
	 */
	UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"活动列表标题" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注意" otherButtonTitles:@"确定", nil];

（2）展示活动列表
	[actionSheet showInView:self.view];


（3）设置代理
	// 视图控制器实现UIActionSheetDelegate协议
	@interface ViewController ()<UIActionSheetDelegate>
	@end

	// UIActionSheet设置代理
	UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"活动列表标题" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注意" otherButtonTitles:@"确定", nil];

	// 实现UIActionSheetDelegate协议方法
	#pragma mark -- 实现UIActionSheetDelegate协议
	// 点击按钮触发的方法
	- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	}

	// 活动列表将要消失是触发的方法
	- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
	}

	// 活动列表已经消失时触发的方法
	- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
	}
	