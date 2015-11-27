//
//  YJCOR.swift
//  DesignPattern
//
//  Created by yangjun on 15/11/27.
//  Copyright © 2015年 阳君. All rights reserved.
//

import Cocoa

/// 定义一个处理请求的协议
private protocol RequestHandleProtocol {
    
    func handleRequest(request: RequestProtocol)
    
}

///  处理它所负责的请求。可访问它的后继者。
private class HRRequestHandle: RequestHandleProtocol {
    
    func handleRequest(request: RequestProtocol) {
        if request is DimissionRequest {
            print("要离职, 人事审批!")
        }
        print("请求完毕")
    }
    
}

///  处理它所负责的请求。可访问它的后继者。
private class PMRequestHandle: RequestHandleProtocol {
    
    var rh: RequestHandleProtocol
    
    init(requestHandle: RequestHandleProtocol){
        self.rh = requestHandle
    }
    
    func handleRequest(request: RequestProtocol) {
        if request is AddMoneyRequest {
            print("要加薪, 项目经理审批!")
        } else {
            rh.handleRequest(request)
        }
    }
}

///  处理它所负责的请求。可访问它的后继者。
private class TLRequestHandle: RequestHandleProtocol {
    
    var rh: RequestHandleProtocol
    
    init(requestHandle: RequestHandleProtocol){
        self.rh = requestHandle
    }
    
    func handleRequest(request: RequestProtocol) {
        if request is LeaveRequest {
            print("要请假, 项目组长审批!")
        } else {
            rh.handleRequest(request)
        }
    }
    
}

// MARK: -

/// 请求协议
private protocol RequestProtocol {
    
}

/// DimissionRequest离职请求
private class DimissionRequest: RequestProtocol {
    
}

/// 加薪请求
private class AddMoneyRequest: RequestProtocol {
    
}

/// 请假请求
private class LeaveRequest: RequestProtocol {
    
}

// MARK: -

/// 责任链模式
class YJCOR: YJTestProtocol {

    func test() {
        let hr = HRRequestHandle()
        let pmRH = PMRequestHandle(requestHandle: hr)
        let tl  = TLRequestHandle(requestHandle: pmRH)
        // 向链上的具体处理者(ConcreteHandler)对象提交请求
        // team leader处理离职请求
        var request: RequestProtocol = DimissionRequest()
        tl.handleRequest(request)
        print("====")
        // team leader处理加薪请求
        request = AddMoneyRequest()
        tl.handleRequest(request)
        print("====")
        // team leader处理请假请求
        request = LeaveRequest()
        tl.handleRequest(request)
    }
    
}
