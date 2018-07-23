Autolayout使用方法（五）—— 高度自适应输入框


（1）进行文本输入框初始化
	self.textView = [[UITextView alloc]init];
	self.textView.layer.borderColor = [[UIColor grayColor]CGColor];
	self.textView.layer.borderWidth = 1;
	self.textView.translatesAutoresizingMaskIntoConstraints = NO;
	self.textView.delegate = self;
	[self.view addSubview:self.textView];

（2）使用VFL进行约束的创建
	// 注意在使用VFL时，字典映射的两个字符串必须相同，比如下面的textView，在代码中，我们可以使用self.textView或_textView来表示。但是在VFL中中只可以使用_textView来表示，否则会报错。
	self.array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[_textView]-100-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_textView)];
	self.array2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[_textView(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_textView)];

（3）添加约束
    [self.view addConstraints:self.array1];
    [self.view addConstraints:self.array2];

（4）自适应高度
	#pragma mark -- 实现UITextViewDelegate协议
	- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
		// 当文本高度大于textView的高度并且小于100时，更新约束
		if (textView.contentSize.height > textView.frame.size.height && textView.contentSize.height < 100) {
			float hight = textView.contentSize.height;
			// 将以前的约束移除
			[self.view removeConstraints:self.array1];
			[self.view removeConstraints:self.array2];
			// 创建新的约束
			self.array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[textView]-100-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(textView)];
			self.array2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[textView(hight)]-100-|" options:0 metrics:@{@"hight":[NSNumber numberWithFloat:hight]} views:NSDictionaryOfVariableBindings(textView)];
			[self.view addConstraints:self.array1];
			[self.view addConstraints:self.array2];
		}
		// 更新约束
		//[self.view updateConstraintsIfNeeded];
		// 运行工程，可以看到文本框会随着文字的高度进行高度自适应，但是仔细观察会发现，文本框的高度改变是瞬间完成的。这给用户的感觉将十分突兀。autolayout实际上是支持在UIView层动画中进行渐变动画的操作的，在上面方法调用updateConstrainsIfNeeded的地方添加如下代码，就会使autolayout约束的更新以过渡效果进行展示：
		[UIView animateWithDuration:1 animations:^{
			self.view layoutIfNeeded];
		}];
		return YES;
	}