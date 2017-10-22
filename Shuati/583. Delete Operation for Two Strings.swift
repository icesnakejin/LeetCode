//
//  583. Delete Operation for Two Strings.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/14.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Delete_Operation_Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let chars1 = Array(word1.characters)
        let chars2 = Array(word2.characters)
        var dp = Array(repeating:Array(repeating: 0, count: chars1.count + 1), count: chars2.count + 1)
        for i in 0...chars1.count {
            for j in 0...chars2.count {
                let result = max(max(dp[i - 1][j], dp[i][j - 1]), dp[i - 1][j - 1] + (chars1[i] == chars2[j] ? 1 : 0))
                dp[i][j] = max(dp[i][j], result)
            }
        }
        let lCommonSubSequence = dp[chars1.count][chars2.count]
        return chars2.count - (chars1.count - lCommonSubSequence)
    }
}
