//
//  YJIterator.swift
//  DesignPattern
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// 聚合定义创建相应迭代器对象的接口
protocol ListProtocol {
    
    func iterator() -> IteratorProtocol
    
    func get(index:Int) -> AnyObject
    
    func getSize() -> Int
    
    func add(obj:AnyObject)
    
}

/// 具体聚合实现创建相应迭代器的接口，该操作返回ConcreteIterator的一个适当的实例.
class List: ListProtocol {
    
    /// 数组
    private var list:[AnyObject] = []
    /// 位置
    private var index:Int = 0
    /// 长度
    private var size:Int = 0
    
    func iterator() -> IteratorProtocol {
        return Iterator(list: self)
    }
    
    func get(index:Int) ->AnyObject {
        return list[index]
    }
    
    func getSize() ->Int {
        return size
    }
    
    func add(obj:AnyObject) {
        list.append(obj)
        index += 1
        size += 1
    }
    
}

// MARK: - 

/// 迭代器定义访问和遍历元素的接口
protocol IteratorProtocol {
    
    func next() ->AnyObject

    func hasNext() ->Bool
    
}

/// 具体迭代器实现迭代器接口,对该聚合遍历时跟踪当前位置
class Iterator: IteratorProtocol {
    
    /// 数组
    private var list:List
    /// 位置
    private var index:Int
    
    init(list:List) {
        self.index = 0
        self.list = list
    }
    
    func next() -> AnyObject {
        let obj:AnyObject = self.list.get(index)
        self.index += 1
        return obj
    }
    
    func hasNext() -> Bool {
        return self.index < self.list.getSize()
    }
    
}

// MARK: - 

/// 迭代器
class YJIterator: YJTestProtocol {

    func test() {
        let list = List()
        list.add("a")
        list.add("b")
        list.add("c")
        //第一种迭代方式
        let it = list.iterator();
        while (it.hasNext()) {
            print(it.next())
        }
        print("===========")
        //第二种迭代方式
        for (var i = 0; i < list.getSize(); i++) {
            print(list.get(i));
        }
    }
    
}
