//
//  554. Brick Wall.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/10.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import UIKit

class Brick_Wall_Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var numOfWidths = [Int : Int]()
        for row in wall {
            var sum = 0
            for brick in row[0..<row.count - 1] {
                sum += brick
                if let currentWidth = numOfWidths[sum] {
                    numOfWidths[sum] = currentWidth + 1
                } else {
                    numOfWidths[sum] = 1
                }
            }
        }
        var result = wall.count
        for (_  , sum) in numOfWidths {
            result = min(result, wall.count - sum)
        }
        return result
    }
}
