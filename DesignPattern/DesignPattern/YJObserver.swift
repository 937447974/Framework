//
//  YJObserver.swift
//  DesignPattern
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// PolicemanProtocol（观察者）为那些在目标发生改变时需获得通知的对象定义一个更新接口。
private protocol PolicemanProtocol {
    
    func action(citizen:Citizen)
    
}

/// HuangPuPoliceman具体观察者
private class HuangPuPoliceman: PolicemanProtocol {
    
    func action(citizen: Citizen) {
        switch (citizen.help) {
        case "normal":
            print("一切正常, 不用出动!")
        case "unnormal":
            print("有犯罪行为, 黄埔警察出动!")
        default:
            print("default...")
        }
    }
}

/// HuangPuPoliceman具体观察者
private class TianHePoliceman: PolicemanProtocol {
    
    func action(citizen: Citizen) {
        switch (citizen.help) {
        case "normal":
            print("一切正常, 不用出动!")
        case "unnormal":
            print("有犯罪行为, 天河警察出动!")
        default:
            print("default...")
        }
    }
    
}

// MARK: - 

/// Citizen（目标）目标知道它的观察者。可以有任意多个观察者观察同一个目标。提供注册和删除观察者对象的接口
private class Citizen {
    
    /// 警察局列表
    var pols: [PolicemanProtocol] = []
    /// 通知信息
    var help: String = "normal"
    
    // MARK: 子类实现
    func sendMessage(help: String) {
        
    }
    
    // MARK: 注册
    func register(pol: PolicemanProtocol) {
        self.pols.append(pol);
    }
    
}

/// 将有关状态存入HuangPuCitizen对象。当它的状态发生改变时,向它的各个观察者发出通知
private class HuangPuCitizen: Citizen {
    
    init(pol: PolicemanProtocol) {
        super.init()
        self.register(pol)
    }
    
    override func sendMessage(help: String) {
        self.help = help
        for pol in self.pols {
            //通知警察行动
            pol.action(self)
        }
    }
    
}

/// 将有关状态存入TianHeCitizen对象。当它的状态发生改变时,向它的各个观察者发出通知
private class TianHeCitizen: Citizen {
    
    init(pol: PolicemanProtocol) {
        super.init()
        self.register(pol)
    }
    
    override func sendMessage(help: String) {
        self.help = help
        for pol in self.pols {
            //通知警察行动
            pol.action(self)
        }
    }
    
}

// MARK: -

/// 观察者模式
class YJObserver: YJTestProtocol {

    func test() {
        let hpPol = HuangPuPoliceman()
        var citizen:Citizen = HuangPuCitizen(pol: hpPol)
        citizen.sendMessage("unnormal")
        let thPol = TianHePoliceman()
        citizen = TianHeCitizen(pol: thPol)
        citizen.sendMessage("normal")
    }
    
}
