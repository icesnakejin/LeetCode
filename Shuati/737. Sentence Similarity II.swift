//
//  737. Sentence Similarity II.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/9.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation
class SS2Solution : Testable {
    class DSU {
        var parents : [Int]
        public init(size : Int) {
            parents = Array(repeating: -1 , count: size)
            for i in 0..<size {
                parents[i] = i
            }
        }
        public func find(_ n: Int) -> Int {
            var i = n
            while (parents[i] != i) {
                i = parents[i]
            }
            return i
        }
        
        public func union(_ n1: Int, _ n2 : Int) {
            let p1 = find(n1)
            let p2 = find(n2)
            if parents[p1] != p2 {
                parents[p1] = p2
            }
        }
    }
    
    func areSentencesSimilarTwo(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        if words1.count != words2.count { return false }
        let dsu = DSU(size: 2 * pairs.count)
        var count = 0
        var appears = [String : Int]()
        for pair in pairs {
            let p0 = pair[0]
            let p1 = pair[1]
            if appears[p0] == nil {
                appears[p0] = count
            }
            
            count += 1
            if appears[p1] == nil {
                appears[p1] = count
            }
            
            count += 1
            dsu.union(appears[p0]!, appears[p1]!)
        }
        
        for i in 0..<words1.count {
            let w1 = words1[i]
            let w2 = words2[i]
            if w1 == w2 {continue}
            guard let p1 = appears[w1] else { return false}
            guard let p2 = appears[w2] else { return false}
            if dsu.find(p1) != dsu.find(p2) { return false}
        }
        return true
    }
    
    func printResult(params: Any...) {
        let i1 = params[0] as! [String]
        let i2 = params[1] as! [String]
        let i3 = params[2] as! [[String]]
        print("Sentence Similarity 2 result is \(areSentencesSimilarTwo(i1, i2, i3))")
    }
    
}
