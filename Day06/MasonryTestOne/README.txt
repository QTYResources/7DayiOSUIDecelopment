Masonry使用方法

（1）Masonry的github地址：https://github.com/SnapKit/Masonry
 
（2）使用CocoaPods安装Masonry:
	1. 创建工程目录
	2. 在工程目录中创建工程工作空间Workspace
	3. 在工程目录中创建工程，并将工程添加到工程工作空间中。
	4. 在工程目录中打开终端，执行pod init命令。
	5. 在工程文件夹中打开Podfile文件，修改文件成如下内容：
        	# Uncomment the next line to define a global platform for your project
        	platform :ios, '9.0'
 
        	target 'MasonryTestOne' do
        	# Uncomment the next line if you're using Swift or would like to use dynamic frameworks
        	# use_frameworks!
 
        	# Pods for MasonryTestOne
 
            	pod 'Masonry'
 
        	end
	6. 在工程目录中执行pod install命令。
	7. 以后打开工程时，必须使用工作空间进行打开。

（3）初始化视图控件
	UILabel *label = [[UILabel alloc]init];
	[self.view addSubview:label];

（4）添加Masonry约束
	// 需要注意的是，使用mas_makeConstraints:为视图控件创建约束时，必须先将其添加在他的父视图上。
	[label mas_makeConstraints:^(MASConstraintMaker *make) {
		// 将视图控件的中心约束等于其父视图的中心
		make.center.equalTo(self.view);
		// 约束控件的高度为50个单位
		make.height.equalTo(@50);
		make.width.equalTo(@50);
	}];
	label.backgroundColor = [UIColor redColor];

（5）当需要更新一个视图控件的autolayout约束时，可以使用如下方法：
	// mas_updateConstraints:方法用于更新一个视图控件所添加的约束，开发者无须将旧的约束移除，直接将需要修改的约束条件写入block代码块中即可。
	[label mas_updateConstraints:^(MASConstraintMaker *make) {
		make.height.equalTo(@100);
        	make.width.equalTo(@100);
    	}];

（6）如果需要全部重新设置约束，则可以使用Masonry中的如下方法：
    	// mas_remakeConstraints:方法用于全部重设一个视图控件的autolayout约束。下面代码中，offset()用于设置约束的偏移值。
	[label mas_remakeConstraints:^(MASConstraintMaker *make) {
        	make.left.equalTo(self.view.mas_left).offset(10);
        	make.top.equalTo(self.view.mas_top).offset(100);
        	make.height.equalTo(@100);
        	make.width.equalTo(@100);
    	}];

（7）上面的示例代码中关于约束的关系，使用的全部是精确的等于equalTo()，在Masonry中还有其他两种方式可供选择：
	// 大于等于
	- (MASConstraint * (^)(id attr))greaterThanOrEqualTo;
	// 小于等于
	- （MASConstraint * (^)(id attr))lessThanOrEqualTo;

（8）在创建约束条件时也可以为这条约束设置优先值，方法如下：
	// 手动设置一个优先级参数
	- (MASConstraint * (^)(MASLayoutPriority priority))priority;
	// 优先级低
	- (MASConstraint * (^)())priorityLow;
	// 优先级中等
	- (MASConstraint * (^)())priorityMedium;
	// 优先级高
	- (MASConstraint * (^)())priorityHigh;
	示例代码如下：
	[label mas_remakeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.view.mas_left).offset(10);
		make.top.equalTo(self.view.mas_top).offset(100);
		// 设置优先级为100
		make.height.equalTo(@100).priority(1000);
		// 设置优先级高
		make.width.equalTo(@100).priorityHigh();
	}];

（9）下面是两个示例代码：
    示例代码1：
	UILabel *label = [[UILabel alloc]init];
	[self.view addSubview:label];
	[label mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 20, 20));
	}];
	label.backgroundColor = [UIColor redColor];

    示例代码2：
	UILabel *label = [[UILabel alloc]init];
	[self.view addSubview:label];
	UILabel *label2 = [[UILabel alloc]init];
	[self.view addSubview:label2];
	[label mas_makeConstraints:^(MASConstraintMaker *make) {
		make.height.equalTo(@100);
        	make.width.equalTo(label2);
        	make.right.equalTo(label2.mas_left).offset(-100);
        	make.leading.equalTo(self.view.mas_leading).offset(20);
        	make.centerY.equalTo(self.view);
    	}];
    	[label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        	make.height.equalTo(@100);
        	make.centerY.equalTo(self.view);
        	make.trailing.equalTo(self.view.mas_trailing).offset(-20);
    	}];
    	label.backgroundColor = [UIColor redColor];
    	label2.backgroundColor = [UIColor blueColor];

注意：
    （1）使用Masonry需要导入#import <Masonry.h>头文件（使用Cocopod安装Masonry)或#import "Masonry.h"（直接使用Masonry源代码）
    （2）定义宏#define MAS_SHORTHAND后，可以使用Masonry的简写名称。