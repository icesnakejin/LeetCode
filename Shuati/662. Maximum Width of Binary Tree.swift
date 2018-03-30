//
//  662. Maximum Width of Binary Tree.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/23.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Width_BST_Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        var queue = [TreeNode?]()
        var count = [Int]()
        queue.append(root)
        count.append(0)
        while !queue.isEmpty {
            let n = queue.count
            var left = 0
            var right = 0
            for i in 0..<n {
                
                if let first = queue.first ,let fCount = count.first{
                    if i == 0 {left = fCount}
                    if i == n - 1 {right = fCount}
                    if let first = first {
                        if let left = first.left {
                            queue.append(left)
                            count.append(2 * fCount)
                        }
                        
                        if let right = first.right {
                            queue.append(right)
                            count.append(2 * fCount + 1)
                        }
                    }
                }
                count.removeFirst()
                queue.removeFirst()
            }
            
            
            result = max(result, right - left + 1)
        }
        return result
    }}
