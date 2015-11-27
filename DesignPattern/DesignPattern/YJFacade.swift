//
//  YJFacade.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// 服务A协议
private protocol ServiceProtocolA {
    
    func methodA()
    
}

/// ServiceA的实现
private class ServiceA: ServiceProtocolA {
    
    func methodA() {
        print("这是服务A")
    }
    
}

// MARK: -

/// 服务B协议
private protocol ServiceProtocolB {
  
    func methodB()
    
}

/// ServiceB的实现
private class ServiceB: ServiceProtocolB {
    
    func methodB() {
        print("这是服务B")
    }
    
}

// MARK: -

/// Facade知道哪些子系统类负责处理请求。将客户的请求代理给适当的子系统对象。
private class Facade {
    
    /// 服务A
    let sa: ServiceProtocolA = ServiceA()
    /// 服务B
    let sb: ServiceProtocolB = ServiceB()
    
    // MARK: 请求A
    func methodA() {
        // 协同工作
        sa.methodA()
        sb.methodB()
    }
    
    // MARK: 请求B
    func methodB() {
        sb.methodB()
    }
}

// MARK: -

/// 外观模式
class YJFacade: YJTestProtocol {

    func test() {
        let facade = Facade()
        facade.methodA();
        facade.methodB();
    }
}
