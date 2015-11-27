//
//  ViewController.swift
//  MVC
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 向服务器发送数据
        let model = Model()
        model.data = Dictionary()
        model.data!["name"] = "阳君"
        model.delegate = self // 当前类接收数据
        print("开始请求服务器")
        model.sendRequest()
    }
    
    func execute(model: Model) {
        print("UI接收数据：\(model.data)")
    }

}

