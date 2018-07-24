//
//  ViewController.m
//  PhoneTest
//
//  Created by QinTuanye on 2018/7/24.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)call:(id)sender {
    // iOS10.0之前拨打电话方法
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://13333333333"]];
    // iOS10.0之后拨打电话的方法
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://13333333333"] options:@{UIApplicationOpenURLOptionsAnnotationKey:@YES} completionHandler:^(BOOL success) {
        NSLog(@"%s call compeltion: %d", __func__, success);
    }];
}

@end
