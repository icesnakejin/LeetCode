//
//  ComplexProduction.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/6/27.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class ComplexProduction {
    func complexNumberMultiply(_ a: String, _ b: String) -> String {
        var componentA = a.components(separatedBy: "+")
        let realA : String = componentA[0]
        let voidA : String? = componentA.count > 1 ? componentA[1] : nil
        var componentB = b.components(separatedBy: "+")
        let realB : String = componentB[0]
        let voidB : String? = componentB.count > 1 ? componentB[1] : nil
        var imgA : String? = nil
        var imgB : String? = nil
        if let vA = voidA {
            imgA = vA.components(separatedBy: "i")[0]
        }
        
        if let vB = voidB {
            imgB = vB.components(separatedBy: "i")[0]
        }
        
        let rA = Int(realA)
        var iA : Int = 0
        if let imA = imgA, let imagA = Int(imA) {
            iA = imagA
        }
        
        let rB = Int(realB)
        var iB : Int = 0
        if let imB = imgB, let imagB = Int(imB) {
            iB = imagB
        }
        
        var result = ""
        if let realAInt = rA , let realBInt = rB {
            result += String(realAInt * realBInt - iA * iB)
            result += "+"
            result += String(realAInt * iB + iA * realBInt)
            result += "!"
        }
        return result
    }
}
