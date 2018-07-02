UITableViewController使用方法

（1）注册Cell类
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];

（2）创建刷新控件
	self.refreshControl = [[UIRefreshControl alloc]init];

（3）设置刷新控件的颜色
	self.refreshControl.tintColor = [UIColor redColor];

（4）设置刷新控件的文字
	self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"刷新控件"];

（5）设置属性控件触发方法
	[self.refreshControl addTarget:self action:@selector(update:) forControlEvents:UIControlEventValueChanged];

	// 实现刷新方法
	- (void)update:(UIRefreshControl *)control {
    		// 模拟2秒后刷新结束
    		[control performSelector:@selector(endRefreshing) withObject:nil afterDelay:2];
	}

（6）由于UITableViewController本身已经实现UITableViewDataSource协议，因此可以直接在UITableViewController中实现UITableViewDataSource协议方法即可.
	#pragma mark -- 实现UITableViewDataSource协议
	// 设置分组数
	- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
		return 1;
	}

	// 设置每组有多少行
	- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
		return 10;
	}

	// 设置每行的视图数据
	- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
		cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
		return cell;
	}
	