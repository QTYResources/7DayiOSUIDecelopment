LoginView示例代码，即UITextField控件的使用示例代码

（1）创建UITextField控件
	UITextField *userNameField = [[UITextField alloc]initWithFrame:CGRectMake(40, 120, 240, 40)];
	

（2）设置UITextField的风格
	userNameField.borderStyle = UITextBorderStyleRoundedRect;

（3）设置UITextField的提示文字
	userNameField.placeholder = @"请输入用户名";

（4）设置UITextField的挂件视图
	// 创建挂件视图对象
	UIImageView *userImage = [[UIImageView alloc]initWithFrame；CGRectMake(0, 0, 30, 30)];
	userImage.image = [UIImage imageNamed:@"login_user"];
	// 设置输入框的左挂件视图
	userNameField.leftView = userImage;
	// 设置挂件视图的显示方式
	userNameField.leftViewMode = UITextFieldViewModeAlways;
	// 设置输入框的右挂件视图
	userNameField.rightView = userImage;
	// 设置挂件视图的显示方式
	userNameField.rightViewMode = UITextFieldViewModeAlways;

（5）设置UITextField控件的代理
	// 视图实现UITextFieldDelegate代理协议
	@interface ViewController() <UITextFieldDelegate>
	@end

	// 设置UITextField的代理为当前视图
	userNameField.delegate = self;

	// 实现代理方法
	#pragma mark -- 实现UITextFieldDelegate协议
	// 当输入框内字符改变时调用
	- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
		if (string.length > 0) {
			if ([string characterAtIndex:0] <= '9' && [string characterAtIndex:0] >= '0') {
				if (textField.text.length <= 10) {
					return YES;
				}
			}
			NSLog(@"请输入正确的手机号");
			return NO;
		}
		return YES;
	}

	// 当按下Enter键后调用
	- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    		[textField resignFirstResponder];
    		return YES;
	}

（6）隐藏键盘，可以手动注销第一响应者来隐藏键盘
	[userNameField resignFirstResponder];
    可以在以下方法中调用上面的方法来隐藏键盘
    1. 在UITextField控件的代理方法- (BOOL)textFieldShouldReturn:(UITextField *)textField;中添加该代码来隐藏键盘：
	// 当按下Enter键后调用
	- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    		[textField resignFirstResponder];
    		return YES;
	}

    2. 也可以重写视图的- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;中添加该代码来隐藏键盘：
	// 重写UIViewController的touchBegin方法
	- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    		[self.userNameField resignFirstResponder];
	}
