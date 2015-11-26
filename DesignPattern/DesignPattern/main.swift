//
//  main.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Foundation

/// 测试代理
protocol YJTestProtocol {
    
    /// 测试
    ///
    /// - returns: void
    func test()
    
}

/// 测试类
class YJTest {
    
    /// 测试设计模式
    ///
    /// - parameter test : YJTestProtocol
    ///
    /// - returns: void
    func testDesignPattern(test:YJTestProtocol) {
        test.test()
    }
    
}

let test = YJTest()
test.testDesignPattern(YJSingletonTest())