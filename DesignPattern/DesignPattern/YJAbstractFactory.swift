//
//  YJAbstractFactory.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// CatProtocol为一类产品对象声明一个协议。
private protocol CatProtocol {
    
    func eat()
    
}

/// WhiteCat定义一个将被相应的具体工厂创建的产品对象。实现CatProtocol协议
private class WhiteCat: CatProtocol {
    
    func eat() {
        print("The white cat is eating!")
    }
    
}

/// BlackCat定义一个将被相应的具体工厂创建的产品对象。实现CatProtocol协议
private class BlackCat: CatProtocol {
    
    func eat() {
        print("The black cat is eating!")
    }
    
}

// MARK: -

/// DogProtocol为一类产品对象声明一个协议。
private protocol DogProtocol {
    
    func eat()
    
}

/// WhiteDog定义一个将被相应的具体工厂创建的产品对象。实现DogProtocol协议
private class WhiteDog: DogProtocol {
    
    func eat() {
        print("The white dog is eating!")
    }
    
}

/// BlackDog定义一个将被相应的具体工厂创建的产品对象。实现DogProtocol协议
private class BlackDog: DogProtocol {
    
    func eat() {
        print("The black dog is eating!")
    }
    
}

// MARK: -

/// AnimalFactoryProtocol声明一个创建抽象产品对象的操作协议。
private protocol AnimalFactoryProtocol {
    
    /// 创建ICat
    func createCat() -> CatProtocol
    
    /// 创建IDog
    func createDog() -> DogProtocol
    
}

/// WhiteAnimalFactory 实现创建具体产品对象的操作。
private class WhiteAnimalFactory: AnimalFactoryProtocol {
    
    func createCat() -> CatProtocol {
        return WhiteCat()
    }
    
    func createDog() -> DogProtocol {
        return WhiteDog()
    }
    
}

/// BlackAnimalFactory 实现创建具体产品对象的操作。
private class BlackAnimalFactory: AnimalFactoryProtocol {
    
    func createCat() -> CatProtocol {
        return BlackCat()
    }
    
    func createDog() -> DogProtocol {
        return BlackDog()
    }
    
}

// MARK: -

/// 抽象工厂
class YJAbstractFactory: YJTestProtocol {

    func test() {
        let blackAnimalFactory = BlackAnimalFactory()
        let whiteAnimalFactory = WhiteAnimalFactory()
        
        var cat = blackAnimalFactory.createCat()
        cat.eat()
        cat = whiteAnimalFactory.createCat()
        cat.eat()
        
        var dog = blackAnimalFactory.createDog()
        dog.eat()
        dog = whiteAnimalFactory.createDog()
        dog.eat()
    }
    
}
