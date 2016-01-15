//
//  YJViewController.swift
//  MVP
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 16/1/15.
//  Copyright © 2016年 阳君. All rights reserved.
//

import UIKit

/// View层
class YJViewController: UIViewController {
    
    /// Presenter层
    @IBOutlet var presenter: YJPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View层初始化UI")
        print("View通知Presenter加载数据")
        // 视图加载
        self.presenter.viewDidLoad()
    }
    
}

