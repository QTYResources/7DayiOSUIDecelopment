CATransform3D（变换）使用方法

（1）初始化所需操作对象
	UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    	image1.image = [UIImage imageNamed:@"image"];
	UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
	image2.image = [UIImage imageNamed:@"image"];
   
（2）创建平移动画
	/*
	 * 第1个参数为原CATransform3D对象
	 * 第2个参数为平移的X坐标值
	 * 第3个参数为平移的Y坐标值
	 * 第4个参数为平移的Z坐标值
	 */
	CATransform3D trans = CATransform3DTranslate(image2.layer.transform, 100, 100, 0);
    
（3）创建缩放动画
	/*
	 * 第1个参数为原始的CATransform3D对象
	 * 第2个参数为沿X轴方向的缩放比
	 * 第3个参数为沿Y轴方向的缩放比
	 * 第4个参数为沿Z轴方向的缩放比
	 */
	CATransform3D tran = CATransform3DScale(trans, 0.5, 2, 0);
    
（4）旋转动画
	/*
	 * 第1个参数为原始的CATransform3D对象
	 * 第2个参数为要旋转的角度，为弧度制
	 * 第3个参数为旋转方向在X轴上的分量
	 * 第4个参数为旋转方向在Y轴上的分量
	 * 第5个参数为旋转方向在Z轴上的分量
	 */
	CATransform3D tran = CATransform3DRotate(trans, M_PI_4, 0, 0, 1);
	image2.layer.transform = tran;
    
（5）带景深效果的旋转变换
	// 平移
	CATransform3D trans = CATransform3DTranslate(image2.layer.transform, 100, 100, 0);
	// 设置景深参数
	trans.m34 = -1 / 600.0;
	image2.layer.transform = CATransform3DRotate(trans, M_PI_4, 0, 1, 0);
    
（6）旋转镜像变换
	CATransform3D tran = CATransform3DRotate(image2.layer.transform, M_PI_4, 0, 0, 1);
	image1.layer.transform = tran;
	// 翻转变换效果
	image2.layer.transform = CATransform3DInvert(tran);
	image2.layer.transform = CATransform3DTranslate(image2.layer.transform, -150, 150, 0);

（7）显示
	[self.view addSubview:image1];
	[self.view addSubview:image2];