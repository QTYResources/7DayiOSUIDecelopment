UIActivityIndicatorView 使用示例代码

（1）创建活动指示器对象
	UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
 
（2）设置活动指示器的中心位置，活动指示器同样属于特殊的系统控件，不需要设置控件的尺寸，只要设置控件的中心位置即可。
	activityView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);

（3）如果不调用活动指示器的startAnimatng方法，则活动指示器不仅不能旋转，也不会展现在视图上。系统的UIActivityIndicatorView控件默认在停止动画的时候自动隐藏，可以通过如下设置使指示器控件不进行自动隐藏
	activityView.hidesWhenStopped = NO;

（4）开启活动指示器动画
	[activityView startAnimating];

（5）停止活动指示器动画
	[activityView stopAnimating];