//
//  609. Find Duplicate File in System.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/7/11.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class FindDuplicateFile {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var hm = [String : [String]]()
        for path in paths {
            let components = path.components(separatedBy: [" "])
            let dir = components[0]
            for i in 1..<components.count {
                let content = match(regex: "\\([a-zA-Z0-9]*\\)", text: components[i])
                let value = dir + "/" + components[i].components(separatedBy: "(")[0]
                if var dict = hm[content[0]] {
                    dict.append(value)
                    hm[content[0]] = dict
                } else {
                    var arr = [String]()
                    arr.append(value)
                    hm[content[0]] = arr
                    
                }
            }
        }
        return hm.map{$1}.filter{$0.count>1}
    }
    
    fileprivate func match(regex: String, text: String) -> [String] {
         do {
            let pattern = try NSRegularExpression(pattern: regex, options:[])
            let nsString = text as NSString
            let results = pattern.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map{nsString.substring(with:$0.range)}
            
        } catch let error as NSError {
            print("match error \(error.description)")
            return []
        } 
    }
}
