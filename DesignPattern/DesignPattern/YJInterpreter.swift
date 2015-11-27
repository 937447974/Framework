//
//  YJInterpreter.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// 声明一个抽象的解释操作，这个协议为抽象语法树中所有的节点所共享
private protocol ExpressionProtocol {
    
    func interpret(context: Context)
    
}

private class AdvanceExpression: ExpressionProtocol {
    
    func interpret(context: Context){
        print("\(context.content) 这是高级解析器!")
    }
}

private class SimpleExpression: ExpressionProtocol {
    
    func interpret(context: Context) {
        print("\(context.content) 这是普通解析器!")
    }
    
}

// MARK: -

/// Context（上下文）包含解释器之外的一些全局信息
private class Context {
    
    /// 全局信息
    var content:String = ""
    /// 解释器数组
    var list: [ExpressionProtocol] = []
    
    // MARK: 增加
    func add(expression: ExpressionProtocol) {
        self.list.append(expression)
    }
    
}

// MARK: -

/// 解释器模式
class YJInterpreter: YJTestProtocol {

    func test() {
        let ctx = Context()
        ctx.content = "Context"
        ctx.add(AdvanceExpression())
        ctx.add(SimpleExpression())
        for ex in ctx.list {
            ex.interpret(ctx)
        }
    }
    
}
