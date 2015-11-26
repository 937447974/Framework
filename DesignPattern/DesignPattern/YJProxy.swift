//
//  YJProxy.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// ObjectP定义ObjectImpl和ProxyObject的共用协议，这样就在任何使用ObjectImpl的地方都可以使用ProxyObject
private protocol ObjectProtocol {
    
    func action()
    
}

/// ProxyObject保存一个引用使得代理可以访问实体。
private class ProxyObject {
    
    /// 被代理类
    var objProtocol: ObjectProtocol?
    
    // MARK: 代理方法实现
    func action() {
        print("send action begin");
        self.objProtocol?.action();
        print("send action end");
    }
    
}

/// RealSubject定义Proxy所代表的实体。
private class ViewController: ObjectProtocol {
    
    func action() {
        print("get action");
    }
    
}

// MARK: -
/// 代理模式
class YJProxy: YJTestProtocol {

    func test() {
        let vc = ViewController() // 当前VC
        let obj = ProxyObject()
        obj.objProtocol = vc // 设置代理类
        obj.action() // 发送消息
    }
    
}
