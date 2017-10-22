//
//  474. Ones and Zeroes.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/9/26.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

//Input: ["00","000"], 1, 10
class OnesAndZeroesSolution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeatElement(Array(repeatElement(0, count: n + 1)), count: m + 1))
        for element in strs {
            let tup = _countZeroAndOne(element)
            let m2 = tup.0
            let n2 = tup.1
            for i in (m2...m).reversed() {
                for j in (n2...n).reversed() {
                    dp[i][j] = max(dp[i][j], dp[i - m2][j - n2] + 1)
                    
                }
            }
        }
        return dp[m][n]
    }
    
    fileprivate func _countZeroAndOne(_ input: String) -> (Int, Int) {
        var tup = (0, 0)
        Array(input.characters).forEach {
            if $0 == "0" {tup.0 += 1}
            else if $0 == "1" {tup.1 += 1}
        }
        return tup
    }
}
