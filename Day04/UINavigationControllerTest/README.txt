UINavigationController使用示例代码

（1）设置导航栏的背景颜色
	self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];

（2）设置导航栏的背景图片
	/*
	 * 第1个参数用于设置背景图片
	 * 第2个参数用于设置屏幕的状态，可以为如下参数：
	 *      UIBarMetricsDefault // 默认竖屏模式
	 *      UIBarMetricsCompact // 横屏模式
	 */
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"image"] forBarMetrics:UIBarMetricsDefault];

（3）添加自定义按钮
	/*
	 * 初始化UIBarButtonItem的方法有一下几种：
	 *      UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(click)];
	 *      UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:[[UIView alloc]init]];
	 *      UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"image"] style:UIBarButtonItemStylePlain target:self action:@selector(click)];
	 *      UIBarButtonItem *item4 = [[UIBarButtonItem alloc]initWithTitle:@"标题" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
	 * UIBarButtonItem的系统风格有以下几种：
	 *      UIBarButtonSystemItemDone   // 完成风格的按钮
	 *      UIBarButtonSystemItemCancel // 取消风格的按钮
	 *      UIBarButtonSystemItemEdit   // 编辑风格的按钮
	 *      UIBarButtonSystemItemSave   // 保存风格的按钮
	 *      UIBarButtonSystemItemAdd    // 添加风格的按钮
	 *      UIBarButtonSystemItemFlexibleSpace  // 占位按钮 不显示
	 *      UIBarButtonSystemItemFixedSpace     // 占位按钮 不显示
	 *      UIBarButtonSystemItemCompose        // 构图风格按钮
	 *      UIBarButtonSystemItemReply          // 回复风格的按钮
	 *      UIBarButtonSystemItemAction         // 功能风格的按钮
	 *      UIBarButtonSystemItemOrganize       // 机构风格的按钮
	 *      UIBarButtonSystemItemBookmarks      // 书签风格的按钮
	 *      UIBarButtonSystemItemSearch         // 搜索风格的按钮
	 *      UIBarButtonSystemItemRefresh        // 刷新风格的按钮
	 *      UIBarButtonSystemItemStop           // 停止风格的按钮
	 *      UIBarButtonSystemItemCamera         // 相机风格的按钮
	 *      UIBarButtonSystemItemTrash          // 清除风格的按钮
	 *      UIBarButtonSystemItemPlay           // 播放风格的按钮
	 *      UIBarButtonSystemItemPause          // 暂停风格的按钮
	 *      UIBarButtonSystemItemRewind         // 倒带风格的按钮
	 *      UIBarButtonSystemItemFastForward    // 前进风格的按钮
	 *      UIBarButtonSystemItemUnd NS_ENUM_AVAILABLE_IOS(3_0) // 撤销风格的按钮
	 *      UIBarButtonSystemItemRedo NS_ENUM_AVAILABLE_IOS(3_0) // 重做风格的按钮
	 *      UIBarButtonSystemItemPageCurl NS_ENUM_DEPRECATED_IOS(4_0, 11_0) // 页面卷曲风格的按钮 只能用于工具栏
	 */
	UIBarButtonItem *btnItem1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(click)];
	UIBarButtonItem *btnItem2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(click)];
	self.navigationItem.leftBarButtonItems = @[btnItem1, btnItem2];

（4）自定义返回按钮
	self.navigationItem.backBarButtonItem = btnItem1;

（5）显示导航栏控制器的工具栏
	self.navigationController.toolbarHidden = NO;

（6）设置工具栏颜色
	self.navigationController.toolbar.barTintColor = [UIColor redColor];

（7）设置工具栏按钮
	UIBarButtonItem *btnItem3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(click)];
	UIBarButtonItem *btnItem4 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(click)];
	self.toolbarItems = @[btnItem3, btnItem4];

（8）hidesBarsWhenVerticallyCompact属性设置为YES，则当设备横屏是导航栏和工具栏会自动隐藏。
	self.navigationController.hidesBarsWhenVerticallyCompact = YES;

（9）hidesBarsOnTap属性设置为YES，则当用户点击屏幕时导航栏和工具栏会自动隐藏。
	self.navigationController.hidesBarsOnTap = YES;

（10）hidesBarsWhenKeyboardAppears属性设置为YES，则当键盘弹起式导航栏和工具栏会自动隐藏。
	self.navigationController.hidesBarsWhenKeyboardAppears = YES;

（11）hidesBarsOnSwipe属性设置为YES，则当用户滑动屏幕时，导航栏和工具栏会自动隐藏。
	self.navigationController.hidesBarsOnSwipe = YES;

（12）跳转方法
    1. 压入视图
	[self.navigationController pushViewController:con animated:YES];

    2. 弹出视图
	[self.navigationController popViewControllerAnimated:YES];