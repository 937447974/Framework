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

/// 测试协议
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

print("================创建型模式")
print("\n单例模式")
test.testDesignPattern(YJSingleton())
print("\n原型模式")
test.testDesignPattern(YJPrototype())
print("\n建造者模式")
test.testDesignPattern(YJBuilder())
print("\n工厂方法")
test.testDesignPattern(YJFactoryMethod())
print("\n抽象工厂")
test.testDesignPattern(YJAbstractFactory())

print("\n\n\n\n================创建型模式")
print("\n代理模式")
test.testDesignPattern(YJProxy())
print("\n桥接模式")
test.testDesignPattern(YJBridge())
print("\n适配器")
test.testDesignPattern(YJAdapter())
print("\n外观模式")
test.testDesignPattern(YJFacade())
print("\n享元模式")
test.testDesignPattern(YJFlyweight())
print("\n装饰模式")
test.testDesignPattern(YJDecorator())
print("\n组合模式")
test.testDesignPattern(YJComposite())


print("\n\n\n\n================行为型模式")
print("\n备忘录模式")
test.testDesignPattern(YJMemento())
print("\n策略模式")
test.testDesignPattern(YJStrategy())
print("\n迭代器模式")
test.testDesignPattern(YJIterator())
print("\n访问者模式")
test.testDesignPattern(YJVisitor())
print("\n观察者模式")
test.testDesignPattern(YJObserver())
print("\n解释器模式")
test.testDesignPattern(YJInterpreter())
print("\n命令模式")
test.testDesignPattern(YJCommand())
print("\n模板方法")
test.testDesignPattern(YJTemplateMethod())
print("\n状态模式")
test.testDesignPattern(YJState())
print("\n中介者模式")
test.testDesignPattern(YJMediator())
print("\n责任链模式")
test.testDesignPattern(YJCOR())



