//
//   477. Total Hamming Distance.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/9/29.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class HDSolution:Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        var result = 0
        for i in 0..<32 {
            let mask = 1 << i
            var zeros = 0
            var ones = 0
            for num in nums {
                if num & mask != 0 {
                    ones += 1
                } else {
                    zeros += 1
                }
            }
            result += zeros*ones
        }
        return result
    }
    
    func printResult(params: Any...) {
        if let params = params as? [Int] {
            print("477. Total Hamming Distance, test with params: \(params), result is : \(totalHammingDistance(params))")
        }
    }
}
