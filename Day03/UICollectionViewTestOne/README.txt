UICollectionView使用示例代码

（1）创建UIColloctionView布局策略
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

（2）设置布局方向
	/*
	 * 可用的布局方向有：
	 *      UICollectionViewScrollDirectionVertical // 竖直方向
	 *      UICollectionViewScrollDirectionHorizontal // 水平方向
	 */
	layout.scrollDirection = UICollectionViewScrollDirectionVertical;

（3）设置其中每个暑假载体Item的尺寸
	layout.itemSize = CGSizeMake(100, 100);

（4）设置最小行间距
	layout.minimumLineSpacing = 30;

（5）设置最小列间距
	layout.minimumInteritemSpacing = 10;

（6）创建UIColloctionView视图控件
	UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];

（7）设置背景颜色
    collectionView.backgroundColor = [UIColor whiteColor];

（8）进行数据载体Item的注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];

（9）设置代理
	// 视图控制器实现UICollectionViewDelegate
	@interface ViewController ()<UICollectionViewDelegate>
	@end
    
	// 设置UICollectionView代理
	collectionView.delegate = self;

	// 实现UICollectionViewDelegate方法
	#pragram mark -- 实现UICollectionViewDelegate协议

    提示：可以设置UICollectionView的代理为UICollectionViewDetelateFlowLayout协议，该协议中定义了许多灵活布局的相关方法，例如，下面的代理方法中可以灵活设置每个item的尺寸大小：
	// 实现UICollectionViewDelegate协议方法
	#pragma mark -- 实现UICollectionViewDelegateFlowLayout协议
	// 设置每个item的尺寸大小
	- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
		if (indexPath.row % 2 == 0) {
			return CGSizeMake(50, 50);
		} else {
			return CGSizeMake(100, 100);
		}
	}

（10）设置数据源
	// 视图控制器实现UICollectionViewDataSource协议
	@interface ViewController ()<UICollectionViewDataSource>
	@end
    
	// 设置UICollectionView数据源
    	collectionView.dataSource = self;

	// 实现UICollectionViewDataSource协议方法
	#pragma mark -- 实现UICollectionViewDataSource协议
	// 设置分组数
	- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
		return 1;
	}

	// 设置每个分组的Item数
	- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
		return 10;
	}

	- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
		UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
		cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() %255 / 255.0 alpha:1];
		return cell;
	}

（11）自定义布局策略
    1. 创建自定义类MyLayout，使其继承自UICollectionViewFlowLayout类。

    2. MyLayout.h代码如下：
	#import <UIKit/UIKit.h>

	@interface MyLayout : UICollectionViewFlowLayout
	@property (nonatomic, assign) int itemCount;
	@end

    3. MyLayout.m代码如下：
	#import "MyLayout.h"

	@implementation MyLayout
	{
    	// 这个竖直是我们自定义的布局配置数组
    	NSMutableArray *_attributeArray;
	}

	// 数组的相关设置在这个方法中
	// 布局前的准备会调用这个方法
	- (void)prepareLayout {
    		_attributeArray = [[NSMutableArray alloc] init];
    		// 为方便演示，我们设置为静态的2列
    		// 计算每一个Item的宽度
    		float WIDTH = ([UIScreen mainScreen].bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing) / 2;
    		// 定义数组保存每一列的高度
    		// 这个数组的主要作用是保存每一列的总高度，这样在布局是，我们可以始终将下一个Item放在最短的列下面
    		CGFloat colHight[2] = {self.sectionInset.top, self.sectionInset.bottom};
    		// itemCount是外界传进来的Item的个数，遍历来设置每一个Item的布局
    		for (int i = 0; i < _itemCount; i++) {
        		// 设置每个Item的位置等相关属性
        		NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        		// 创建一个布局属性类，通过indexPath来创建
        		UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        		// 随机一个高度，在40-190之间
        		CGFloat hight = arc4random() % 150 + 40;
        		// 哪一列高度小，则放到那一列下面
        		// 标记最短的列
        		int width = 0;
        		if (colHight[0] < colHight[1]) {
            			// 将新的Item 高度加入短的一列
            			colHight[0] = colHight[0] + hight + self.minimumLineSpacing;
            			width = 0;
        		} else {
            			colHight[1] = colHight[1] + hight + self.minimumLineSpacing;
            			width = 1;
        		}
        
        		// 设置Item的位置
        		attris.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + WIDTH) * width, colHight[width] - hight - self.minimumInteritemSpacing, WIDTH, hight);
        		[_attributeArray addObject:attris];
    		}
    
    		// 设置itemSize，确保滑动范围在正确区间，这里是通过将所有的Item高度平均化计算出来的
    		// （以最高的列为标准）
    		if (colHight[0] > colHight[1]) {
        		self.itemSize = CGSizeMake(WIDTH, (colHight[0] - self.sectionInset.top)  * 2 / _itemCount - self.minimumLineSpacing);
    		} else {
        		self.itemSize = CGSizeMake(WIDTH, (colHight[1] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
    		}
	}

	// 这个方法会返回设置好的布局数组
	- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    		return _attributeArray;
	}
	@end

    4. 在视图控制器中使用自定义布局
	#import "ViewController.h"
	#import "MyLayout.h"

	@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

	@end

	@implementation ViewController

	- (void)viewDidLoad {
    		[super viewDidLoad];
		// 使用自定义的layout类
    		MyLayout *layout = [[MyLayout alloc]init];
    		layout.itemCount = 20;
    		UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    		collectionView.backgroundColor = [UIColor whiteColor];
    		[collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    		collectionView.delegate = self;
    		collectionView.dataSource = self;
    		[self.view addSubview:collectionView];
	}

	// 实现UICollectionViewDataSource协议方法
	#pragma mark -- 实现UICollectionViewDataSource协议
	// 设置分组数
	- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    		return 1;
	}

	// 设置每个分组的Item数
	- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
		return 20;
	}

	- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    		UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    		cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() %255 / 255.0 alpha:1];
    		return cell;
	}
