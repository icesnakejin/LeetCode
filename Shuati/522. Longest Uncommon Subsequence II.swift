//
//  522. Longest Uncommon Subsequence II.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/7/5.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class LUS2 {
    func findLUSlength(_ strs: [String]) -> Int {
        
        
        var result = -1
        
        for (index, value) in strs.enumerated() {
            var findSeq = false
            for (subIndex, subValue) in strs.enumerated() {
                if (index == subIndex) {
                    continue
                }
                if isSubSequence(value, subValue) {
                    findSeq = true
                    continue
                }
            }
            if (!findSeq) {
                result = max(result, value.characters.count)
            }
        }
        return result
    }
    
    private func isSubSequence(_ str : String , _ inStr : String) -> Bool {
        var h1 = 0
        var h2 = 0
        while h1 < str.characters.count && h2 < inStr.characters.count {
            if str.characters[str.index(str.startIndex, offsetBy: h1)] == inStr.characters[inStr.index(inStr.startIndex, offsetBy: h2)] {
                h1 += 1
                h2 += 1
            } else {
                h1 += 1
            }
        }
        if h2 == inStr.characters.count && h1 <= str.characters.count {
            return true
        }
        return false
    }
}
