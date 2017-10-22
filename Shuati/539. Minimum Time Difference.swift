//
//  539. Minimum Time Difference.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/9.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Minimum_Time_Solution : Testable {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var sorted = timePoints.sorted()
        var result = 23 * 60 + 59
        if sorted.count <= 1 {return 0}
        sorted.append(sorted[0])
        for i in 1..<sorted.count {
            let before = sorted[i - 1]
            let after = sorted[i]
            let com1 = before.components(separatedBy: ":")
            let com2 = after.components(separatedBy: ":")
            
            let min1 = Int(com1[0])! * 60 + Int(com1[1])!
            let min2 = Int(com2[0])! * 60 + Int(com2[1])!
            var dif = min2 - min1
            if dif < 0 {
                dif = 24 * 60 + dif
            }
            result = min(dif, result)
        }
        return result
    }
    
    func printResult(params: Any...) {
        let result = findMinDifference(params[0] as! [String])
        print("minimum time diference is : \(result)")
    }
}
