//
//  YJFlyweight.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// FlyweightProtocol:描述一个协议，通过这个协议flyweight可以接受并作用于外部状态。
private protocol FlyweightProtocol {
    
    func action(_ arg: Int)
    
}

/// ConcreteFlyweight:实现Flyweight协议，并为内部状态（如果有的话）增加存储空间。
private class Flyweight: FlyweightProtocol {
    
    // ConcreteFlyweight对象必须是可共享的。它所存储的状态必须是内部的；
    // 即，它必须独立于ConcreteFlyweight对象的场景。
    
    func action(_ arg: Int) {
        print("参数值: \(arg)")
    }
    
}

// MARK: -

/// FlyweightFactory创建并管理flyweight对象
private class FlyweightFactory  {
    
    fileprivate static var flyweights = Dictionary<String, FlyweightProtocol>()
    
    init(arg:String){
        FlyweightFactory.flyweights[arg] = Flyweight()
    }
    
    // MARK: 获取Flyweight类
    class func getFlyweight(_ key:String) -> FlyweightProtocol {
        if (self.flyweights[key] == nil) {
            self.flyweights[key] = Flyweight()
        }
        return self.flyweights[key]!
    }
    
    // MARK: 获取当前存储的对象个数
    class func getSize() ->Int {
        return self.flyweights.count;
    }
    
}

// MARK: -

/// 享元模式
class YJFlyweight: YJTestProtocol {

    func test() {
        // 享元模式
        let fly1 = FlyweightFactory.getFlyweight("a")
        fly1.action(1)
        let fly2 = FlyweightFactory.getFlyweight("a")
        fly2.action(2);
        let fly3 = FlyweightFactory.getFlyweight("b")
        fly3.action(2);
        print("对象个数：\(FlyweightFactory.getSize())");
    }
    
}
