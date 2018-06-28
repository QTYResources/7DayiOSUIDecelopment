UIWebView使用示例代码

（1）随着iOS 9的推出和XCode升级到7.0版本，在开发有关网络数据传输的应用程序时，将默认采用https类型的连接。而目前很多网站依然采用的是http类型的连接，在Xcode中如果不进行一些兼容性的设置，则这类网站将无法加载。具体设置如下：
    打开工程info.plist配置文件，在information Property List中添加一个新的键，选择App Transport Security Settings，这是一个字典类型的键值集合，为其中添加一个名为Allow Arbitrary Loads的Boolean类型的键，将其值设置为YES。

（2）通过网络请求加载UIWebView
    1. 创建UIWebView对象
    	UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];

    2. 创建网站URL对象
    	NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];

    3. 创建网络请求
    	NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    4. 加载请求
    	[webView loadRequest:request];

（3）通过HTML字符串加载UIWebView
    1. 创建HTML字符串
    	NSString *htmlStr = @"<html><head><meta charset=\"UTF-8\"><title>主标题 | 副标题</title></head><body><p>hello world</p></body></html>";

    2. 创建UIWebView对象
    	UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    3. 加载HTML字符串
    	[webView loadHTMLString:htmlStr baseURL:nil];

    提示：对于HTML字符串中的引号，要使用转义符进行转义。

（4）通过NSData数据加载UIWebView
    1. 创建UIWebView对象
    	UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];

    2. 创建NSURL对象
    	NSURL *imageUrl = [[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle]pathForResource:@"image" ofType:@"png"]];

    3. 创建NSData对象
    	NSData *data = [NSData dataWithContentsOfURL:imageUrl];

    4. 加载Data数据
    	[webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];

（4）UIWebView中常用方法
	// 重新加载UIWebView对象
	- (void)reload;
	// 停止加载当前页面
	- (void)stopLoading;
	// 回退到上一界面
	- (void)goBack;
	// 前进到下一界面
	- (void)goForward;
	// 判断是否可用进行回退操作
	@property (nonatomic, readonly, getter=canGoBack) BOOL canGoBack;
	// 判断是否可用进行前进操作
	@property (nonatomic, readonly, getter=canGoForward) BOOL canGoForward;
	// 判断是否正在加载中
	@property (nonatomic, readonly, getter=isLoading) BOOL loading;
	// 用于设置界面的尺寸是否适配UIWebView对象的尺寸
	@property (nonatomic) BOOL scalesPageToFit;
	// 用于设置一下可以进行用户交互的字段类型
	/*
 	 * UIDataDetectorTypePhoneNumber    // 探测电话号码
    	 * UIDataDetectorTypeLink           // 探测网页链接
    	 * UIDataDetectorTypeAddress 	    // 探测地址
    	 * UIDataDetectorTypeCalendarEvent  // 探测日历事件
    	 * UIDataDetectorTypeShipmentTrackingNumber // Shipment tracking number detection
    	 * UIDataDetectorTypeFlightNumber   // Flight number detection
    	 * UIDataDetectorTypeLookupSuggestion  // Information users may want to look up
    	 * UIDataDetectorTypeNone           // 不进行探测
    	 * UIDataDetectorTypeAll	    // 探测所有类型
	 */
	@property (nonatomic) UIDataDetectorTypes dataDetectorTypes

    提示：
	1. Loading、canGoBack、canGoForward这三个属性是只读的，只能用get方法获取，不能set方法设置。
	2. 对于以NS_OPTIONS标记的枚举是支持进行或运算的。

（5）设置代理
	// 视图控制器实现UIWebViewDelegate协议
	@interface ViewController () <UIWebViewDelegate>
	@end

	// 设置代理
	webView.delegate = self;

	// 实现UIWebViewDelegate协议
	#pragma mark -- 实现UIWebViewDelegate协议
	// 加载失败时调用
	- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	}

	// 将要加载请求时调用
	- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
		return YES;
	}

	// 加载数据结束时调用
	- (void)webViewDidFinishLoad:(UIWebView *)webView {
	}

	// 已经开始加载数据时调用
	- (void)webViewDidStartLoad:(UIWebView *)webView {
	}
