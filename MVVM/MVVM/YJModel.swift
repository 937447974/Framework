//
//  YJModel.swift
//  MVP
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 16/1/15.
//  Copyright © 2016年 阳君. All rights reserved.
//

import Foundation

/// 模型层的协议
protocol YJModelProtocol {
    
    func execute(_ model: YJModel)
    
}

/// model层，处理与服务器的响应
class YJModel: NSObject {
    
    /// 相关数据，发送到服务器的数据以及从服务器接收的数据
    var data: Dictionary<String, AnyObject>?
    /// 回调代理
    var delegate: YJModelProtocol?
    
    /// 向服务器发送数据
    ///
    /// - returns: void
    func sendRequest() {
        print("\nModel Begin============")
        print("Model收到通知开始请求服务器")
        print("服务器接收数据:\(self.data)")
        if self.data == nil {
            self.data = Dictionary()
        }
        self.data!["qq"] = "937447974" as AnyObject?
        print("服务器数据处理完毕，回发中...")
        print("Model收到服务器发回的数据，通知上一层")
        print("Model End============")
        self.delegate?.execute(self)
    }
    
}
