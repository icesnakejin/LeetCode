//
//  481. Magical String.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/7.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation


class Magic_String_Solution : Testable {
    func magicalString(_ n: Int) -> Int {
        guard n > 0 else {return 0}
        var pool = [Int]()
        pool.append(1)
        pool.append(2)
        pool.append(2)
        var groupSizeIndex = 2
        var isOne = false
        var result = 1
        while (pool.count < n) {
            isOne = !isOne
            let size = pool[groupSizeIndex]
            if isOne {
                result += size
            }
            groupSizeIndex += 1
            for _ in 1...size {
                pool.append(isOne ? 1 : 2)
            }
        }
        
        if isOne {
            result -= (pool.count - n)
        }
        
        return result
    }
    
    func printResult(params: Any...) {
        let result = magicalString(params[0] as! Int)
        print("Maginc String of \(params[0]) is \(result)")
    }
}
