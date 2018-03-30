//
//  518. Coin Change 2.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/29.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation
class CC2Solution:Testable {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        return helper (0, amount, 0 , coins)
    }
    func helper(_ current : Int, _ target: Int, _ index : Int,  _ coins: [Int]) -> Int {
        if current > target { return 0 }
        if current == target { return 1 }
        var result = 0
        for i in index..<coins.count {
            result += helper (current + coins[i], target, i , coins)
        }
        return result
    }
    func printResult(params: Any...) {
        let i1 = params[0] as! Int
        let i2 = params[1] as! [Int]
        print("518. Coin Change 2 result is : \(change(i1, i2))")
    }
}
