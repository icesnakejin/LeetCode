//
//  508. Most Frequent Subtree Sum.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/7/12.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class MostFrequentSubTreeSum {
    var counter = [Int : Int]()
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        helper(root)
        var keyArr = Array(counter.keys)
        keyArr.sort() {
            if let v1 = counter[$0], let v2 = counter[$1] {
                return v2 > v1
            }
            return false
        }
        var result = [Int]()
        for (index, element) in keyArr.enumerated() {
            if index == 0 || element == keyArr[index - 1] {
                result.append(keyArr[index])
            }
        }
        return result
    }
    
    func helper(_ root: TreeNode?) -> Int {
        guard let r = root else {
            return 0
        }
        let lSum = helper(r.left)
        let rSum = helper(r.right)
        
        let sum = lSum + rSum + r.val
        if let value = counter[sum] {
            counter[sum] = value + 1
        } else {
            counter[sum] = 1
        }
        
        return sum
    }
}
