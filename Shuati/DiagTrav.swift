//
//  DiagTrav.swift
//  Shuati
//
//  Created by Yankun Jin on 5/9/17.
//  Copyright © 2017 Yankun Jin. All rights reserved.
//

import Foundation
public class TreeNode {
         public var val: Int
         public var left: TreeNode?
         public var right: TreeNode?
         public init(_ val: Int) {
                 self.val = val
                     self.left = nil
                     self.right = nil
             }
    }
class DTSolution {
    var result = 0;
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        helper (root)
        return result
    }
    
    private func helper(_ root: TreeNode?) -> Int {
    guard let nRoot = root else {
        return 0
    }
        let l = helper(nRoot.left)
        let r = helper(nRoot.right)
        result = max(result, l + r + 1)
        return max (l, r) + 1
    }
}

class DiagTrav {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        let dir = [[-1, 1], [1, -1]]
        var d = 0
        var result = [Int]()
        let n = matrix.count
        if n <= 0 {
            return result
        }
        let m = matrix[0].count
        var row = 0
        var col = 0
        for _ in 1...m*n {
            result.append(matrix[row][col])
            row += dir[d][0]
            col += dir[d][1]
            if (row < 0) {
                row = 0
                d = 1 - d
            }
            
            if (row >= n) {
                row = n - 1
                col += 2
                d = 1 - d
            }
            
            if (col < 0) {
                col = 0
                d = 1 - d
            }
            
            if (col >= m) {
                col = m - 1
                row += 2
                d = 1 - d
            }
        }
        return result
    }
}
