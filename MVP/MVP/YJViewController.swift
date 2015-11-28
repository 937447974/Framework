//
//  YJViewController.swift
//  MVP
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
        self.persenter.delegate = self
        self.persenter.initData()// 初始化数据
    }
    
    // MARK: - YJPresenterProtocol
    func execute(presenter: YJPresenter) {
        self.name.text = presenter.name
    }

}
