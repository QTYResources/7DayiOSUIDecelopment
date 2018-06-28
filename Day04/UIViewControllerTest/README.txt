UIViewController使用示例代码

（1）UIViewController中与生命周期相关的函数有很多，列举如下：
	// 类的初始化方法，从归档文件进行初始化会调用这个方法
	+ (void)initialize;
	// 对象初始化方法，从代码进行初始化会调用这个方法
	- (instancetype)init;
	// 从归档初始化
	- (instancetype)initWithCoder:(NSCoder *);
	// 从nib文件初始化，方法会在从xib或者storyboard中加载的UIViewController将要激活时被调用
	- (void)awakeFromNib;
	// 加载视图，这个方法在UIViewController的生命周期中只会被调用一次，除非开发者手动调用
	- (void)loadView;
	// 加载视图完成，该方法在视图已经加载完成后会被调用，因为这个函数调用的时候UIViewController对象的基本系统功能已经初始化完成，开发者一般会将一些UIViewController对象额外定义功能的初始化工作放在这个函数。
	- (void)viewDidLoad;
	// 方法在视图即将显示的时候调用
	- (void)viewWillAppear:(BOOL)animated;
	// 方法在视图布局完成其子视图时被调用
	- (void)viewWillLayoutSubviews;
	// 方法在视图布局完成其子视图时被调用
	- (void)viewDidLayoutSubviews;
	// 内存警告
	- (void)didReceiveMemoryWarning;
	// 方法在视图已经显示后被调用
	- (void)viewDidAppear:(BOOL)animated;
	// 方法在视图将要消失时调用，开发者可以在其中做一些数据清理的操作
	- (void)viewWillDisappear:(BOOL)animated;
	// 方法在视图已经消失时被调用
	- (void)viewDidDisappear:(BOOL)animated;
	// 方法是对象的销毁方法，在对象被释放时调用，开发者可以通过在其中打印信息的方式检查一个类是否存在内存泄漏等问题。
	- (void)dealloc;

    提示：dealloc方法不需要并且也不能在实现里调用父类方法的函数，这个函数在ARC（自动引用计数）环境中不再被开发者所需要，但是开发依然可以重写这个函数来监测内存的释放情况。

（2）Xcode开发工具的视图层级调试
    Xcode的视图层级调试按钮是Debug区域Debug View Hierarchy按钮。对应开发层级十分复杂的界面，通过视图层级的debug调试可以十分方便地进行检查和排错。

（3）UIViewController的切换跳转
	// 创建要切换的视图控制器
    	ViewControllerTwo *controller = [[ViewControllerTwo alloc]init];
	// 切换视图控制器
	/*
     	 * 第1个参数是将要跳转的视图控制器
     	 * 第2个参数决定跳转的过程是否展示动画
     	 * 第3个参数为一个block函数，在跳转完成后，block的代码会被执行。
     	 */
    	[self presentViewController:controller animated:YES completion:^ {
        	NSLog(@"切换完成");
    	}];

（4）返回到跳转前的视图控制器
	// 返回到跳转前的视图控制器
    	/*
     	 * 第1个参数决定是否在返回时展示动画效果
     	 * 第2个参数是返回完成后回调的block函数块
     	 */
    	[self dismissViewControllerAnimated:YES completion:^{
        	NSLog(@"返回结束");
    	}]；