//
//  ViewController.m
//  MPMoviePlayerTest
//
//  Created by QinTuanye on 2018/7/24.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property(strong, nonatomic) MPMoviePlayerController *movieController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 要使用MPMoviePlayerController需要导入#import <MediaPlayer/MediaPlayer.h>头文件
    // 获取视频文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"iphone" ofType:@"mp4"];
    // 创建视频文件的URL对象
    NSURL *url = [NSURL fileURLWithPath:path];
    // 初始化视频播放控制器
    self.movieController = [[MPMoviePlayerController alloc]initWithContentURL:url];
    // 设置视频播放控制器的尺寸
    self.movieController.view.frame = CGRectMake(0, 0, 320, 300);
    // 将视频播放控制器作为当前控制的子视图添加到当前视图控制器
    [self.view addSubview:self.movieController.view];
    // 开始播放视频
    [self.movieController play];
    // 截取视频中某一时刻的截图
    /*
     * 第1个参数设置将要截取的时间点
     * 第2个参数设置截取的时间点选项，其可选的枚举含义如下：
     *      MPMovieTimeOptionNearestKeyFrame    // 截取所设置的时间点附件的关键帧作为截图
     *      MPMovieTimeOptionExact              // 截取所设置的时间点的精确帧作为截图
     */
    UIImage *image = [self.movieController thumbnailImageAtTime:100 timeOption:MPMovieTimeOptionNearestKeyFrame];
    // 显示截图
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 350, 320, 300)];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    // MPMoviePlayerController对象有一个名为playbackState的属性，通过这个属性，开发者可以获取到MPMoviePlayerController对象的当前播放状态。playbackState属性是一个MPMoviePlaybackState类型的枚举，枚举值含义如下：
    //      MPMoviePlaybackStateStopped         // 视频播放器处于停止状态
    //      MPMoviePlaybackStatePlaying         // 视频播放器处于播放状态
    //      MPMoviePlaybackStatePaused          // 视频播放器处于暂停状态
    //      MPMoviePlaybackStateInterrupted     // 视频播放器处于z中断状态
    //      MPMoviePlaybackStateSeekingForward  // 视频播放器处于快进状态
    //      MPMoviePlaybackStateSeekingBackward // 视频播放器处于快退状态
    
    // MPMoviePlayerController对象的loadState属性可以获取到当前视频数据的加载状态，枚举含义如下：
    //      MPMovieLoadStateUnknown        // 状态未知
    //      MPMovieLoadStatePlayable       // 缓存数据足够开始播放，但是视频并没有缓存完全
    //      MPMovieLoadStatePlaythroughOK  // 已经缓存完成，如果设置了自动播放，则此时会自动播放
    //      MPMovieLoadStateStalled        // 数据缓存已经停止，播放将暂停
    
    // MPMoviePlayerController对象的controlStyle属性用于设置播放器的风格，其枚举含义如下：
    //      MPMovieControlStyleNone         // 无播放器
    //      MPMovieControlStyleEmbedded     // 嵌入式风格
    //      MPMovieControlStyleFullscreen   // 充满视图风格
    //      MPMovieControlStyleDefault      // 默认风格
    
    // MPMoviePlayerController的repeatMode属性设置视频播放的循环模式，枚举值及其含义如下：
    //      MPMovieRepeatModeNone   // 视频播放结束后不循环播放
    //      MPMovieRepeatModeOne    // 视频播放结束后循环播放
    
    // MPMoviePlayerController中关于播放控制的相关方法如下：
    //      // 调用这个方法进行播放视频的准备工作
    //      - (void)prepareToPlay;
    //      // 获取播放器的准备工作是否就绪
    //      @property(nonatomic, readonly) BOOL isPreparedToPlay;
    //      // 调用此方法进行视频的播放
    //      - (void)play;
    //      // 调用此方法进行视频播放的暂停操作
    //      - (void)pause;
    //      // 调用此方法停止视频播放
    //      - (void)stop;
    //      // 当视频已播放的时间
    //      @property(nonatomic) NSTimeInterval currentPlaybackTime;
    //      // 当前视频的播放速度
    //      @property(nonatomic) float currentPlaybackRate;
    //      // 调用此方法进行快进操作
    //      - (void)beginSeekingForward;
    //      // 调用此方法进行快退操作
    //      - (void)beginSeekingBackward;
    //      // 调用此方法结束快进或快退操作
    //      - (void)endSeeking;
    // 注意：关于视频播放的快进与快退操作，只有在进行视频文件的播放时才有效，这些方法对于网络视频数据流的播放情况并没有效果。
    
    // MPMoviePlayerController中还有一些属性用于获取视屏数据相关信息，如下：
    //      // 获取媒体的类型
    //      @property (nonatomic, readonly) MPMovieMediaTypeMask movieMediaTypes;
    //      // 获取数据的类型
    //      @property (nonatomic, readonly) MPMovieSourceType movieSourceType;
    //      // 获取数据的时长
    //      @property (nonatomic, readonly)NSTimeInterval duration;
    //      // 获取可播放部分的时长
    //      @property (nonatomic, readonly) NSTimeInterval playableDuration;
    //      // 获取原始尺寸大小
    //      @propperty (nonatomic, readonly) CGSize naturalSize;
    //      // 设置启示播放的位置
    //      @property (nonatomic) NSTimeInterval initialPlaybackTime;
    //      // 设置结束播放的位置
    //      @property (nonatomic) NSTimeInterval endPlaybackTime；
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
