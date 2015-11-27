//
//  YJStrategy.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// StrategyProtocol定义所有支持的算法的公共协议
private protocol StrategyProtocol {
    
    func method()
    
}

/// 以StrategyProtocol协议实现某具体算法
private class StrategyA: StrategyProtocol {
    
    func method() {
        print("StrategyA实现");
    }
    
}

/// 以StrategyProtocol协议实现某具体算法
private class StrategyB: StrategyProtocol {
    
    func method() {
        print("StrategyB实现");
    }
    
}

// MARK: -

/// 维护一个对Strategy对象的引用
private class ContextSt {
    
    var strategy: StrategyProtocol?
    
    func doMethod() {
        self.strategy?.method()
    }
    
}

// MARK: -

/// 策略模式
class YJStrategy: YJTestProtocol {

    func test() {
        let ctxSt = ContextSt()
        ctxSt.strategy = StrategyA()
        ctxSt.doMethod()
        ctxSt.strategy = StrategyB()
        ctxSt.doMethod()
    }
    
}
