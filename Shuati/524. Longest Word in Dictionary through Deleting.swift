//
//  524. Longest Word in Dictionary through Deleting.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/8.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Longest_Word_Solution : Testable {
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        //var longestKey  = ""
        let d1 = d.sorted { (s1, s2) -> Bool in
            if s1.characters.count > s2.characters.count {
                return true
            } else {
                return false
            }
        }
        for str in d1 {
            if isSubSequence(s1: str, s2: s) {
                return str
            }
        }
        return ""
    }
    
    func isSubSequence(s1 : String, s2 : String) -> Bool {
        let chars1 = Array(s1.characters)
        let chars2 = Array(s2.characters)
        var p1 = 0
        var p2 = 0
        if chars1.count > chars2.count {return false}
        while p1 < chars1.count && p2 < chars2.count {
            if chars1[p1] == chars2[p2] {
                p1 += 1
                p2 += 1
            } else {
                p2 += 1
            }
        }
        return p1 == chars1.count
    }
    func printResult(params: Any...) {
        let result = findLongestWord(params[0] as! String, params[1] as! [String])
        print("Longest_Word_Solution result is : \(result)")
    }
}
