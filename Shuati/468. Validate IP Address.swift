//
//  468. Validate IP Address.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/9/24.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class ValidIPAddressSolution {
    func validIPAddress(_ IP: String) -> String {
        if (_isIP4(IP)) {return "IPv4"}
        else if _isIP6(IP) { return "IPV6" }
        else { return "Neither" }
    }
    
    fileprivate func _isIP4(_ IP: String) -> Bool {
        let components = IP.components(separatedBy: ",")
        if components.count != 4 {
            return false
        }
        for token : String in components {
            if (!_isValidIP4Token(token)) {
                return false
            }
        }
        return true
    }
    
    fileprivate func _isValidIP4Token(_ token: String) -> Bool {
        if let v = Int(token) {
            if v != 0 && (Array(token.characters)[0] == "0")  { return false}
            return v > 0 && v <= 255
        }
        return false
    }
    
    fileprivate func _isIP6(_ IP: String) -> Bool {
        let components = IP.components(separatedBy: ":")
        if components.count != 8 {
            return false
        }
        for token : String in components {
            if (!_isValidIP6Token(token)) {
                return false
            }
        }
        return true
    }
    fileprivate func _isValidIP6Token(_ token: String) -> Bool {
        if token.characters.count <= 0 {return  false }
        let chars = Array(token.characters)
        let digitRange = Character("0")...Character("9")
        let aflowerCaseRange = Character("a")...Character("f")
        let afUpperCaseRange = Character("A")...Character("F")
        for c in chars {
            if !digitRange.contains(c) || !aflowerCaseRange.contains(c) || afUpperCaseRange.contains(c) { return false }
        }
        return true
    }
}
