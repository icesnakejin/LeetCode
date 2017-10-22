//
//  655. Print Binary Tree.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/8/17.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation



class Print_Binary_Tree {
    func printTree(_ root: TreeNode?) -> [[String]] {
        let height = getHeight(root)
        let width = getWidth(height)
        var result = Array(repeating: Array(repeating: "", count: width), count: height + 1)
        helper(root, height: height, pos: width / 2 , dist : (width / 2 + 1) / 2, result: &result)
        return result
    }
    
    fileprivate func helper(_ root: TreeNode?, height: Int, pos : Int, dist : Int, result: inout [[String]]) {
        
        if height >= result.count || pos < 0 || pos >= result[0].count {return}
        if let r = root {
            result[height][pos] = String(r.val)
            helper(r.left, height: height + 1, pos : pos - dist, dist: dist / 2 ,result: &result )
            helper(r.right, height: height + 1, pos : pos + dist, dist: dist / 2 ,result: &result )
        } else {
            result[height][pos] = ""
        }
        
    }
    
    fileprivate func getHeight(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        return max(getHeight(root.left), getHeight(root.right)) + 1
    }
    
    fileprivate func getWidth(_ height: Int) -> Int {
        let exp = Int(pow(Double(2), Double(height + 1)))
        return exp - 1
    }
}
