//
//  639. Decode Ways II.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/12/29.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class DWSolution : Testable {
    func numDecodings(_ s: String) -> Int {
        let chars = Array(s.characters)
        var dp = Array(repeating: 0 , count: chars.count + 1)
        dp[0] = 1
        dp[1] = chars[0] == "*" ? 9 : chars[0] == "0" ? 0 : 1
        for i in 1..<chars.count {
            let c = chars[i]
            let p = chars[i - 1]
            if c == "*" {
                dp[i + 1] = 9 * dp[i]
                if p == "1" {
                    dp[i + 1] += dp[i - 1] * 9
                } else if p == "2" {
                    dp[i + 1] += dp[i - 1] * 6
                } else if p == "*" {
                    dp[i + 1] += dp[i - 1] * 15
                }
            } else {
                dp[i + 1] = c == "0" ? 0 : dp[i]
                if p == "1" {
                    dp[i + 1] += dp[i - 1]
                } else if p == "2" {
                    if c >= "0" && c <= "6" {
                        dp[i + 1] += dp[i - 1]
                    }
                } else if p == "*" {
                    dp[i + 1] += dp[i - 1]
                    if c >= "0" && c <= "6" {
                        dp[i + 1] += dp[i - 1]
                    }
                }
            }
        }
        return dp[chars.count]
    }
    
    func printResult(params: Any...) {
        let input = params[0] as! String
        print("Decode ways 2 result is \(numDecodings(input))")
    }
}
