//
//  YJFactoryMethod.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// WorkProtocol定义工厂方法所创建的对象的协议。
private protocol WorkProtocol {
    
    func doWork()
}

/// StudentWork实现WorkProtocol协议。
private class StudentWork : WorkProtocol {
    
    func doWork() {
        print("阳君同学做作业!")
    }
    
}

/// TeacherWork实现WorkProtocol协议。
class TeacherWork : WorkProtocol {
    
    func doWork() {
        print("王老师审批作业!")
    }
    
}

// MARK: -

/// WorkFactoryProtocol声明工厂方法，该方法返回一个支持WorkProtocol协议的对象。WorkFactoryProtocol也可以定义一个工厂方法的缺省实现，它返回一个缺省的WorkProtocol对象。可以调用工厂方法以创建一个Work对象。
private protocol WorkFactoryProtocol {
    
    func getWork() -> WorkProtocol
    
}

/// 重定义工厂方法以返回一个StudentWork实例。
private class StudentWorkFactory : WorkFactoryProtocol {
    
    func getWork() -> WorkProtocol {
        return StudentWork()
    }
    
}

/// 重定义工厂方法以返回一个TeacherWork实例。
private class TeacherWorkFactory : WorkFactoryProtocol {
    
    func getWork() -> WorkProtocol {
        return TeacherWork()
    }
    
}

// MARK: -

/// 工厂方法测试
class YJFactoryMethodTest: YJTestProtocol {
    
    func test() {
        let studentWorkFactory = StudentWorkFactory()
        studentWorkFactory.getWork().doWork()
        let teacherWorkFactory = TeacherWorkFactory()
        teacherWorkFactory.getWork().doWork()
    }

}
