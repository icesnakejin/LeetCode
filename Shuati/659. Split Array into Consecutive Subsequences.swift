//
//  659. Split Array into Consecutive Subsequences.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/23.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Split_Array_Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        var nCount = [Int : Int]()
        var noOfSeqBeforeNumber = [Int : Int]()
        for num in nums {
            if let count = nCount[num] {
                nCount[num] = count + 1
            } else {
                nCount[num] = 1
            }
        }
        
        for num in nums {
            guard let numCount = nCount[num], numCount > 0 else {continue}
            if let count = noOfSeqBeforeNumber[num], count > 0 {

                    noOfSeqBeforeNumber[num] = count - 1
                    if let count3 = noOfSeqBeforeNumber[num + 1] {
                        noOfSeqBeforeNumber[num + 1] = count3 + 1
                    } else {
                        noOfSeqBeforeNumber[num + 1] = 1
                    }
            } else if let count1 = noOfSeqBeforeNumber[num + 1],
                    let count2 = noOfSeqBeforeNumber[num + 2],
                    count1 > 0,
                    count2 > 0 {
                    nCount[num + 1] = count1 - 1
                    nCount[num + 2] = count2 - 1
                    if let count3 = noOfSeqBeforeNumber[num + 3] {
                        noOfSeqBeforeNumber[num + 3] = count3 + 1
                    } else {
                        noOfSeqBeforeNumber[num + 3] = 1
                    }
                } else {
                    return false
                }
            nCount[num] = numCount - 1
        }
        return true
    }
}
