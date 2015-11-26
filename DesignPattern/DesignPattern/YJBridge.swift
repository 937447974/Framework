//
//  YJBridge.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// Clothing定义实现类的协议，该协议不一定要与PersonBr的协议完全一致
private protocol Clothing {
    
    func personDressCloth(person:Person)
    
}

/// Trouser实现Clothing协议并定义它的具体实现。
private class Trouser: Clothing {
    
    func personDressCloth(person: Person) {
        print("\(person.type)穿裤子");
    }
    
}

/// Clothes实现Clothing协议并定义它的具体实现
private class Clothes: Clothing {
    
    func personDressCloth(person: Person) {
        print("\(person.type)穿衣服");
    }
    
}

// MARK: -

/// PersonBr定义抽象类的协议。
private class Person {
    
    /// 服装
    var clothing:Clothing?
    /// 标示
    var type:String = ""
    
    /// 桥接的动作
    func dress() {
        
    }
    
}

/// Man扩充由Person定义的协议
private class Man: Person {
    
    override init() {
        super.init()
        super.type = "男人"
    }
    
    override func dress() {
        super.clothing?.personDressCloth(self)
    }
    
}

/// Lady扩充由Person定义的协议
private class Lady: Person {
    
     override init() {
        super.init()
        self.type = "女人"
    }
    
    override func dress() {
        super.clothing?.personDressCloth(self)
    }
    
}

// MARK: -

/// 桥接模式
class YJBridge: YJTestProtocol {

    func test() {
        let clothes: Clothing = Clothes()
        let trouser: Clothing = Trouser()
        
        let man: Person = Man()
        let lady: Person = Lady()
        
        man.clothing = clothes
        man.dress()
        man.clothing = trouser
        man.dress()
        // 或
        clothes.personDressCloth(lady)
        trouser.personDressCloth(lady)
    }
    
}
