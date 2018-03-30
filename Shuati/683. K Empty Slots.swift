//
//  683. K Empty Slots.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/1.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation

class kEmpty_Slots_Solution : Testable {
    func kEmptySlots(_ flowers: [Int], _ k: Int) -> Int {
        var days = Array(repeating: 0, count : flowers.count)
        for i in 0..<flowers.count {
            days[flowers[i] - 1] = i + 1
        }
        
        var left = 0
        var right = k + 1
        var result = Int.max
        while right < days.count {
            var exceed = false
            for i in left+1..<right {
                if days[i] < days[left] || days[i] < days[right] {
                    left = i
                    right = i + k + 1
                    exceed = true
                    break;
                }
            }
            if exceed == false {
                result = min(result, max(days[left], days[right]))
                left = right;
                right = left + k + 1
            }
        }
        return result
    }
    
    func printResult(params: Any...) {
        let input1 = params[0] as! [Int]
        let input2 = params[1] as! Int
        print("k_empty_slots_solution's answer is \(kEmptySlots(input1, input2))")
    }
}
