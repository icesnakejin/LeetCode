//
//  516. Longest Palindromic Subsequence.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/8.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Longest_Palindromic_Solution : Testable {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.characters.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        let chars = Array(s.characters)
        for i in 0..<n {
            let last = chars[i]
            for j in (0...i).reversed() {
                let first = chars[j]
                if first != last {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j + 1])
                } else {
                    dp[i][j] = i == j ? 1 : max(dp[i][j], dp[i - 1][j + 1] + 2)
                }
                
            }
        }
        return dp[n - 1][0]
    }
    
    func isPalin (s : String) -> Bool {
        let chars = Array(s.characters)
        var start = 0
        var end = chars.count - 1
        while start < end {
            if chars[start] != chars[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
    
    func printResult(params: Any...) {
        let result = longestPalindromeSubseq(params[0] as! String)
        print("Longest_Palindromic_Solution Test Restul is : \(result)")
    }
}
