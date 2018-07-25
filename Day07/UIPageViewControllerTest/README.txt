UIPageViewController的使用方法

（1）UIPageViewController是一个视图容器，其中各个具体的视图是由独立的ViewController进行维护和管理的，UIPageViewController只作协调与动画配置。

（2）滚动翻页风格的UIPageViewController
	// 进行初始化
	/*
	 * 第1个参数设置UIPageViewController的风格，有两种风格可以选：
     	 *      UIPageViewControllerTransitionStyleScroll   // 设置为滚动视图风格
     	 *      UIPageViewControllerTransitionStylePageCurl // 设置为翻页视图风格
     	 * 第2个参数设置滚动或者翻页的方向，有两种方向：
     	 *      UIPageViewControllerNavigationOrientationHorizontal // 设置为水平滚动或翻页
     	 *      UIPageViewControllerNavigationOrientationVertical   // 设置为垂直滚动或翻页
     	 * 第3个参数为一个配置字典，其用于设置UIPageViewController的一些UI显示参数，支持配置的键值有如下两个：
     	 *      UIPageViewControllerOptionSpineLocationKey      // 设置翻页风格的UIPageViewController中的书脊的位置
     	 *      UIPageViewControllerOptionInterPageSpacingKey   // 用于设置书页之间的间距，需要设置为NSNumber类型。
     	 *  其中书脊位置可以设置为如下枚举，需要注意的是，NSDictionary中只允许设置Objective-C对象类型的数据，可以使用@()方式进行包装：
     	 *      // 无书脊，用于滚动视图风格的UIPageViewController
     	 *      UIPageViewControllerSpineLocationNone
     	 *      // 书脊在左侧或者上侧
     	 *      UIPageViewControllerSpineLocationMin
     	 *      // 书脊在中间
     	 *      UIPageViewControllerSpineLocationMid
     	 *      // 书脊在下侧或者右侧
     	 *      UIPageViewControllerSpineLocationMax
     	 *
     	 */
	self.pageViewControl = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionSpineLocationKey:@(UIPageViewControllerSpineLocationNone), UIPageViewControllerOptionInterPageSpacingKey:@10}];
	self.view.backgroundColor = [UIColor greenColor];

（3）设置翻页视图的尺寸
	self.pageViewControl.view.bounds = self.view.bounds;

（4）设置数据源于代理
	self.pageViewControl.dataSource = self;
	self.pageViewControl.delegate = self;

（5）创建初始界面
	ModelViewController *model = [ModelViewController createWithIndex:1];

（6）设置初始界面
	[self.pageViewControl setViewControllers:@[model] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];

（7）设置是否双面展示
	self.pageViewControl.doubleSided = NO;
	self.dataArray = [[NSMutableArray alloc]init];
	[self.dataArray addObject:model];
	[self.view addSubview:self.pageViewControl.view];

（8）UIPageViewControllerDelegate协议
	#pragma mark -- 实现UIPageViewControllerDelegate协议
	// 设置书脊位置
	- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    		return UIPageViewControllerSpineLocationMid;
	}

（9）UIPageViewControllerDataSource协议
	#pragma mark -- 实现UIPageViewControllerDataSource协议
	// 翻页控制器进行向后翻页动作，这个数据源方法返回的视图控制为要显示视图的视图控制器
	- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    		int index = (int)[self.dataArray indexOfObject:viewController];
    		if (index == 9) {
        		return nil;
    		} else {
        		if (self.dataArray.count - 1 >= (index + 1)) {
            			return self.dataArray[index + 1];
        		} else {
            			ModelViewController *model = [ModelViewController createWithIndex:index + 2];
            			[self.dataArray addObject:model];
            			return model;
        		}
    		}
	}

	// 翻页控制器质性向前翻页动作，这个数据源方法返回的视图控制器为要显示视图的视图控制器
	- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    		int index = (int)[self.dataArray indexOfObject:viewController];
    		if (index == 0) {
        		return nil;
    		} else {
        		return self.dataArray[index - 1];
    		}
	}

	// 设置分页控制器的分页数
	- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    		return 10;
	}

	// 设置初始的分页点
	- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    		return 0;
	}

（10）ModelViewController控制器的实现
    1. ModelViewController.h文件内容：
	#import <UIKit/UIKit.h>

	@interface ModelViewController : UIViewController
	@property (nonatomic, strong) UILabel *indexLabel;

	// 创建自身类对象的类方法
	+ (ModelViewController *)createWithIndex:(int)index;
	@end

    2. ModelViewController.m文件内容：
	#import "ModelViewController.h"

	@interface ModelViewController ()
	@end

	@implementation ModelViewController

	- (void)viewDidLoad {
    		[super viewDidLoad];
	}

	- (void)didReceiveMemoryWarning {
    		[super didReceiveMemoryWarning];
	}

	+ (ModelViewController *)createWithIndex:(int)index {
    		ModelViewController *con = [[ModelViewController alloc]init];
    		con.indexLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 200, 100, 30)];
    		con.indexLabel.text = [NSString stringWithFormat:@"第%d页", index];
    		[con.view addSubview:con.indexLabel];
    		return con;
	}
	@end