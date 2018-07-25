iOS原生地图使用方法（一）

（1）iOS系统中地图开发的相关接口与方法都封装在MapKit.framework这个框架找那个。因此需要在工程配置页面中的Build Phases页面的Link Binary With Libraries中添加MapKit.framework，并在使用的地方导入#import <MapKit/MapKit.h>头文件

（2）初始化地图控件
	MKMapView *map = [[MKMapView alloc]initWithFrame:self.view.frame];

（3）设置代理
	map.delegate = self;

（4）设置地图的模式
    	/*
     	 * 可以选的枚举及含义如下：
     	 *      MKMapTypeStandard           // 标准行政地图
    	 *      MKMapTypeSatellite          // 标准卫星地图
    	 *      MKMapTypeHybrid             // 行政与卫星混合地图
    	 *      MKMapTypeSatelliteFlyover   // 立体卫星地图， iOS 9后可用
    	 *      MKMapTypeHybridFlyover      // 立体混合地图， iOS 9后可用
    	 *      MKMapTypeMutedStandard
    	 */
    	map.mapType = MKMapTypeStandard;

（5）设置地图的中心位置和比例尺
    	/*
    	 * 第1个参数用于设置经纬度坐标
    	 * 第2个参数用于设置地图界面显示的经纬度范围
    	 */
	map.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(39.26, 116.3), MKCoordinateSpanMake(1.8, 2.05));
	self.manager = [[CLLocationManager alloc]init];
	[self.manager requestAlwaysAuthorization];

（6）显示用户位置，需要按照定位方法中的说明，开启定位服务
	map.showsUserLocation = YES;

（7）设置用户位置的追踪模式
	/*
    	 *  可设置的追踪模式的枚举值及含义如下：
    	 *      MKUserTrackingModeNone          // 不追踪用户位置
    	 *      MKUserTrackingModeFollow        // 追踪用户位置
    	 *      MKUserTrackingModeFollowWithHeading // 用户方向改变时追踪位置
    	 */
	map.userTrackingMode = MKUserTrackingModeFollow;

（8）在地图中添加大头针及标注
	MKPointAnnotation *ann = [[MKPointAnnotation alloc]init];
	// 设置标注的位置经纬度
	ann.coordinate = CLLocationCoordinate2DMake(39.26, 116.3);
	// 设置点击标注后显示的标题
	ann.title = @"我的位置";
	// 设置点击标注后显示的IDE副标题
	ann.subtitle = @"中华人民共和国北京";
	// 向地图视图中添加一个大头针标注
	[map addAnnotation:ann];
    
（9）下面是C的语法，创建一个结构体数组
	CLLocationCoordinate2D *coor;
	coor = malloc(sizeof(CLLocationCoordinate2D) * 5);
	for (int i = 0; i < 5; i++) {
		CLLocationCoordinate2D po = CLLocationCoordinate2DMake(33.23 + i * 0.01, 113.112 + (i % 2) * 0.01);
		coor[i] = po;
	}
	// 创建一个折线对象
	MKPolyline *line = [MKPolyline polylineWithCoordinates:coor count:5];
	// 释放指针
	free(coor);
	coor = nil;
	[map addOverlay:line];
    
（10）添加圆形覆盖物
	MKCircle *cirle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(34.23, 113.22) radius:500];
	[map addOverlay:cirle];
    
（11）绘制多边形覆盖物
	CLLocationCoordinate2D *coor;
	coor = malloc(sizeof(CLLocationCoordinate2D) * 6);
	for (int i = 0; i < 5; i++) {
		CLLocationCoordinate2D po = CLLocationCoordinate2DMake(33.23 + i * 0.01, 113.112 + ((i / 2) == 0 ? 0.01 : -0.01));
		coor[i] = po;
    	}
	coor[5] = CLLocationCoordinate2DMake(33.23, 113.112);
    	MKPolygon *gon = [MKPolygon polygonWithCoordinates:coor count:6];
    	free(coor);
    	coor = nil;
    	[map addOverlay:gon];

（11）MKMapViewDelegate代理设置
	#pragma mark -- 实现MKMapViewDelegate协议
	// 自定义大头针的样式
	- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
		//    MKPinAnnotationView *view = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"id"];
    		// 设置大头针颜色
    		//view.pinTintColor = [UIColor purpleColor];
		//    return view;
    		// 使用自定视图作为大头针视图
    		MKAnnotationView * view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"id"];
    		view.image = [UIImage imageNamed:@"image"];
    		// 设置开启详情视图
    		view.canShowCallout = YES;
    		UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    		view1.backgroundColor = [UIColor redColor];
    		UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    		view2.backgroundColor = [UIColor blueColor];
    		// 设置左右辅助视图
    		view.leftCalloutAccessoryView = view1;
    		view.rightCalloutAccessoryView = view2;
    		// 设置拖曳，可以通过点击不放进行拖曳
    		view.draggable = YES;
    		return view;
	}

	// 覆盖物绘的制代理
	- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
		// 折线覆盖物提供类
		//MKPolylineRenderer *render = [[MKPolylineRenderer alloc]initWithPolyline:overlay];
		// 设置线宽
		//render.lineWidth = 3;
		// 设置颜色
		//render.strokeColor = [UIColor redColor];
		//return render;
		// 圆形覆盖物提供类
		//MKCircleRenderer *render = [[MKCircleRenderer alloc]initWithCircle:overlay];
		//render.lineWidth = 3;
		// 填充颜色
		//render.fillColor = [UIColor greenColor];
		// 线条颜色
		//render.strokeColor = [UIColor redColor];
		//return render;
    
    		// 多边形覆盖物提供类
    		MKPolygonRenderer *render = [[MKPolygonRenderer alloc]initWithPolygon:overlay];
    		render.lineWidth = 3;
    		render.strokeColor = [UIColor redColor];
    		return render;
	}