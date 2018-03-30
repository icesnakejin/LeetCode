//
//  658. Find K Closest Elements.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/22.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class K_Closest_Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var start = 0
        var end = arr.count - k - 1
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if x - arr[mid] > arr[mid + k] - x {
                start = mid
            } else {
                end = mid
            }
        }
        if abs(x - arr[start]) < abs(x - arr[end]) {return Array(arr[start...start + k])}
        else {return Array(arr[end...end + k])}
    }
}
