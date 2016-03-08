//
//  YJViewController.m
//  MVVM-ReactiveCocoa
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 阳君. All rights reserved.
//

#import "YJViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACEXTScope.h"
#import "YJViewModel.h"

@interface YJViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField; ///< 用户名
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField; ///< 密码
@property (weak, nonatomic) IBOutlet UIButton *loginButton;          ///< 登录按钮

@property (nonatomic, strong) YJViewModel *viewModel; ///< ViewModel对象

@end

@implementation YJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 校验用户输入信息
    RACSignal *validUserNameSignal = [self.userNameTextField.rac_textSignal map:^id(NSString *value) {
        return @(value.length > 3);
    }];
    RACSignal *validPasswordSignal = [self.passwordTextField.rac_textSignal map:^id(NSString *value) {
        return @(value.length > 3);
    }];
    
    // 根据用户输入信息修改输入框背景色
    RAC(self.userNameTextField, backgroundColor) = [validUserNameSignal map:^id(NSNumber *value) {
        return value.boolValue ? [UIColor greenColor] : [UIColor redColor];
    }];
    RAC(self.passwordTextField, backgroundColor) = [validPasswordSignal map:^id(NSNumber *value) {
        return value.boolValue ? [UIColor greenColor] : [UIColor redColor];
    }];
    
    // 按钮能否点击
    RAC(self.loginButton, enabled) = [RACSignal combineLatest:@[validUserNameSignal, validPasswordSignal] reduce:^id(NSNumber *usernameValid, NSNumber *passwordValid){
        return @([usernameValid boolValue] && [passwordValid boolValue]);
    }];
    
    @weakify(self);
    // 1s内禁止重复点击
    [[[[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] map:^id(id value) {
        @strongify(self);
        self.loginButton.enabled = NO;
        [self.viewModel initData];
        return @(true);
    }] throttle:1] subscribeNext:^(id x) {
        @strongify(self);
        self.loginButton.enabled = YES;
    }];
    
    // viewModel绑定
    self.viewModel = [[YJViewModel alloc] init];
    RAC(self.viewModel, userName) = [self.userNameTextField.rac_textSignal map:^id(id value) {
        return value;
    }];
    RAC(self.viewModel, password) = [self.passwordTextField.rac_textSignal map:^id(id value) {
        return  value;
    }];
    RAC(self, title) = RACObserve(self.viewModel, title);
    
}

@end
