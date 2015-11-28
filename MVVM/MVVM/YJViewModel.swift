//
//  YJViewModel.swift
//  MVVM
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/28.
//  Copyright © 2015年 阳君. All rights reserved.
//

import UIKit

/// ViewModel层
class YJViewModel: NSObject, YJModelProtocol {
    
    /// 姓名
    @IBOutlet weak var nameLabel: UILabel!
    
    func viewDidLoad() {
        // 开始数据准备
        print("\nViewModel层收到View层指令")
        print("ViewModel Begin++++++++++++")
        // 向服务器发送数据
        let model = YJModel()
        model.data = Dictionary()
        model.data!["name"] = "阳君"
        model.delegate = self // 当前类接收数据
        print("开始请求Model层获取数据")
        model.sendRequest()
    }
    
    func execute(model: YJModel) {
        print("\nViewModel层收到Model层数据：\(model.data)")
        self.nameLabel.text = model.data?["name"] as? String
        print("ViewModel End++++++++++++")
    }
    
}
