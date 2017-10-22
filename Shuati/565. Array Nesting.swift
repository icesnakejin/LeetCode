//
//  565. Array Nesting.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/7/26.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Arr_Nesting {
    func arrayNesting(_ nums: [Int]) -> Int {
        var result = 0
        var loopLen = [Int : Int]()
        for i in nums {
            var pool = Set<Int>()
            var current = i
            var len = 0
            while !pool.contains(current) && !loopLen.keys.contains(current) {
                pool.insert(current)
                current = nums[current]
                len+=1
            }
            if let l = loopLen[current] {
                len+=l
            } else {
                loopLen[current] = len
            }
            result = max(len, result)
        }
        return result
    }
}
