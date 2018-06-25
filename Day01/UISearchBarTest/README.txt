UISearchBar使用示例代码

（1）创建UISearchBar对象
        UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, 100, 280, 40)];
    注意：类似于UISearchBar这样的系统控件，都有自己的UI特性，因而设置其frame时有一定的限制。例如，将工程中的UISearchBar控件frame属性中的高度设置为100个单位，其在屏幕上显示的搜索框高度依然不会变。

（2）设置搜索栏的提示文字
	searchBar.placeholder = @"请输入文字...";

（3）显示搜索栏中的书签图标
	searchBar.showsBookmarkButton = YES;

（4）显示搜索栏的取消按钮
	searchBar.showsCancelButton = YES;

（5）显示搜索栏的结果下拉按钮
	searchBar.showsSearchResultsButton = YES;

（6）设置搜索栏样式
	searchBar.barStyle = UISearchBarStyleProminent;

（7）设置UISearchBar扩展栏
	// 显示扩展栏
	searchBar.showsScopeBar = YES;
	// 设置扩展栏按钮标题
	searchBar.scopeButtonTitle = @[@"时政", @"体育", @"娱乐"];
	// 设置当前扩展栏选中项, 下标从0开始
	searchBar.selectedScopeButtonIndex = 1;

（8）设置UISearchBar的代理
	// 在视图头文件或.m文件中遵守UISearchBarDelegate协议
	@interface ViewController: UIViewController<UISearchBarDelegate>
	@end

	// 设置UISearchBar控件的代理
	searchBar.delegate = self;

	// 实现UISearchBarDelegate代理方法
	#pragma mark -- 实现UISearchBar搜索栏代理UISearchBarDelegate
	// 当用户点击切换扩展栏上的模块按钮时会触发下面的方法
	- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
	}

	// 当用户在UISearchBar控件中输入的文字改变时会触发下面的方法
	- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    		return YES;
	}

	// 当UISearchBar中文字改变时会触发下面的方法
	- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
	}

	// 当用户点击”书签”图标按钮时会触发下面的方法
	- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar {
	}

	// 当用户点击“取消”图标按钮时会触发下面的方法
	- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	}

	// 当用户点击“搜索结果箭头”按钮时会触发下面的方法
	- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar {
	}

	// 当用户点击键盘上的搜索按钮时会触发下面的方法
	- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	}

	// 当searchBar控件结束编辑时会触发下面的方法
	- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
	}