//
//  YJSingleton.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// 单例
private class Singleton  {
    
    static let shared = Singleton()
    
    init() {
        print("创建\(#file)")
    }
    
}

/// 单例模式测试
class YJSingleton: YJTestProtocol {
    
    func test() {
        var singleton = Singleton.shared
        print(singleton)
        singleton = Singleton.shared
        print(singleton)
    }
    
}
