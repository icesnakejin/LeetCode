//
//  654. Maximum Binary Tree.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/8/10.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class MaxBT {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count - 1)
    }
    
    private func helper(_ nums:[Int], _ start:Int, _ end:Int) -> TreeNode? {
        if start > end {return nil}
        
        let maxInd = findPosOfMax(nums, start, end)
        print("max value : \(nums[maxInd])")
        let node = TreeNode(maxInd)
        if start == end {return node}
        node.left = helper(nums, start, maxInd - 1)
        node.right = helper(nums, maxInd + 1, end)
        return node
    }
    
    private func findPosOfMax(_ nums:[Int], _ start:Int, _ end:Int) -> Int {
        var result = -1
        if (start > end) {return result}
        var max = nums[start]
        for i in start...end  {
            if (nums[i] >= max) {
                result = i
                max = nums[i]
            }
        }
        return result
    }
}
