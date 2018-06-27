//
//  ViewController.m
//  UIScrollViewTest
//
//  Created by QinTuanye on 2018/6/27.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UIScrollView控件
    UIScrollView *scrollView  = [[UIScrollView alloc]initWithFrame:self.view.frame];
    // 创建UIScrollView内容视图
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 3, self.view.frame.size.height * 1.5)];
    imageView.image = [UIImage imageNamed:@"image"];
    // 为滚动视图添加一张内容图片
    [scrollView addSubview:imageView];
    // 设置滚动视图内容区域的大小
    scrollView.contentSize = imageView.frame.size;
    // contentOffSet属性设置滚动内容区域的位置偏移，其需要设置一个CGPoint的对象，设置内容区域向右和向下的偏移位置
    scrollView.contentOffset = CGPointMake(100, 100);
    // directionalLockEnabled属性设置是否进行方向的锁定，这个属性设置为YES，则在用户手指离开屏幕开始下一次滑动之前，用户只可以进行横向的滑动操作。同理，先进行纵向滑动的情况也是如此。
    scrollView.directionalLockEnabled = YES;
    // bounces属性决定滚动视图是否支持回弹的效果。所谓回弹效果，即当滚动视图滑动到边界极限时，滚动视图将支持超出极限范围的滑动，并且在用户手指离开屏幕后会回弹到极限位置。如果不支持回弹效果，则当滚动视图滑动到边界极限后，视图将无法继续滑动。bounces属性设置后将对水平和垂直两个方向的回弹效果有效，alwaysBounceHorizontal属性只设置水平方向是否支持回弹效果，alwaysBounceVertical属性只设置垂直方向是否支持回弹效果。
    scrollView.bounces = NO;
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.alwaysBounceVertical = NO;
    // pagingEnabled属性设置是否支持分页效果，这个属性设置为YES后，UIScrollView控件将有自动校正滚动停止位置的功能。
    scrollView.pagingEnabled = YES;
    // showsHorizontalScrollIndicator属性设置是否显示水平方向的指示条。
    scrollView.showsHorizontalScrollIndicator = YES;
    // showsVerticalScrollIndicator属性设置是否显示垂直方向的指示条
    scrollView.showsVerticalScrollIndicator = NO;
    // 设置指示条风格
    /**
     * 注意有以下风格：
     *      UIScrollViewIndicatorStyleDefault // 默认风格
     *      UIScrollViewIndicatorStyleBlack // 黑色风格
     *      UIScrollViewIndicatorStyleWhite // 白色风格
     */
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    // UIScrollView的缩放操作
    // minimumZoomScale属性设置最小的缩放比例
    scrollView.minimumZoomScale = 0.3;
    // maximumZoomScale属性设置最大的缩放比例
    scrollView.maximumZoomScale = 2.0;
    // bouncesZoom设置是否支持缩放的回弹效果
    scrollView.bouncesZoom = YES;
    // 设置代理
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 实现UISearchViewDelegate协议方法
#pragma mark -- 实现UISearchViewDelegate协议
// 滚动视图减速结束时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
}

// 用户停止拖曳时调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
}

// 滚动视图将要结束滚动动画时调用的方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
}

// 滚动视图缩放结束后调用的方法
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
}

// 滚动视图开始滚动时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

// 滚动视图滚动到顶端时调用
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
}

// 滚动视图进行缩放时调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
}

// 滚动视图将要滚动到顶部时调用
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}

// 滚动视图将要开始减速时调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
}

// 滚动视图将要开始被拖曳时调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

// 滚动视图将要开始缩放时触发的方法
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
}

// 滚动视图将要结束拖曳时调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
}

// 要进行缩放的View
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return scrollView.subviews.firstObject;
}

@end
