//
//  Model.swift
//  MVC
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Foundation

/// 模型层的协议
protocol ModelProtocol {
    
    func execute(model: Model)
    
}

/// 模型层
class Model {

    /// 相关数据，发送到服务器的数据以及从服务器接收的数据
    var data: Dictionary<String, AnyObject>?
    /// 回调代理
    var delegate: ModelProtocol?
    
    /// 向服务器发送数据
    ///
    /// - returns: void
    func sendRequest() {
        print("服务器接收数据:\(self.data)")
        if self.data == nil {
            self.data = Dictionary()
        }
        self.data!["qq"] = "937447974"
        print("服务器数据处理完毕，回调中...")
        self.delegate?.execute(self)
    }
    
}
