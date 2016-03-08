//
//  YJViewModel.m
//  MVVM-ReactiveCocoa
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 阳君. All rights reserved.
//

#import "YJViewModel.h"

@implementation YJViewModel

- (void)initData
{
    NSLog(@"用户名:%@; 密码:%@", self.userName, self.password);
    self.title = @"阳君：937447974";
}

@end
