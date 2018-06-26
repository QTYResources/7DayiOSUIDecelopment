//
//  ViewController.m
//  LoginView
//
//  Created by QinTuanye on 2018/6/26.
//  Copyright © 2018年 QinTuanye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) UITextField *userNameField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建文本输入框， 用户名输入框
    self.userNameField = [[UITextField alloc]initWithFrame:CGRectMake(40, 120, 240, 40)];
    // 创建文本输入框，密码输入框
    UITextField *passwdField = [[UITextField alloc]initWithFrame:CGRectMake(40, 200, 240, 40)];
    // 设置文本输入框风格
    self.userNameField.borderStyle = UITextBorderStyleRoundedRect;
    passwdField.borderStyle = UITextBorderStyleRoundedRect;
    // 设置输入框默认提示文字
    self.userNameField.placeholder = @"请输入用户名";
    passwdField.placeholder = @"请输入密码";
    
    UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    userImage.image = [UIImage imageNamed:@"login_user"];
    UIImageView *passImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    passImage.image = [UIImage imageNamed:@"login_pwdico"];
    // 设置输入框的左挂件视图
    self.userNameField.leftView = userImage;
    passwdField.leftView = passImage;
    self.userNameField.leftViewMode = UITextFieldViewModeAlways;
    passwdField.leftViewMode = UITextFieldViewModeAlways;
    
    // 设置代理
    self.userNameField.delegate = self;
    
    [self.view addSubview:self.userNameField];
    [self.view addSubview:passwdField];
    // 创建并设置登录按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(110, 260, 100, 30);
    [btn setTitle:@"立即登录" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 重写UIViewController的touchBegin方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.userNameField resignFirstResponder];
}

#pragma mark -- 实现UITextFieldDelegate协议
// 实现代理方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length > 0) {
        if ([string characterAtIndex:0] <= '9' && [string characterAtIndex:0] >= '0') {
            if (textField.text.length <= 10) {
                return YES;
            }
        }
        NSLog(@"请输入正确的手机号");
        return NO;
    }
    return YES;
}

// 当按下Enter键后调用
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
