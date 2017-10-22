//
//  649. Dota2 Senate.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/21.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Dota2_Senate_Solution : Testable {
    func predictPartyVictory(_ senate: String) -> String {
        var sens = Array(senate.characters)
        let n = sens.count
        var rIndexes = [Int]()
        var dIndexes = [Int]()
        for i in 0..<n {
            let c = sens[i]
            if c == "R" {rIndexes.append(i)}
            if c == "D" {dIndexes.append(i)}
        }
        while rIndexes.count > 0 && dIndexes.count > 0 {
            if let rf = rIndexes.first,
                let df = dIndexes.first {
                rIndexes.removeFirst()
                dIndexes.removeFirst()
                // Each senate R must ban its next closest senate D who is from another party, or else D will ban its next senate from R's party. 所以每次比较 R 和 D 里最小的index, 小的那个肯定把大的那个ban了。但是小的那个，不会现在被ban，因为对手会ban他之后最近的opponent,小的那个会被对手这一轮剩下的最后一个ban掉，所以加n,实现rotate pattern
                if df < rf {
                    dIndexes.append(df + n)
                } else {
                    rIndexes.append(rf + n)
                }
            }
        }
        return rIndexes.count > dIndexes.count ? "Radiant" : "Dire"
    }
    
    func printResult(params: Any...) {
        let p1 = params[0] as! String
        let result = predictPartyVictory(p1)
        print("649. Dota2 Senate : \(result)")
    }
}
