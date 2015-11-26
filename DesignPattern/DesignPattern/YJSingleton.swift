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

    init() {
        print("创建\(__FILE__)")
    }
    
    class func getInstance() -> Singleton {
        // 只执行一次
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var value: Singleton?
        }
        dispatch_once(&Static.onceToken) { () -> Void in
            Static.value = Singleton()
        }
        return Static.value!
    }

}

/// 单例模式测试
class YJSingletonTest: YJTestProtocol {
    
    func test() {
        var singleton = Singleton.getInstance()
        print(singleton)
        singleton = Singleton.getInstance()
        print(singleton)
    }
    
}
