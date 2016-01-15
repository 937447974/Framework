//
//  MVVMTests.swift
//  MVVMTests
//
//  Created by yangjun on 16/1/15.
//  Copyright © 2016年 阳君. All rights reserved.
//

import XCTest
@testable import MVVM

class MVVMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // 测试
        let viewModel = YJViewModel()
        viewModel.initData()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
