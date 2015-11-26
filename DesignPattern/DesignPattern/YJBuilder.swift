//
//  YJBuilder.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// Person 表示被构造的复杂对象
private class Person {
    
    /// 头
    var head:String = ""
    /// 身体
    var body:String = ""
    /// 脚
    var foot:String = ""
    
}

/// 男人
private class Man: Person {
    
}

// MARK: -

/// PersonBuilder为创建一个Person对象的各个部件指定抽象协议
private protocol PersonBuilder {
    
    /// 造头
    func buildHead()
    
    /// 造身体
    func buildBody()
    
    /// 造脚
    func buildFoot()
    
    /// 造人
    func buildPerson() -> Person
    
}


/// ManBuilder实现PersonBuilder的协议以构造和装配该产品的各个部件。定义并明确它所创建的表示。提供一个检索产品的协议。
private class ManBuilder: PersonBuilder {
    
    /// 人员对象
    let person:Person = Man()
    
    // MARK: 造头
    func buildHead() {
        person.head = "建造男人的头"
        print(person.head)
    }
    
    // MARK: 造身体
    func buildBody() {
        person.body = "建造男人的身体"
        print(person.body)
    }
    
    // MARK: 造脚
    func buildFoot() {
        person.foot = "建造男人的脚"
        print(person.foot)
    }
    
    // MARK: 造人
    func buildPerson() -> Person {
        return person
    }
    
}

// MARK: -

/// PersonDirector构造一个使用PersonBuilder协议的对象。
private class PersonDirector {
    
    // MARK: 通过装配器构造人员对象
    func constructPerson(pb:PersonBuilder) -> Person {
        pb.buildHead()
        pb.buildBody()
        pb.buildFoot()
        return pb.buildPerson()
    }
    
}

// MARK: -

/// 建造者模式
class YJBuilderTest: YJTestProtocol {

    func test() {
        // 构造器
        let pd = PersonDirector()
        // 装配器
        let mb = ManBuilder()
        // 创建对象
        let person = pd.constructPerson(mb)
        print(person)
    }
    
}
