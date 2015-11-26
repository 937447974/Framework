//
//  YJDecorator.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// PersonProtocol定义一个对象协议，可以给这些对象动态地添加职责。
private protocol PersonProtocol {
    
    func eat()
    
}

/// Man定义一个对象，可以给这个对象添加一些职责
private class Man: PersonProtocol {
    
    func eat() {
        print("男人在吃")
    }
    
}

/// Decorator维持一个指向PersonProtocol对象的指针，并定义一个与PersonProtocol协议一致的协议
private class Decorator: PersonProtocol {
    
    /// 协议对象，等待实现
    var person: PersonProtocol?
    
    func eat() {
        person?.eat()
    }
    
}

/// ManDecoratorA向组件添加职责
private class ManDecoratorA: Decorator {
    
    override func eat() {
        super.eat()
        print("ManDecoratorA类");
    }
}

/// ManDecoratorB向组件添加职责
private class ManDecoratorB: Decorator {
    
    override func eat() {
        super.eat();
        print("ManDecoratorB类");
    }
    
}

/// 装饰模式
class YJDecorator: YJTestProtocol {

    func test() {
        let man = Man()
        let md1 = ManDecoratorA()
        let md2 = ManDecoratorB()
        md1.person = man
        md2.person = md1
        md2.eat()
    }
    
}
