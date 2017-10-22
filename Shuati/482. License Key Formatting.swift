//
//  482. License Key Formatting.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/7.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Lisense_Key_Solution: Testable {
    func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
        let wholeString = S.components(separatedBy: "-").joined()
        let length = wholeString.characters.count
        var components = [String]()
        let firstSliceSize = length % K == 0 ? K : length % K
        components.append(wholeString.substring(to: wholeString.index(wholeString.startIndex, offsetBy: K, limitedBy: wholeString.endIndex)!).uppercased())
        
        components.append(contentsOf: stride(from: firstSliceSize, to: wholeString.characters.count, by: K).map { (i: Int) -> String in
            let startIndex = wholeString.index(wholeString.startIndex, offsetBy: i)
            let endIndex   = wholeString.index(startIndex, offsetBy: K, limitedBy: wholeString.endIndex) ?? wholeString.endIndex
            return wholeString.substring(with: startIndex..<endIndex).uppercased()
        })
        return components.joined(separator: "-")
    }
    
    func printResult(params: Any...) {
        let result  = licenseKeyFormatting(params[0] as! String, params[1] as! Int)
        
        print("Lisense Key from origin : \(params[0]) with slice \(params[1]) is \(result)")
    }
}
