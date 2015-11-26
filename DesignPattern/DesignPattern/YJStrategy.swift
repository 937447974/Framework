//
//  YJStrategy.swift
//  DesignPattern
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// StrategyProtocol定义所有支持的算法的公共接口
private protocol StrategyProtocol {
    
    func method()
    
}

/// 以StrategyProtocol接口实现某具体算法
class StrategyA: StrategyProtocol {
    
    func method() {
        print("StrategyA实现");
    }
    
}

/// 以StrategyProtocol接口实现某具体算法
class StrategyB: StrategyProtocol {
    
    func method() {
        print("StrategyB实现");
    }
    
}

/// 维护一个对Strategy对象的引用
private class ContextSt {
    
    var strategy: StrategyProtocol?
    
    func doMethod() {
        self.strategy?.method()
    }
    
}

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
