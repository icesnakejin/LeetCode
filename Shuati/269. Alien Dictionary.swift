//
//  269. Alien Dictionary.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/12/29.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class ADSolution : Testable {
    func alienOrder(_ words: [String]) -> String {
        var children = [Character : Set<Character>]()
        var degrees = [Character : Int]()
        for s in words {
            for c in s.characters {
                degrees[c]  = 0
            }
        }
        for i in 0..<words.count - 1 {
            let s1 = words[i]
            let s2 = words[i + 1]
            let ch1 = Array(s1.characters)
            let ch2 = Array(s2.characters)
            for j in 0..<min(ch1.count, ch2.count) {
                let c1 = ch1[j]
                let c2 = ch2[j]
                if c1 != c2 {
                    if children[c1] == nil {
                        children[c1]  = Set<Character>()
                    }
                    if children[c1]?.contains(c2) == false {
                        children[c1]?.insert(c2)
                        
                        degrees[c2]! += 1
                    }
                    break
                }
            }
        }
        var queue = [Character]()
        for c in degrees.keys {
            if degrees[c] == 0 {
                queue.append(c)
            }
        }
        var result = ""
        while !queue.isEmpty {
            if let f = queue.first {
                if let cSet = children[f] {
                    for c in cSet {
                        degrees[c]? -= 1
                        if degrees[c] == 0 {
                            queue.append(c)
                        }
                    }
                    
                }
                result += String(f)
            }
            queue.remove(at : 0)
            
        }
        //print("YK: result is \(result)")
        if result.characters.count != degrees.keys.count { return ""}
        return result;
    }
    
    func printResult(params: Any...) {
        let input = params[0] as! [String]
        print("Alien_Dictionary result is \(alienOrder(input))")
    }
}
