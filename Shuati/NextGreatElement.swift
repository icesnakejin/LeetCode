//
//  NextGreatElement.swift
//  Shuati
//
//  Created by Yankun Jin on 5/15/17.
//  Copyright © 2017 Yankun Jin. All rights reserved.
//

import Foundation

class SolutionNGE {
    func nextGreaterElement(_ findNums: [Int], _ nums: [Int]) -> [Int] {
        var stack = Stack<Int>()
        var hm = [Int:Int]()
        var result = [Int]()
        for num : Int in nums {
            while let l = stack.peek(), l < num {
                
                stack.pop()
                hm[l] = num
            }
            stack.push(num)
        }
        for key : Int in findNums {
            if let val : Int = hm[key]{
                result.append(val)
            } else {
                result.append(-1)
            }
        }
        return result
    }
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var dou : [Int] = Array.init(nums)
        dou.append(contentsOf: nums)
        var result : [Int] = Array.init(repeating: -1, count: dou.count)
        var stack = Stack<Int>()
        for (index, num) in dou.enumerated() {
            while let l = stack.peek(), dou[l] < num {
                if let n = stack.pop() {
                    result[n] = num
                }
            }
            stack.push(index)
        }
        return result.count > 0 ? Array(result[0...nums.count - 1]) : result;
        
    }
}
