//
//  556. Next Greater Element III.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/10.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Next_Greated_Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        let str = String(n)
        var chars = Array(str.characters)
        var ind = -1
        
        for (index, c) in chars.enumerated().reversed() {
            if index > 0 && c > chars[index - 1] {
                ind = index - 1
            }
        }
        if ind == -1 {return -1}
        
        var nextGreat = ind + 1
        for i in ind + 1..<chars.count {
            if chars[i] > chars[ind] && chars[i] < chars[nextGreat]{
                nextGreat = i
            }
        }
        swap(&chars[ind], &chars[nextGreat])
        let firstPart = chars[0...ind]
        let secondPart = chars[ind + 1..<chars.count]
        let result = firstPart + secondPart.sorted()
        if let iResult = Int32(String(result)), iResult <= INT32_MAX {
            return Int(iResult)
        } else {
            return -1
        }
        
   
    }
}
