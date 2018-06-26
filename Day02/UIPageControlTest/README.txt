UIPageControl使用示例代码

（1）创建分页控制器控件
	UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(20, 100, 280, 30)];

（2）设置分页数
	pageControl.numberOfPages = 10;

（3）设置当前所在的分页点
	pageControl.currentPage = 5;

（4）进行颜色设置
	pageControl.pageIndicatorTintColor = [UIColor blackColor];
	pageControl.currentPageIndicatorTintColor = [UIColor greenColor];

（5）添加触发方法
	[pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];

	// 实现分页控制器的触发方法
	- (void)pageChange:(UIPageControl *)page {
  		// 打印当前所在页码
  		NSLog(@"%lu", page.currentPage);
	}