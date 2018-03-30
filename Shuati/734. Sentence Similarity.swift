//
//  734. Sentence Similarity.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/9.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation
class SSSolution : Testable {
    func areSentencesSimilar(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        var dict = [String: String]()
        for pair in pairs {
            let str1 = pair[0]
            let str2 = pair[1]
            dict[str1] = str2
            dict[str2] = str1
        }
        for word in words1 {
            if words2.contains(word) {continue}
            if let w1 = dict[word] , words2.contains(w1) {continue}
            return false
        }
        return true
    }
}
