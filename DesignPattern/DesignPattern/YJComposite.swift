//
//  YJComposite.swift
//  DesignPattern
//
//  CSDN:http://blog.csdn.net/y550918116j
//  GitHub:https://github.com/937447974/Blog
//
//  Created by yangjun on 15/11/26.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// Employer为组合中的对象声明协议
private class Employer {
    
    /// 员工姓名
    var name:String = ""
    /// 下属员工列表
    var employers:Array<Employer> = Array()
    
    // MARK: 打印
    func printInfo() {
        print(name);
    }
    
    // MARK: 增加
    func add(employer:Employer){
        
    }
    
    // MARK: 删除
    func delete(employer:Employer){
        
    }
    
    // MARK: 比较是否相等
    func equal(employer:Employer) ->Bool {
        if employer.name == self.name {
            return true
        }
        return false
    }
    
}

/// Programmer在组合中表示叶节点对象，叶节点没有子节点
private class Programmer: Employer {
    
    init(name:String){
        super.init()
        super.name = name
    }
    
}

/// ProjectAssistant在组合中表示叶节点对象，叶节点没有子节点
private class ProjectAssistant: Employer {
    
    init(name:String){
        super.init()
        super.name = name
    }
    
}

/// ProjectManager定义有子部件的那些部件的行为
private class ProjectManager: Employer {
    
    init(name:String){
        super.init()
        super.name = name
        super.employers = []
    }
    
    override func add(employer: Employer) {
        super.employers.append(employer)
    }
    
    override func delete(employer: Employer) {
        for(var i = 0; i < super.employers.count; i++) {
            if employer.equal(super.employers[i]) {
                super.employers.removeAtIndex(i)
                return
            }
        }
    }
    
}

// MARK: -

/// 组合模式
class YJComposite: YJTestProtocol {

    func test() {
        let pm = ProjectManager(name: "项目经理")
        let pa = ProjectAssistant(name: "项目经理")
        let pm1 = Programmer(name: "程序员一")
        let pm2 = Programmer(name: "程序员二")
        // Client:通过Component协议操纵组合部件的对象。
        pm.add(pa)
        pm.add(pm1)
        pm.add(pm2)
        // 删除
        pm.delete(pm2)
        for item in pm.employers {
            item.printInfo()
        }
    }
    
}
