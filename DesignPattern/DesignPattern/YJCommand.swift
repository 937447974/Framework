//
//  YJCommand.swift
//  DesignPattern
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// Receiver知道如何实施与执行一个请求相关的操作
private class Receiver {
    
    func receive() {
        print("This is Receive class!")
    }
    
}

// MARK: -

/// Command声明执行操作的接口
private protocol CommandProtocol {
    
    func execute()
    
}

/// ConcreteCommand将一个接收者对象绑定于一个动作。
private class Command: CommandProtocol {
    
    /// 接受者
    var receiver:Receiver?
    
    // MARK: 初始化
    init(receiver:Receiver) {
        self.receiver = receiver
    }
    
    // MARK: 执行请求
    func execute() {
        // 调用接收者相应的操作，以实现Execute
        self.receiver?.receive()
    }
    
}

// MARK: -

/// Invoker要求该操作者执行这个命令
private class Invoker {
    
    /// 操作者
    var command: CommandProtocol?
    
    func execute() {
        command?.execute();
    }
    
}

// MARK: -

/// 命令模式
class YJCommand: YJTestProtocol {
    
    func test() {
        let rec = Receiver()
        let cmd = Command(receiver:rec)
        // Client:创建一个具体命令对象并设定它的接收者。
        let i = Invoker()
        i.command = cmd
        i.execute()
    }
}
