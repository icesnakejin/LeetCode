//
//  473. Matchsticks to Square.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/9/25.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class MatchStickSolution {
    func makesquare(_ nums: [Int]) -> Bool {
        if nums.count == 0 {return false}
        let sum = nums.reduce(0){result, next in result + next}
        if sum % 4 != 0 { return false}
        let sideLen = sum / 4
        var pool = Array(repeatElement(0, count: 4))
        return dfs(&pool, sideLen, nums, 0)
    }
    
    fileprivate func dfs(_ pool: inout [Int],
                         _ target : Int,
                         _ nums: [Int],
                         _ index: Int) -> Bool{
            
        var empty = true
        for i in 0..<3 {
            empty = (pool[i] == target)
        }
        if empty == true {return index == nums.count}
        if index == nums.count {return false}
        let num = nums[index]
        if num > target {
            return false
        }
        
        var result = false
        for i in 0..<4 {
            if pool[i] + num > target {
                continue
            } else {
                pool[i] += num
                result = dfs(&pool, target,nums, index + 1)
                pool[i] -= num
                if result == true {return true}
            }
        }
        return result
    }
}
