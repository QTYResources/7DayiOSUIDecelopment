//
//  ViewController.m
//  UICollectionViewTestOne
//
//  Created by QinTuanye on 2018/6/27.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import "MyLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UIColloctionView布局策略
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 设置布局方向
    /*
     * 可用的布局方向有：
     *      UICollectionViewScrollDirectionVertical // 竖直方向
     *      UICollectionViewScrollDirectionHorizontal // 水平方向
     */
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置其中每个暑假载体Item的尺寸
//    layout.itemSize = CGSizeMake(100, 100);
    // 设置最小行间距
//    layout.minimumLineSpacing = 30;
    // 设置最小列间距
//    layout.minimumInteritemSpacing = 10;
    // 创建UIColloctionView视图控件
//    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    // 设置背景颜色
//    collectionView.backgroundColor = [UIColor whiteColor];
    // 进行数据载体Item的注册
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    // 设置代理
//    collectionView.delegate = self;
    // 设置数据源
//    collectionView.dataSource = self;
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



@end
