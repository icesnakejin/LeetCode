//
//  593. Valid Square.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/15.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Valid_Square_Solution {
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        var pSet = Set<Int>()
        
        pSet.insert(dis(p1, p2))
        pSet.insert(dis(p1, p3))
        pSet.insert(dis(p1, p4))
        
        return pSet.contains(dis(p2, p3)) && pSet.contains(dis(p2, p4)) && pSet.contains(dis(p3, p4))
    }
    
    fileprivate func dis (_ p1 : [Int], _ p2 : [Int])->Int {
        return (p1[0] - p2[0]) * (p1[0] - p2[0]) + (p1[1] - p2[1])*(p1[1] - p2[1])
    }
}
