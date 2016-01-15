//
//  YJPresenter.swift
//  MVP
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 16/1/15.
//  Copyright © 2016年 阳君. All rights reserved.
//

import UIKit

/// Presenter层
class YJPresenter: NSObject, YJModelProtocol {
    
    /// 姓名
    @IBOutlet weak var nameLabel: UILabel!
    
    func viewDidLoad() {
        // 开始数据准备
        print("\nPresenter层收到View层指令")
        print("Presenter Begin++++++++++++")
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
        self.nameLabel.text = model.data?["name"] as? String
        print("Presenter End++++++++++++")
    }
    
}
