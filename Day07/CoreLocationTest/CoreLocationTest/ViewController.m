//
//  ViewController.m
//  CoreLocationTest
//
//  Created by QinTuanye on 2018/7/25.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 在工程中使用系统的定位服务，则需要在info.plist文件中添加一个键，若添加键名为Privacy - Location Always and When In Use Usage Description，并设置该键的值（使用该权限的描述），则默认无论应用在前台还是后台都会调用定位服务, 同时还需要添加Privacy - Location When In Use Usage Description和Privacy - Location Always Usage Description键，并设置该键的值（使用该权限的描述）。如果设置键名为Privacy - Location When In Use Usage Description，并设置该键的值（使用该权限的描述），则只有当应用处于前台时才会调用系统的定位服务， 同时还需要添加Privacy - Location When In Use Usage Description键，并设置该键的值（使用该权限的描述）。
    // 需要注意的是，如果要在前台和后台都调用定位服务，还需要在Xcode的配置文件的功能页面中的Capabilities页面中的开启Background Modes项，并勾选Location updates项。
    // 使用地图功能，需要导入#import <CoreLocation/CoreLocation.h>头文件。
    // 初始化一个定位管理对象
    self.manager = [[CLLocationManager alloc]init];
    // 申请定位服务权限，当CLLocationManager对象调用requestAlwaysAuthorization方法后，会想用户申请前台和后台都使用位置服务。与这个方法相对应的是，当调用requestWhenInUseAuthorization方法会想用户申请只在前台使用定位服务。
    [self.manager requestAlwaysAuthorization];
    // 设置代理
    self.manager.delegate = self;
    // 开启定位服务
    [self.manager startUpdatingLocation];
    // 提示：使用模拟器也可以进行模拟定位，选择模拟器Debug菜单中的Location选项，将其设置为City Bicycle Ride。
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 实现CLLocationManagerDelegate协议
// CLLocationManger调用startUpDatingLocation方法后将开始进行设备定位，定位到位置或设备位置改变后，会调用该代理方法
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // CLLocation对象时具体的地理位置信息对象，其中会封装经纬度、速度、海拔高度等地理信息。
    // CLLocation类中封装的地理信息常用的有以下几种：
    //      // 设备的经纬度
    //      @property (readonly, nonatomic) CLLocationCordinate2D coordinate;
    //      // 海拔高度、浮点型
    //      @property (readonly, nonatomic) CLLocationDistance altitude;
    //      // 水平方向的容错半径
    //      @property (readonly, nonatomic) CLLocationAccuracy horizontalAccuracy;
    //      // 竖直方向的容错半径
    //      @property (readonly, nonatomic) CLLocationAccuracy verticalAccuracy;
    //      // 设备前进的方向，取值范围为0-359k.9, 相对正北方向
    //      @property (readonly, nonatomic) CLLocationDirection course;
    //      // 速度， 单位为m/s
    //      @property (readonluy, nonatomic) CLLocationSpeed speed;
    //      // 定位时的时间戳
    //      @property (readonly, nonatomic, copy) NSDate *timestamp;
    // 关于经纬度信息属性coordinate，它是一个结构体，代码如下：
    //      typedef struct {
    //          CLLocationDegrees latitude;     // 纬度
    //          cLLocationDegrees longitude;    // 经度
    //      } CLLocationCoordinate2D;
    NSLog(@"%@", locations);
}

@end
