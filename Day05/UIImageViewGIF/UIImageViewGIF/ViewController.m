//
//  ViewController.m
//  UIImageViewGIF
//
//  Created by QinTuanye on 2018/7/12.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"
#import <ImageIO/ImageIO.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 280, 200)];
    [self.view addSubview:imageView];
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"gifImage" ofType:@"gif"];
    // 获取GIF文件数据
    CGImageSourceRef source = CGImageSourceCreateWithURL((CFURLRef)[NSURL fileURLWithPath:dataPath], NULL);
    // 获取GIF文件中图片的个数
    size_t count = CGImageSourceGetCount(source);
    // 定义一个变量，记录GIF播放一轮的时间
    float allTime = 0;
    // 存放所有图片
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    // 存放每一帧播放的时间
    NSMutableArray *timeArray = [[NSMutableArray alloc]init];
    // 存放每张图片的宽度（一般在一个GIF文件中，所有图片尺寸都相同）
    NSMutableArray *widthArray = [[NSMutableArray alloc]init];
    // 存放每张图片的高度
    NSMutableArray *heightArray = [[NSMutableArray alloc]init];
    // 遍历
    for (size_t i = 0; i < count; i++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
        [imageArray addObject:(__bridge UIImage *)(image)];
        CGImageRelease(image);
        // 获取图片信息
        NSDictionary *info = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        CGFloat width = [[info objectForKey:(__bridge NSString *)kCGImagePropertyWidth] floatValue];
        CGFloat height = [[info objectForKey:(__bridge NSString *)kCGImagePropertyHeight] floatValue];
        [widthArray addObject:[NSNumber numberWithFloat:width]];
        [heightArray addObject:[NSNumber numberWithFloat:height]];
        NSDictionary *timeDic = [info objectForKey:(__bridge NSString *)kCGImagePropertyGIFDictionary];
        CGFloat time = [[timeDic objectForKey:(__bridge NSString *)kCGImagePropertyGIFDelayTime]floatValue];
        allTime += time;
        [timeArray addObject:[NSNumber numberWithFloat:time]];
    }
    
    // 添加帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    NSMutableArray *times = [[NSMutableArray alloc]init];
    float currentTime = 0;
    // 设置每一帧的时间占比
    for (int i = 0; i < imageArray.count; i++) {
        [times addObject:[NSNumber numberWithFloat:currentTime / allTime]];
        currentTime += [timeArray[i] floatValue];
    }
    [animation setKeyTimes:times];
    [animation setValues:imageArray];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    // 设置循环
    animation.repeatCount = MAXFLOAT;
    // 设置播放总时长
    animation.duration = allTime;
    // Layer层添加
    [[imageView layer]addAnimation:animation forKey:@"gitAnimation"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
