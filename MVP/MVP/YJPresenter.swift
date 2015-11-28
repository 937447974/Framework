//
//  YJPresenter.swift
//  MVP
//
//  Created by yangjun on 15/11/28.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Foundation

/// Presenter层的协议
protocol YJPresenterProtocol {
    
    // 定义一系列通知UI的接口
    func execute(presenter: YJPresenter)
    
}

/// Presenter完全把Model和View进行了分离，主要的程序逻辑在Presenter里实现。
class YJPresenter: YJModelProtocol {
    
    /// 姓名
    var name: String?
    var delegate: YJPresenterProtocol?
    
    // 开始数据准备
    func initData() {
        // 向服务器发送数据
        let model = YJModel()
        model.data = Dictionary()
        model.data!["name"] = "阳君"
        model.delegate = self // 当前类接收数据
        print("开始请求服务器")
        model.sendRequest()
    }
    
    func execute(model: YJModel) {
        print("UI接收数据：\(model.data)")
        self.name = model.data?["name"] as? String
        // 通知view层
        self.delegate?.execute(self)
    }
    

}
