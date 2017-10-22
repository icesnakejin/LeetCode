//
//  646. Maximum Length of Pair Chain.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/15.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Max_Pair_Solution : Testable {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let sortedPairs = pairs.sorted(by: { (p1, p2)->Bool in
            if p1[1] != p2[1] {return p1[1] < p2[1]}
            else {return p1[0] < p2[0]}
        })
        
        if pairs.count == 0 {return 0}
        var result = 1
        var current = sortedPairs[0]
        for i in 1..<sortedPairs.count {
            let p = sortedPairs[i]
            if p[0] > current[1] {
                result += 1
                current = p
            }
        }
        return result
    }
    
    func printResult(params: Any...) {
        let result = findLongestChain(params[0] as! [[Int]])
        print("646. Maximum Length of Pair Chain: \(result)")
    }
}
