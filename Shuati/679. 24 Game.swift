//
//  679. 24 Game.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/23.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation

class TFGSolution : Testable {
    func judgePoint24(_ nums: [Int]) -> Bool {
        let dNums = nums.map{Double($0)}
        var visited =  Array(repeating: false, count: nums.count)
        
        return helper(dNums, &visited, 24, 0)
    }
    func helper(_ nums: [Double], _ visited: inout [Bool] , _ target : Double, _ noOfV : Int) -> Bool {
        
        for i in 0..<4 {
            if visited[i] == false {
                let n = nums[i]
                if noOfV == 3 {
                    if n == target {
                        print("target is \(target)")
                        return true
                    }
                    else {
                        //print("target is \(target)")
                        return false
                    }
                }
                visited[i] = true
                if helper (nums, &visited, target - n, noOfV + 1)
                    || helper (nums, &visited, n - target, noOfV + 1)
                    || helper (nums, &visited, target / n, noOfV + 1)
                    || helper (nums, &visited, n / target, noOfV + 1) { return true}
                visited[i] = false
            }
            
        }
        return false
    }
    
    func printResult(params: Any...) {
        let input = params[0] as! [Int]
        print("679. 24 Game result is : \(judgePoint24(input))")
    }
}
