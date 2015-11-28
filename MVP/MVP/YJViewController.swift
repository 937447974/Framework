//
//  YJViewController.swift
//  MVP
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/28.
//  Copyright © 2015年 阳君. All rights reserved.
//

import UIKit

/// View层
class YJViewController: UIViewController, YJPresenterProtocol {

    /// 姓名
    @IBOutlet weak var name: UILabel!
    /// Presenter层
    var persenter = YJPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Begin------------")
        self.persenter.delegate = self
        print("View层发出指令通知Presenter层")
        self.persenter.initData()// 初始化数据
    }
    
    // MARK: - YJPresenterProtocol
    func execute(presenter: YJPresenter) {
        print("\nView层收到Presenter层通知")
        self.name.text = presenter.name
        print("View End------------")
    }

}
