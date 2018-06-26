UIProgressView使用示例代码

（1）创建进度条控件
	UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(20, 100, 280, 20)];

（2）设置已走过的进度条的颜色
	progressView.progressTintColor = [UIColor redColor];

（3）设置未走过的进度条的颜色
	progressView.trackTintColor = [UIColor greenColor];

（4）设置已走过的进度条的图片
	progressView.progressImage = [UIImage imageNamed:@"imageName"];

（5）设置未走过的进度条的图片
	progressView.trackImage = [UIImage imageNamed:@"imageName"];

（6）设置进度条已走过的进度值
 	progressView.progress = 0.5;