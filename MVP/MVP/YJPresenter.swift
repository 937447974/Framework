//
//  YJPresenter.swift
//  MVP
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/28.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Foundation

/// Presenter层的协议,view层实现
protocol YJPresenterProtocol {
    
    // 定义一系列通知UI的接口
    func execute(presenter: YJPresenter)
    
}

/// Presenter完全把Model和View进行了分离，主要的程序逻辑在Presenter里实现。
class YJPresenter: YJModelProtocol {
    
    /// 姓名
    var name: String?
    /// view层代理
    var delegate: YJPresenterProtocol?
    
    // 开始数据准备
    func initData() {
        print("\nPresenter Begin++++++++++++")
        print("Presenter层收到UI指令")
        // 向服务器发送数据
        let model = YJModel()
        model.data = Dictionary()
        model.data!["name"] = "阳君"
        model.delegate = self // 当前类接收数据
        print("开始请求Model层获取数据")
        model.sendRequest()
    }
    
    func execute(model: YJModel) {
        print("\nPresenter层收到Model层数据：\(model.data)")
        self.name = model.data?["name"] as? String
        print("Presenter层通知UI层，数据已准备")
        print("Presenter End++++++++++++")
        self.delegate?.execute(self)
    }
    
}
