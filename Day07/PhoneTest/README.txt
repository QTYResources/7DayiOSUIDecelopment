拨打电话的使用方法

（1）iOS10.0之前拨打电话方法
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://13333333333"]];

（2）iOS10.0之后拨打电话的方法
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://13333333333"] options:@{UIApplicationOpenURLOptionsAnnotationKey:@YES} completionHandler:^(BOOL success) {
		NSLog(@"%s call compeltion: %d", __func__, success);
	}];