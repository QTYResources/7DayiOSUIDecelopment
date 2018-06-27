UITableView使用示例代码

（1）创建UITableView视图控件
	/**
	 * 第1个参数设置表格视图的位置和尺寸
	 * 第2个参数设置表格视图的显示风格，主要有以下几种风格：
	 *      UITableViewStylePlain   // 规范的表格视图风格
	 *      UITableViewStyleGrouped // 分组的表格视图风格
	 */
	UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];

（2）设置UITableView的编辑模式
    tableView.editing = YES;

（3）设置代理
	// 视图控制器实现UITableViewDelegate协议
	@interface ViewController () <UITableViewDelegate>
	@end

	// 设置UITableView的代理
    	tableView.delegate = self;

	// 实现UITableViewDelegate协议方法
	#pragma mark -- 实现UITableViewDelegate协议方法
	// 设置表视图的行高
	- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
		return 100;
	}

	// 设置某一行的编辑模式类型
	/*
 	 * 主要编辑模式类型有：
 	 *      UITableViewCellEditingStyleNone // 无编辑模式
 	 *      UITableViewCellEditingStyleDelete // 删除模式
 	 *      UITableViewCellEditingStyleInsert  // 插入模式
 	 */
	- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    		if (indexPath.section == 0) {
			return UITableViewCellEditingStyleDelete;
		} else {
			return UITableViewCellEditingStyleInsert;
		}
	}

	// 当用户点击相应按钮后被调用
	- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
		if (editingStyle == UITableViewCellEditingStyleInsert) {
			// 进行数据插入操作
		} else if (editingStyle == UITableViewCellEditingStyleDelete) {
			// 进行数据删除操作
		}
	}

	// 设置该行是否支持移动操作
	- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
		return YES;
	}

	// 当用户进行表格数据位置移动时调用
	- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
	}

	// 自定义cell右侧删除按钮的文字
	- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
		return @"删除";
	}

	// 设置尾视图高度
	- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
		return 100;
	}

	// 设置头视图高度
	- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
		return 100;
	}

	// 设置尾视图
	- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
		UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
		view.backgroundColor = [UIColor redColor];
		return view;
	}

	// 设置头视图
	- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
		UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
		view.backgroundColor = [UIColor blueColor];
		return view;
	}

	// 添加分组索引
	- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
		return @[@"A", @"B"];
	}

（4）设置UITableView的数据源
	// 视图控制器实现UITableViewDataSource协议
	@interface ViewController () <UITableViewDataSource>
	@end
	
	// 设置UITableView数据源
    	tableView.dataSource = self;

	// 实现UITableViewDelegate协议方法
	#pragma mark -- 实现UITableViewDataSource协议
	// 设置表格分组数量
	- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
		return 2;
	}

	// 设置表格视图每个分组的行数
	- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    		if (section == 0) {
        		return 3;
    		} else {
        		return 10;
    		}
	}

	// 设置表视图每行的视图
	- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    		// 从复用池中取cell
    		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    		// 如果cell为nil, 则创建cell
    		if (cell == nil) {
        		/*
         		 * UITableViewCell的风格有：
         		 *      UITableViewCellStyleDefault // 由一个label标签和imageView视图组成
         		 *      UITableViewCellStyleValue1 // 类似系统设置界面的cell样式
         		 *      UITableViewCellStyleValue2 // 类似系统联系人界面的cell样式
         		 *      UITableViewCellStyleSubtitle iPod上的cell样式
         		 */
        		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    		}
    		// 设置标题文字
    		cell.textLabel.text = [NSString stringWithFormat:@"第%ld分区 第%ld行", indexPath.section, indexPath.row];
    		// 设置副标题文字
    		cell.detailTextLabel.text = @"副标题";
    		// 设置左侧图标视图
    		cell.imageView.image = [UIImage imageNamed:@"image"];
    		// 设置cell附加视图样式
    		/*
     		 * 附加视图样式有：
     		 *      UITableViewCellAccessoryNone // 无附加视图
     		 *      UITableViewCellAccessoryDisclosureIndicator // 箭头风格
     		 *      UITableViewCellAccessoryDetailDisclosureButton // 详情按钮风格
     		 *      UITableViewCellAccessoryDetailButton // 和上面效果一致
     		 *      UITableViewCellAccessoryCheckmark // 对号风格
     		 */
    		cell.accessoryType = UITableViewCellAccessoryCheckmark;
    		return cell;
	}

	// 当用户选中一行数据时，会调用如下方法
	- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
		NSLog(@"%ld, %ld", indexPath.section, indexPath.row);
	}
    