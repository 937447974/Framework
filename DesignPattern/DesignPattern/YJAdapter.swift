//
//  YJAdapter.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

///  定义Client使用的与特定领域相关的协议
private protocol Target {
    
    func adapteeMethod()
    
    func adapterMethod()
    
}

/// Adaptee定义一个已经存在的协议，这个协议需要适配。
private class Adaptee {
    
    func adapteeMethod() {
        print("Adaptee method!")
    }
    
}

/// Adapter对Adaptee的协议与Target协议进行适配
private class Adapter: Target {
    
    var adaptee: Adaptee?
    
    func adapteeMethod() {
        adaptee?.adapteeMethod()
    }
    
    func adapterMethod() {
        print("Adapter method!");
    }
    
}

/// 适配器
class YJAdapter: YJTestProtocol {

    func test() {
        let target = Adapter()
        target.adaptee = Adaptee()
        // Client与符合Target协议的对象协同。
        target.adapteeMethod();
        target.adapterMethod();
    }
    
}
