//
//  YJMemento.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// Memento备忘录存储原发器对象的内部状态
private class Memento {
    
    var state: String?

}

/// Caretaker负责保存好备忘录,不能对备忘录的内容进行操作或检查
private class Caretaker {
    
    var memento: Memento?
    
}

/// Originator原发器创建一个备忘录,用以记录当前时刻它的内部状态。使用备忘录恢复内部状态
private class Originator {
    
    fileprivate var state: String?
    
    // MARK: 数据封装
    func createMemento() -> Memento {
        let memento = Memento()
        memento.state = self.state
        return memento
    }
    
    // MARK: 将数据重新导入
    func setMemento(_ memento: Memento) {
        self.state = memento.state
    }
    
    // MARK: 显示
    func showState() {
        print(self.state)
    }
}

// MARK: -

/// 备忘录模式
class YJMemento: YJTestProtocol {
    
    func test() {
        let org = Originator()
        org.state = "开会中"
        let ctk = Caretaker()
        // 将数据封装在Caretaker
        ctk.memento = org.createMemento()
        org.state = "睡觉中"
        org.showState()// 显示
        org.setMemento(ctk.memento!)//将数据重新导入
        org.showState()
    }
    
}
