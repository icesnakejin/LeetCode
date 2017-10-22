//
//  523. Continuous Subarray Sum.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/8.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Continuous_SubArray_Solution {
    
    
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var previousRemainers = [Int : Int]()
        previousRemainers[0] = -1
        var sum = 0
        for (index, element) in nums.enumerated() {
            sum += element
            var value = 0
            if k != 0 {value = sum % k}
            if let previousIndex = previousRemainers[value], index - previousIndex > 1 {
                return true
            }
            previousRemainers[value] = index
        }
        return false
    }
}
