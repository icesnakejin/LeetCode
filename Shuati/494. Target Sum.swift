//
//  494. Target Sum.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/8.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Target_Sum_Solution : Testable {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        
        let sum = nums.reduce(0) { (result : Int, next : Int)  -> Int in
            return result + next
        }
        return (sum + S) % 2 == 0 ? subsetSum(nums, (sum + S) / 2) : 0
    }
    
    func subsetSum(_ nums: [Int], _ sum: Int) -> Int{
        var dp = Array(repeating: 0, count : sum + 1)
        dp[0] = 1
        for n in nums {
            for i in (n..<dp.count).reversed() {
                dp[i] += dp[i - n]
            }
        }
        return dp[sum]
    }
    
    func printResult(params: Any...) {
        let result = findTargetSumWays(params[0] as! [Int], params[1] as! Int)
        print("Target_Sum_Solution is : \(result)")
    }
}
