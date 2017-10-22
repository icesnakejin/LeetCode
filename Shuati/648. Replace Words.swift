//
//  648. Replace Words.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/21.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Replace_Words_Solution : Testable{
    class TrieNode {
        var isWord = false
        var dict = [Character: TrieNode]()
    }
    class Trie {
        var root = TrieNode()
        init (_ dict:[String] ) {
            
            for str in dict {
                var head = root
                for c in Array(str.characters) {
                    if let next = head.dict[c] {
                        head = next
                    } else {
                        let node = TrieNode()
                        head.dict[c] = node
                        head = node
                    }
                }
                if Array(str.characters).count > 0 {
                    head.isWord = true
                }
            }
        }
        
        func findPrefix(_ word:String) -> String? {
            var result = ""
            var head = root
            
            for c in Array(word.characters) {
                if let next = head.dict[c] {
                    result += String(c)
                    head = next
                    if head.isWord { break }
                } else {
                    return nil
                }
            }
            return result
        }
    }
    func replaceWords(_ dict: [String], _ sentence: String) -> String {
        let trie = Trie(dict)
        var result = ""
        let components = sentence.components(separatedBy: " ")
        for (index , com) in components.enumerated() {
            if let prefix = trie.findPrefix(com) {
                result += prefix
            } else {
                result += com
            }
            if index != components.count - 1 {
                result += " "
            }
        }
        return result
    }
    
    func printResult(params: Any...) {
        let p1 = params[0] as! [String]
        let p2 = params[1] as! String
        let result = replaceWords(p1, p2)
        print("648. Replace Words : \(result)")
    }
}
