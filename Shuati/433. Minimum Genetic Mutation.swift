//
//  433. Minimum Genetic Mutation.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/7/6.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation
class MinimumGeneMutation {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        var queue = [String]()
        queue.append(start)
        let pool : [Character] = ["A", "G", "C", "T"]
        var visited = Set<String>()
        visited.insert(start)
        var depth = 0
        while !queue.isEmpty {
            let len = queue.count
            for i in 0..<len {
                let top = queue[0]
                
                if top == end {
                    
                    
                    return depth
                }
                
                var charSet : [Character] = Array(top.characters)
                for i in 0..<charSet.count {
                    let temp = charSet[i]
                    for c in pool {
                        if (c != charSet[i]) {
                            
                            charSet[i] = c
                            print ("insert element : \(String(charSet))")
                            if (bank.contains(String(charSet)) && !visited.contains(String(charSet))) {
                                visited.insert(String(charSet))
                                //                            print ("start element : \(start)")
                                //                            print ("end element : \(end)")
                                queue.append(String(charSet))
                            }
                            
                        }
                    }
                    charSet[i] = temp
                }
                visited.remove(top)
                queue.remove(at:0)
            }
            
            
            depth += 1
        }
        return -1
    }
}
