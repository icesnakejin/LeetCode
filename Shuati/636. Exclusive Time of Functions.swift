//
//  636. Exclusive Time of Functions.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/15.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation
class Exclusive_Time_Solution : Testable {
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var stack = [Int]()
        var result = Array(repeating: 0, count : n)
        var lastInt = 0
        for log in logs {
            let components = log.components(separatedBy: ":")
            if let id = Int(components[0]), let time = Int(components[2]) {
                if components[1] == "start" {
                    stack.append(time)
                    
                } else {
                    if let top = stack.last {
                        result[id] += (time - top + 1 - lastInt)
                        lastInt += time - top + 1
                    }
                    stack.removeLast()
                    if stack.isEmpty {
                        lastInt = 0
                    }
                }
            }
        }
        return result
    }
    
    func printResult(params: Any...) {
        let input = params[1] as! [String]
        let n = params[0] as! Int
        let result = exclusiveTime(n, input)
        
        print("result of 636. Exclusive Time of Functions is : \(result)")
    }
}
