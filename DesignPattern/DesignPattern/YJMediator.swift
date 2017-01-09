//
//  YJMediator.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// MediatorProtocol中介者定义一个协议用于与各同事（Colleague）对象通信。
private protocol MediatorProtocol {
    
    // MARK: 通知
    func notice(_ content:String)
    
}

/// ConcreteMediator具体中介者通过协调各同事对象实现协作行为。
private class ConcreteMediator: MediatorProtocol {
    
    /// 员工A
    fileprivate let ca: ColleagueProtocol = ColleagueA()
    /// 员工B
    fileprivate let cb: ColleagueProtocol = ColleagueB()
    
    func notice(_ content: String) {
        switch(content) {
        case "boss":// 老板来了, 通知员工A
            print("老板来了...")
            ca.action()
        case "client":// 客户来了, 通知前台B
            print("客户来了...")
            cb.action()
        default:
            print("错误通知...")
        }
    }
    
}

// MARK: - 

/// ColleagueProtocol协议
private protocol ColleagueProtocol {
    
    // MARK: 通知
    func action()
    
}

/// 同事A
private class ColleagueA: ColleagueProtocol {
    
    func action() {
        print("普通员工努力工作")
    }
    
}

/// 同事B
private class ColleagueB: ColleagueProtocol {
    
    func action() {
        print("前台注意了!")
    }
    
}

// MARK: -

/// 中介者模式
class YJMediator: YJTestProtocol {

    func test() {
        let med = ConcreteMediator()
        // 老板来了
        med.notice("boss")
        // 客户来了
        med.notice("client")
        // 通知错误
        med.notice("other")
    }
    
}
