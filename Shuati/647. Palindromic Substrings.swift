//
//  647. Palindromic Substrings.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/8/15.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation
class Palindromic_Substrings {
    func countSubstrings(_ s: String) -> Int {
        
        let charArray = Array(s.characters)
        var result = 0
        for i in 0..<charArray.count {
            result += helper(charArray, i, i)
            result += helper(charArray, i, i + 1)
        }
        return result
    }
    
    private func helper(_ charArray:[Character], _ left:Int, _ right:Int) -> Int {
        var i = left
        var j = right
        var result = 0
        while i >= 0 && j < charArray.count && charArray[i] == charArray[j] {
            result += 1
            i -= 1
            j += 1
        }
        return result
    }
}
