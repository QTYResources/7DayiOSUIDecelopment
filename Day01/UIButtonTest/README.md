UIButtonTest的使用方法示例

#####（1）创建UIButton对象
	>UIButton *button = [[UIButton alloc]init];
#####（2）创建系统风格的UIButton对象
	>UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
#####（3）设置UIButton的尺寸
	>button.frame = CGRectMake(100, 100, 100, 30);
#####（4）根据UIButton的不同状态设置相应的标题
	>[button setTitle:@"按钮" forstate:UIControlStateNormal];
#####（5）设置UIButton的标题颜色
	>button.tintColor = [UIcolor redColor];
#####（6）根据UIButton的不同状态设置相应的标题颜色
	>[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
#####（7）设置UIButton的背景颜色
	>button.backgroundColor = [UIColor blueColor];
#####（8）根据UIButton的不同状态设置相应的背景图片
	>[button setBackgroundImage:[UIImage imageNamed:@"灯泡" forState:UIControlStateNormal];
#####（9）添加UIButton的触发方法
	>[button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
#####（10）修改视图背景颜色
	>self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];


