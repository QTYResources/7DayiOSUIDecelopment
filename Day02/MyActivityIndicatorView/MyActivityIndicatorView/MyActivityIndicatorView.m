//
//  MyActivityIndicatorView.m
//  MyActivityIndicatorView
//
//  Created by QinTuanye on 2018/6/26.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "MyActivityIndicatorView.h"

@implementation MyActivityIndicatorView

+ (MyActivityIndicatorView *)getActivityIndicatorView {
    // 设置单例的方法
    static MyActivityIndicatorView *myView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myView = [[MyActivityIndicatorView alloc]init];
    });
    return myView;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 进行视图初始化
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        // 进行标签控件的初始化
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height / 2 + 20, self.frame.size.width, 30)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        // 进行指示器控件的初始化
        UIActivityIndicatorView *ind = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        ind.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        [ind startAnimating];
        [self addSubview:ind];
    }
    return self;
}

+ (void)startActivity {
    // 进行安全判断，确认指示器控件当前不在展示状态
    if ([MyActivityIndicatorView getActivityIndicatorView].show) {
        return;
    }
    // 将指示器视图添加到应用的window上
    [[[UIApplication sharedApplication].delegate window]addSubview:[MyActivityIndicatorView getActivityIndicatorView]];
    // 修改指示器控件状态
    [MyActivityIndicatorView getActivityIndicatorView].show = YES;
}

+ (void)stopActivity {
    // 进行安全判断，确认指示器控件当前正在展示
    if ([MyActivityIndicatorView getActivityIndicatorView].show) {
        // 将指示器视图冲其父视图上移除
        [[MyActivityIndicatorView getActivityIndicatorView]removeFromSuperview];
    }
    // 修改指示器控件状态
    [MyActivityIndicatorView getActivityIndicatorView].show = NO;
}

+ (void)setText:(NSString *)text {
    // 修改指示器提示文字
    [MyActivityIndicatorView getActivityIndicatorView].titleLabel.text = text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
