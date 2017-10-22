//
//  576. Out of Boundary Paths.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/14.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Out_Of_Boundary_Solution : Testable {
   
    let dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    func findPaths(_ m: Int, _ n: Int, _ N: Int, _ i: Int, _ j: Int) -> Int {
        var dp = Array(repeating:Array(repeating:Array(repeating:0, count:N), count:n + 1), count:m + 1)
        for j1 in 0...n {
            for k in 0..<N {
                dp[0][j1][k] = 1
            }
        }
        for i1 in 0...n {
            for k in 0..<N {
                dp[i1][0][k] = 1
            }
        }

        for i1 in 1...m {
            for j1 in 1...n {
                for k in 1..<N {
                    for dir in dirs {
                        dp[i1][j1][k] += dp[i1 + dir[0]][j1 + dir[1]][k - 1]
                    }
                }
            }
        }
        return dp[i][j][N - 1]
    }
//    func printResult(params: Any...) {
//        let m = params[0] as! Int
//        let n = params[1] as! Int
//        
//    }
    
}
