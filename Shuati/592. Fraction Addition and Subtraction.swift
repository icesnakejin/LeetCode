//
//  592. Fraction Addition and Subtraction.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/15.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Fraction_Solution : Testable {
    struct FractionNum {
        let nom : Int
        let den : Int
        
        init (_ nom: Int, _ den : Int) {
            self.nom = nom
            self.den = den
        }
        
    }
    func fractionAddition(_ expression: String) -> String {
        let chars = Array(expression.characters)
        var lastFrac : FractionNum?
        var isNeg = 1
        for (i, c) in chars.enumerated() {
            if c == "+" {isNeg = 1}
            if c == "-" {isNeg = -1}
            if c == "/" {
                var ind1 = i - 1
                var sN1 = ""
                var ind2 = i + 1
                var sN2 = ""
                
                while ind1 >= 0 && "0"..."9" ~= chars[ind1] {
                    sN1 = String(chars[ind1]) + sN1
                    ind1 -= 1
                }
                
                while ind2 < chars.count && "0"..."9" ~= chars[ind2] {
                    sN2 += String(chars[ind2])
                    ind2 += 1
                }
                let nom = Int(sN1)
                let den = Int(sN2)
                var result  = FractionNum.init(nom! * isNeg, den!)
                if let lastFrac = lastFrac {
                    result = helper (lastFrac, nom!, den!, isNeg)
                    
                }
                lastFrac = result
            }
        }
        var sResult = ""
        if let lastFrac = lastFrac {
            let rNom = lastFrac.nom
            let rDen = lastFrac.den
            sResult += String(rNom)
            sResult += "/"
            sResult += String(rDen)
        }
        return sResult
    }
    
    func helper(_ lastFran : FractionNum,_ nom : Int, _ den: Int, _ isNeg:Int) -> FractionNum {
        let lNom = lastFran.nom
        let lDen = lastFran.den
        
        var newNom = lNom * den + nom * lDen * isNeg
        var newDen = lDen * den
        reduce(&newNom, &newDen)
        return FractionNum.init(newNom, newDen)
    }
    
    func reduce(_ nom : inout Int, _ den : inout Int) {
        var div = 2
        if nom == 0 {
            den = 1
            return
        }
        while div <= min(abs(nom), abs(den)) {
            while nom % div == 0 && den % div == 0 {
                nom /= div
                den /= div
            }
            div += 1
        }
    }
    
    func printResult(params: Any...) {
        let result = fractionAddition(params[0] as! String)
        print("fractional addition result : \(result)")
    }
}
