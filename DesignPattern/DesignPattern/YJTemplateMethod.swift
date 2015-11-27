//
//  YJTemplateMethod.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// Template定义抽象的原语操作，具体的子类将重定义它们以实现一个算法的各步骤。
private class Template {
    
    // MARK: 子类实现
    func println() {
        
    }
    
    // MARK: 原始方法
    func update() {
        print("开始打印")
        for (var i = 0; i < 3; i++) {
            self.println()
        }
    }
    
}

/// TemplateConcrete实现原语操作以完成算法中与特定子类相关的步骤
private class TemplateConcrete: Template {
    
    override func println() {
        print("这是子类的实现")
    }
    
}

// MARK: - 

/// 模板方法
class YJTemplateMethod: YJTestProtocol {

    func test() {
        let temp: Template = TemplateConcrete()
        temp.update()
    }
    
}
