//
//  515. Find Largest Value in Each Tree Row.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/6/29.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class LargestValueInEachTree {
    func largestValues(_ root: TreeNode?) -> [Int] {
        let char  = "A"
        //print(char.uni)
        var queue = [TreeNode?]()
        var result = [Int]()
        queue.append(root)
        while !queue.isEmpty {
            let len = queue.count
            var maxThisLevel : Int? = nil
            for _ in 0..<len {
                if let top = queue.first {
                    queue.remove(at: 0)
                    if let t = top {
                        if let maxT = maxThisLevel {
                            maxThisLevel = max(maxT, t.val)
                        } else {
                            maxThisLevel = t.val
                        }
                        if let l = t.left {
                            queue.append(l)
                        }
                        if let r = t.right {
                            queue.append(r)
                        }
                    }
                    
                }
            }
            if let mThisLevel = maxThisLevel {
                result.append(mThisLevel)
            }
        }
        return result
    }
}
