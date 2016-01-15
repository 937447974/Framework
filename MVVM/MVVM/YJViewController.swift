//
//  ViewController.swift
//  MVVM
//
//  Created by yangjun on 16/1/15.
//  Copyright © 2016年 阳君. All rights reserved.
//

import UIKit

/// View层
class YJViewController: UIViewController, YJViewModelProtocol {
    
    /// 姓名
    @IBOutlet weak var name: UILabel!
    /// Presenter层
    var viewModel = YJViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Begin------------")
        self.viewModel.delegate = self
        print("View层发出指令通知Presenter层")
        self.viewModel.initData()// 初始化数据
    }
    
    // MARK: - YJViewModelProtocol
    func execute(viewModel: YJViewModel) {
        print("\nView层收到Presenter层通知")
        self.name.text = viewModel.name
        print("View End------------")
    }
    
}


