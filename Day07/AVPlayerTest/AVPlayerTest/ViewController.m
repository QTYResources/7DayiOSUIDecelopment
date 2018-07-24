//
//  ViewController.m
//  AVPlayerTest
//
//  Created by QinTuanye on 2018/7/24.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>

@interface ViewController () <AVPlayerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playMovie:(id)sender {
    // 使用AVPlayerViewController需要导入#import <AVKit/AVKit.h>头文件
    // 初始化视频文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"iphone" ofType:@"mp4"];
    // 初始化视频文件URL
    NSURL *url = [NSURL fileURLWithPath:path];
    // 初始化AVPlayerViewController
    AVPlayerViewController *play = [[AVPlayerViewController alloc]init];
    // 设置AVPlayerViewController的播放控制对象
    // AVPlayer是AVFoundation框架的播放控制类，其不仅可以播放视频，还可以播放音频
    play.player = [[AVPlayer alloc]initWithURL:url];
    // 显示播放视频界面
    [self presentViewController:play animated:YES completion:nil];
    // AVPlayerViewController中还有以下属性提供给开发者进行视频播放器属性的自定义：
    //      // 设置是否显示播放器控制控件，设置为YES，则播放器界面会带一个播放器控件。若设置为NO，则不显示此控件。
    //      @property (nonatomic) BOOL showsPlaybackControls;
    //      // 设置播放区域拉伸模式，该属性用于设置播放区域的拉伸模式，支持的常用字符串及含义如下：
    //      /*
    //       * AVLayerVideoGravityResizeAspect      // 不拉伸比例，以播放区域宽高中大的值充满为标准
    //       * AVLayerVideoGravityResizeAspectFill  // 不拉伸比例，以播放区域宽高中小的值充满为标准
    //       * AVLayerVideoGravityResize            // 进行比例拉伸充满界面
    //       */
    //      @property (nonatomic, copy) NSString *videoGravity;
    //      // 获取播放器是否已经准备好播放
    //      @property (nonatomic, readonly, getter = isReadyForDisplay) BOOL readyForDisplay;
    //      // 获取视频播放区域的尺寸
    //      @property (nonatomic, readonly) CGRect videoBounds;
    //      // 播放器背景视图， 如果开发者需要自定义一些播放器控件，则可以将其加在contentOverlayView上。
    //      @property (nonatomic, readonly, nullable) UIView *contentOverlayView;
    //      // 设置播放器是否支持画中画， 在iOS 9后可用，并且默认是支持的。在iPad中才可以看到效果。
    //      @property (nonatomic) BOOL allowsPictureInPicturePlayerback NS_AVAILABLE_IOS(9_0);
    
    // 对于画中画的相关操作，开发者可以在程序中使用代理方法进行监听。AVPlayerViewController对象中有delegate这样一个属性，在ViewController.m中遵守如下协议：
    //      @interface ViewController() <AVPlayerViewControllerDelegate>
    //      @end
    //    开发者通过AVPlayerViewControllerDelegate协议中约定的方法来进行用户画中画操作的监听：
    //      // 将要进入画中画模式时系统调用的方法
    //      - (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController;
    //      // 已经进入画中画模式时系统调用的方法
    //      - (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController;
    //      // 进入画中画模式失败时系统调用的方法
    //      - (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error;
    //      // 将要结束画中画模式时系统调用的方法
    //      - (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController;
    //      // 已经结束画中画模式时系统调用的方法
    //      - (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController;
    //      // 进入画中画模式后，是否自动将当前播放视图控制器dismiss掉。当返回YES时，在进入画中画模式后，当前的视频播放视图控件会自动调用dismissViewController:方法来返回到上级视图控制器。如果返回NO，则播放窗口缩小后，界面依然会停留在当前的视频播放视图控制器。
    //      - (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController;
    //      // 用户操作画中画视图中的还原按钮时系统调用的方法
    //      - (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler;
    // 注意：AVPlayerViewControllerDelegate协议中约定的方法只能在iOS 9.0系统之后可用。
}

@end
