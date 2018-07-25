iOS原始地图使用方法（二）-- 路线检索和兴趣点检索

（1）基本控件初始化
	self.mapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    	self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(39.26, 116.3), MKCoordinateSpanMake(5, 5));
    	self.mapView.mapType = MKMapTypeStandard;
    	self.mapView.delegate = self;
    	[self.view addSubview:self.mapView];
    
（2）导航设置
    	CLLocationCoordinate2D fromcoor = CLLocationCoordinate2DMake(39.26, 116.3);
    	CLLocationCoordinate2D tocoor = CLLocationCoordinate2DMake(33.33, 113.33);
    	// 创建出发点和目的地点信息
    	// MKPlacemark类为地理信息类，这个类可以通过经纬度坐标来创建导航线路的起始点与目的地。
    	MKPlacemark *fromPlace = [[MKPlacemark alloc]initWithCoordinate:fromcoor addressDictionary:nil];
    	MKPlacemark *toPlace = [[MKPlacemark alloc]initWithCoordinate:tocoor addressDictionary:nil];
    	// 创建出发节点和目的地节点
    	// MKMapItem为地点节点类，其将一个地理信息转化为地图上的节点。
    	MKMapItem *fromItem = [[MKMapItem alloc]initWithPlacemark:fromPlace];
    	MKMapItem *toItem = [[MKMapItem alloc]initWithPlacemark:toPlace];
    	// 初始化导航搜索请求
    	// MKDirectionsRequest类为导航信息请求类，通过它可创建请求对象向导航服务的提供者请求信息。
    	MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    	request.source = fromItem;
    	request.destination = toItem;
    	request.requestsAlternateRoutes = YES;
    	// 初始化请求检索
    	// MKDirections为导航请求连接类，用来建立请求的连接。
    	MKDirections *directions = [[MKDirections alloc]initWithRequest:request];
    	// 开始检索，结果会返回到block中
    	[directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        	// MKDirectionsResponse为请求返回数据类，这个类中封装了线路导航的信息，具体属性如下：     
        	//      @property (nonatomic, readonly) MKMapItem *source;	// 起点     
        	//      @property (nonatomic, readonly) MKMapItem *destination:	// 终点     
        	//      @property (nonatomic, readonly) NSArray *routes;	// 线路规划数组
        	// MKETResponse封装了线路导航中与时间相关的信息
        	if (error) {
            		NSLog(@"error: %@", error);
        	} else {
            		// 提取导航线路结果中的一条线路
            		// MKRoute是线路类，进行起点和目的地的线路导航时，服务有可能会提供多条导航线路，每条导航线路都是一个MKRoute对象，这个类中的属性如下：
            		//      @property (nonatomic, readonly) NSString *name;     // 线路名称
            		//      @property (nonatomic, readonly) NSArray *advisoryNotices;       // 注意事项
            		//      @property (nonatomic, readonly) CLLocationDistance distance;        // 距离
            		//      @property (nonatomic, readonly) NSTimeInterval expectedTravelTime;      // 耗时
            		//      @property (nonatomic, readonly) MKDirectionsTransportType transportType;        // 检索的类型
            		//      @property (nonatomic, readonly) MKPolyline *polyline;       // 线路覆盖物
            		//      @property (nonatomic, readonly) NSArray *steps;     // 线路详情数组
            		MKRoute *route = response.routes[0];
            		// 将线路中的每一步详情提取出来
            		NSArray *stepArray = [NSArray arrayWithArray:route.steps];
            		// 进行遍历
            		for (int i = 0; i < stepArray.count; i++) {
                		// 线路的详情节点
                		// MKRouteStep类为导航线路中具体每一个节点信息的包装类，属性如下：
                		//      @property (nonatomic, readonly) NSString *instructions;     //节点信息
                		//      @property (nonatomic, readonly) NSString *notice;       // 注意事项
                		//      @property (nonatomic, readonly) MKPolyline *polyline;       // 线路覆盖物
                		//      @property (nonatomic, readonly) CLLocationDistance distance;        // 距离
                		//      @property (nonatomic, readonly) MKDirectionsTransportType transportType;    // 导航类型
                		MKRouteStep *step = stepArray[i];
                		// 在此节点处添加一个大头针
                		MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
                		point.coordinate = step.polyline.coordinate;
                		point.title = step.instructions;
                		point.subtitle = step.notice;
                		[self.mapView addAnnotation:point];
                		// 将此段线路添加到地图上
                		[self.mapView addOverlay:step.polyline];
            		}
        	}
    	}];
    
（3）附近兴趣点检索
    	CLLocationCoordinate2D tocoor = CLLocationCoordinate2DMake(33.33, 113.33);
    	// 创建一个位置信息对象，第一个参数为经纬度；第二个为经纬度检索范围，单位为米；第三个为经度检索范围，单位为米。
    	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(tocoor, 5000, 5000);
    	// 初始化一个检索请求对象
    	MKLocalSearchRequest *req = [[MKLocalSearchRequest alloc]init];
    	// 设置检索参数
    	req.region = region;
    	// 兴趣点关键字
    	req.naturalLanguageQuery = @"school";
    	// 初始化检索
    	MKLocalSearch *ser = [[MKLocalSearch alloc]initWithRequest:req];
    	// 开始检索，结果返回到block中
    	[ser startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        	// 兴趣点节点数组
        	NSArray *array = [NSArray arrayWithArray:response.mapItems];
        	for (int i = 0; i < array.count; i++) {
            		MKMapItem *item = array[i];
            		MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
            		point.title = item.name;
            		point.subtitle = item.phoneNumber;
            		point.coordinate = item.placemark.coordinate;
            		[self.mapView addAnnotation:point];
        	}
    	}];

（4）MKMapViewDelegate代理
	#pragma mark -- 实现MKMapViewDelegate协议
	// 地图覆盖物的代理方法
	- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    		MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc]initWithPolyline:overlay];
    		renderer.strokeColor = [UIColor redColor];
    		renderer.lineWidth = 4.0;
    		return renderer;
	}

	// 标注的代理方法
	- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    		MKPinAnnotationView *view = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"anno"];
    		view.canShowCallout = YES;
    		return view;
	}
