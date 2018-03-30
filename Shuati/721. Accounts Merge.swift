//
//  721. Accounts Merge.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/11/15.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Acoount_Merge_Solution : Testable {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var mAccounts = [(String, Set<String>)]()
        for sa in accounts {
            mAccounts.append((sa[0], Set(Array(sa[1...sa.count - 1]))))
        }
        for i in 0..<mAccounts.count {
            var sa1 = mAccounts[i]
            if sa1.1.isEmpty {
                continue
            }
            
            for j in 0..<mAccounts.count {
                var sa2 = mAccounts[j]
                if (j == i || sa2.1.isEmpty) {
                    continue
                }
                if sa1.1.intersection(sa2.1).isEmpty {
                    continue
                }
                sa1.1.formUnion(sa2.1)
                sa2.1.removeAll()
                mAccounts[i] = sa1
                mAccounts[j] = sa2
            }
        }
        var result = [[String]]()
        for sa in mAccounts {
            var line = [String]()
            if sa.1.isEmpty { continue }
            line.append(sa.0)
            line.append(contentsOf: Array(sa.1.sorted()))
            result.append(line)
        }
        return result
    }
    
    func printResult(params: Any...) {
        let input = params[0] as! [[String]]
        print("Acoount_Merge_Solution result is \(accountsMerge(input))")
        
    }
}
