//
//  ViewController.m
//  UISearchBarTest
//
//  Created by QinTuanye on 2018/6/25.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建搜索框控件
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
    // 设置搜索栏的提示文字
    searchBar.placeholder = @"请输入文字...";
    // 设置搜索栏的样式
    searchBar.barStyle = UISearchBarStyleProminent;
    // 设置搜索栏显示书签图标
    searchBar.showsBookmarkButton = YES;
    // 设置搜索栏显示取消按钮
    searchBar.showsCancelButton = YES;
    // 设置搜索栏显示一个代表搜索结果的下拉按钮
    searchBar.showsSearchResultsButton = YES;
    // 设置搜索栏背景图片
    //[searchBar setBackgroundImage:[UIImage imageNamed:@"imageName"]];
    // 设置搜索栏的扩展栏
    searchBar.showsScopeBar = YES;
    // 设置扩展栏标题
    searchBar.scopeButtonTitles = @[@"时政", @"体育", @"娱乐"];
    // 设置当前选中扩展项
    searchBar.selectedScopeButtonIndex = 1;
    // 设置搜索栏代理
    searchBar.delegate = self;
    // 将UISearchBar控件添加在视图上， 编号从0开始
    [self.view addSubview:searchBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 实现UISearchBar搜索栏代理UISearchBarDelegate
// 当用户点击切换扩展栏上的模块按钮时会触发下面的方法
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    NSLog(@"%s, selectedScopeButtonIndexDidChange()", __FUNCTION__);
}

// 当用户在UISearchBar控件中输入的文字改变时会触发下面的方法
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%s, shouldChangeTextInRange()", __FUNCTION__);
    return YES;
}

// 当UISearchBar中文字改变时会触发下面的方法
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"%s, textDidChange()", __FUNCTION__);
}

// 当用户点击”书签”图标按钮时会触发下面的方法
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s, searchBarBookmarkButtonClicked()", __FUNCTION__);
}

// 当用户点击“取消”图标按钮时会触发下面的方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s, searchBarCancelButtonClicked()", __FUNCTION__);
}

// 当用户点击“搜索结果箭头”按钮时会触发下面的方法
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s, searchBarResultsListButtonClicked()", __FUNCTION__);
}

// 当用户点击键盘上的搜索按钮时会触发下面的方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s, searchBarSearchButtonClicked()", __FUNCTION__);
}

// 当searchBar控件结束编辑时会触发下面的方法
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"%s, searchBarTextDidEndEditing()", __FUNCTION__);
}
@end
