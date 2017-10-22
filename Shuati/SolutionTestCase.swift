//
//  SolutionTestCase.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/9/30.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import XCTest

class SolutionTestCase: XCTestCase {
    var testObject : Testable?
    override func setUp() {
        super.setUp()
        //testObject = HDSolution()
        //testObject = Magic_String_Solution()
        //testObject = Lisense_Key_Solution()
        //testObject = Target_Sum_Solution()
        //testObject = Longest_Palindromic_Solution()
        //testObject = Minimum_Time_Solution()
        //testObject = Exclusive_Time_Solution()
        //testObject = Solve_Equation_Solution()
        //testObject = Max_Pair_Solution()
        testObject = Replace_Words_Solution()
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        if let testObject = testObject {
            testObject.printResult(params:["cat", "bat", "rat"], "the cattle was rattled by the battery")
        }
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
