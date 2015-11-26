//
//  YJPrototype.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// 实现一个克隆自身的操作
private class Prototype {

    var name:String = ""
    
    // MARK: 克隆
    func clone() -> Prototype {
        let pro = Prototype()
        pro.name = name
        return pro
    }
}

/// ConcretePrototype 实现一个克隆自身的原型
private class ConcretePrototype: Prototype {
    
    init(name:String) {
        super.init()
        super.name = name
    }
    
}

/// 原型模式测试
class YJPrototype: YJTestProtocol {
    
    func test() {
        let pro = ConcretePrototype(name:"阳君")
        //  Client,让一个原型克隆自身从而创建一个新的对象。
        let pro2 = pro.clone()
        print(pro.name)
        print(pro2.name)
    }
    
}