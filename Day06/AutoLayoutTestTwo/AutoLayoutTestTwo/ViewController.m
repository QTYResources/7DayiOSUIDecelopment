//
//  ViewController.m
//  AutoLayoutTestTwo
//
//  Created by QinTuanye on 2018/7/16.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 先设置最下面UIImageView控件的约束，将其左边距、右边距、下边距都设置为与父视图保持不变，将其上边距设置为与父视图的中心线对齐。前3个约束十分好做，通过拖曳选择即可直接设置。对于第4个约束，可以先约束子视图的水平中心线与符视图保持不变，再将子视图约束的水平中心线修改为上边线。过程如下：
    //      1. 设置视图的水平中心线与父视图保持不变（Center vertically in Container）。
    //      2. 点击视图控件，在Xcode右侧工具栏中找到相应约束，双击进入约束设置界面。
    //      3. 在约束设置界面将子视图控件的约束水平中心线修改为上边线。
    // 用同样的方法约束左上角的视图左边距、上边距与父视图左边距、上边距离保持不变，右边距与父视图竖直中心线保持对齐，下边距与父视图水平线保持对齐。约束右上角的视图右边距、上边距与父视图右边距、上边距保持不变，左边距与父视图竖直中心线保持对齐，下边距与父视图水平中心线保持对齐。
    // 提示：
    //      1. 模拟器可以使用command + 左右键的方式来进行翻转切换。
    //      2. autolayout的精髓在于足够多的约束，autolayout之所以比autoresizing强大，就在于其布局的精确性，而精确性正是由约束来提供的。
    //      3. 切莫画蛇添足，矛盾的约束会使Xcode晕掉，所以在添加约束前，建议将视图间的布局关系先整理出来。
    //      4. 使用autolayout进行界面布局时，首先应该转变的是思路，如果读者已经习惯了使用CGRect、Point等传统的坐标布局模式，那么应该稍微转变一下，autolayout倡导的是一个相对的概念，你需要将更多的关注放在视图间的关系，比如A和B距离10、A和C右对齐等。具体的坐标可由autolayout来帮助计算。
    
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
//    view1.backgroundColor = [UIColor redColor];
//    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 2, self.view.frame.size.height / 2)];
//    view2.backgroundColor = [UIColor blueColor];
//    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2)];
//    view3.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:view1];
//    [self.view addSubview:view2];
//    [self.view addSubview:view3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
