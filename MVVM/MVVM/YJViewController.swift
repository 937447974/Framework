//
//  YJViewController.swift
//  MVVM
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/28.
//  Copyright © 2015年 阳君. All rights reserved.
//

import UIKit

/// View层
class YJViewController: UIViewController {

    /// ViewModel层
    @IBOutlet var viewModel: YJViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View层初始化UI")
        print("View通知ViewModel加载数据")
        // 视图加载
        self.viewModel.viewDidLoad()
    }
    
}
