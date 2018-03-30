//
//  616. Add Bold Tag in String.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/5.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation

class ABTSolution : Testable {
    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        var tags = [(Int, Int)]()
        for dic in dict {
            let len = dic.characters.count
            let seq = stride(from: 0, to: s.characters.count, by: len)
            for i in seq {
                let ran = s.range(of: dic, options: [], range: s.index(s.startIndex, offsetBy: i)..<s.endIndex, locale: nil)
                if let r = ran {
                    tags.append((s.distance(from: s.startIndex, to: r.lowerBound), s.distance(from: s.startIndex, to: r.upperBound)))
                }
            }
        }
        if tags.count <= 0 { return s }
        tags.sort(by: { (inte1, inte2) -> Bool in
            if inte1.0 != inte2.0 {
                return inte1.0 < inte2.0
            } else {
                return inte1.1 <= inte2.1
            }
        })
        var pre = 0
        var end = 0
        var i = 0
        var result = ""
        while i < tags.count {
            let thisInterval = tags[i]
            result.append(s.substring(with: s.index(s.startIndex, offsetBy:pre)..<s.index(s.startIndex, offsetBy:thisInterval.0)))
            end = thisInterval.1
            while i < tags.count - 1 && tags[i + 1].0 <= end {
                end = max(end, tags[i + 1].1)
                i += 1
            }
            result.append("<b>")
            result.append(s.substring(with: s.index(s.startIndex, offsetBy: thisInterval.0)..<s.index(s.startIndex, offsetBy: end)))
            result.append("</b>")
            i += 1
            pre = end
        }
        result.append(s.substring(with: s.index(s.startIndex, offsetBy:end)..<s.endIndex))
        return result
    }
    
    func printResult(params: Any...) {
        let input = params[0] as! String
        let input1 = params[1] as! [String]
        print("Add bold result is \(addBoldTag(input, input1))")
    }
}

