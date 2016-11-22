//
//  YJViewModel.swift
//  MVVM
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 16/1/15.
//  Copyright © 2016年 阳君. All rights reserved.
//

import UIKit

/// ViewModel层的协议,view层实现
protocol YJViewModelProtocol {
    
    // 定义一系列通知UI的接口
    func execute(_ viewModel: YJViewModel)
    
}

/// ViewModel完全把Model和View进行了分离，主要的程序逻辑在ViewModel里实现。
open class YJViewModel: YJModelProtocol {
    
    /// 姓名
    var name: String?
    /// view层代理
    var delegate: YJViewModelProtocol?
    
    // 开始数据准备
    func initData() {
        print("\nViewModel Begin++++++++++++")
        print("ViewModel层收到UI指令")
        // 向服务器发送数据
        let model = YJModel()
        model.data = Dictionary()
        model.data!["name"] = "阳君" as AnyObject?
        model.delegate = self // 当前类接收数据
        print("开始请求Model层获取数据")
        model.sendRequest()
    }
    
    func execute(_ model: YJModel) {
        print("\nViewModel层收到Model层数据：\(model.data)")
        self.name = model.data?["name"] as? String
        print("ViewModel层通知UI层，数据已准备")
        print("ViewModel End++++++++++++")
        self.delegate?.execute(self)
    }
    
}
