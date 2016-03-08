//
//  YJViewModel.h
//  MVVM-ReactiveCocoa
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by admin on 16/3/7.
//  Copyright © 2016年 阳君. All rights reserved.
//

#import <Foundation/Foundation.h>

/** ViewModel完全把Model和View进行了分离，主要的程序逻辑在ViewModel里实现*/
@interface YJViewModel : NSObject

@property (nonatomic, copy) NSString *userName; ///< 用户名
@property (nonatomic, copy) NSString *password; ///< 密码

@property (nonatomic, copy) NSString *title; ///< 标题

/**
 *  初始化相关数据
 *
 *  @return void
 */
- (void)initData;

@end
