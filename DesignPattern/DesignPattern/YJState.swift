//
//  YJState.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// WeatherProtocol定义一个协议以封装与Context的一个特定状态相关的行为
private protocol WeatherProtocol {
    
    func getWeather() ->String
    
}

private class Rain: WeatherProtocol {
    
    func getWeather() -> String {
        return "下雨"
    }
    
}

private class Sunshine: WeatherProtocol {
    
    func getWeather() -> String {
        return "阳光"
    }
    
}

// MARK: -

/// Context定义客户感兴趣的协议
private class Context {
    
    var weather: WeatherProtocol?
    
    func weatherMessage() ->String?{
        return self.weather?.getWeather()
    }
    
}

// MARK: - 

/// 状态模式
class YJState: YJTestProtocol {

    func test() {
        let ctx = Context()
        print("\(ctx.weatherMessage())")
        ctx.weather = Sunshine()
        print("\(ctx.weatherMessage())")
        // 改变状态
        ctx.weather = Rain()
        print("\(ctx.weatherMessage())")
    }
}
