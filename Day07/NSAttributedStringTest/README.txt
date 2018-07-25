NSAttributedString和NSMutableAttributedString的使用方法

（1）NSAttributedString的使用方法
	// 字符串属性字典
	NSMutableDictionary *attriDic = [[NSMutableDictionary alloc]init];
	// 设置字体
	[attriDic setObject:[UIFont italicSystemFontOfSize:20] forKey:NSFontAttributeName];
	// 设置文字颜色
	[attriDic setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
	// 设置背景颜色
	[attriDic setObject:[UIColor greenColor] forKey:NSBackgroundColorAttributeName];
	// 设置下划线风格
	[attriDic setObject:@(NSUnderlineStyleDouble) forKey:NSUnderlineStyleAttributeName];
	NSAttributedString * attriStr = [[NSAttributedString alloc]initWithString:@"My name is 辉少, Welcome to iOS world!" attributes:attriDic];
	UILabel *label = [[UILabel alloc]init];
	label.frame = CGRectMake(20, 100, 300, 80);
	label.numberOfLines = 0;
	label.attributedText = attriStr;
	[self.view addSubview:label];

（2）NSMutableAttributedString的使用方法
	NSMutableAttributedString *mutableStr = [[NSMutableAttributedString alloc]initWithString:@"MY name is 珲少, welcome to iOS world!"];
	// 添加属性
	/*
     	 * 第1个参数用于设置要添加的属性的键名
     	 * 第2个参数设置键名对应的具体属性值
     	 * 第3个参数设置添加的属性所生效的文字范围，需要设置为NSRange对象，使用NSMakeRange()方法可以创建一个NSRange对象
     	 * NSMakeRange()方法中第1个参数设置范围的起点，第2个参数设置生效的位数。
     	 */
    	[mutableStr addAttribute:NSFontAttributeName value:[UIFont italicSystemFontOfSize:40] range:NSMakeRange(0, 5)];
    	[mutableStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6, 10)];
    	[mutableStr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleThick) range:NSMakeRange(11, 10)];
    	UILabel *label = [[UILabel alloc]init];
    	label.frame = CGRectMake(20, 100, 300, 80);
    	label.numberOfLines = 0;
    	label.attributedText = mutableStr;
    	[self.view addSubview:label];