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
    var maxHeap = Heap<Int>(elements: [] , isPriorityTo: < )
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
        //testObject = Replace_Words_Solution()
        //testObject = Dota2_Senate_Solution()
        //testObject = Acoount_Merge_Solution()
        //testObject = ADSolution()
        //testObject = DWSolution()
        //testObject = kEmpty_Slots_Solution()
        // testObject = ABTSolution()
//        testObject = SS2Solution()
        //testObject = Maze2Solution()
        //testObject = LongestParlinSolution()
        //testObject = CC2Solution()
        
        maxHeap.offer(8)
        maxHeap.offer(5)
        maxHeap.offer(7)
        maxHeap.offer(9)
        maxHeap.offer(10)
        maxHeap.offer(11)
        maxHeap.offer(-1)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
//        if let testObject = testObject {
//            testObject.printResult(params:500, [3,5,7,8,9,10,11])
//        }
        maxHeap.printResult(params: [])
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
