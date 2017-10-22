//
//  640. Solve the Equation.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/15.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Solve_Equation_Solution : Testable {
    func solveEquation(_ equation: String) -> String {
        let components = equation.components(separatedBy: "=")
        if components.count != 2 {return ""}
        let l = eval(components[0])
        let r = eval(components[1])
        
        let left = l.0 - r.0
        let right = r.1 - l.1
        if left == 0 && right != 0 {return "No solution"}
        if right == 0 && left == 0 {return "Infinite solution"}
        return "x=\(right / left)"
        
    }
    
    func eval(_ expression: String) -> (Int, Int) {
        
        let chars = Array(expression.characters)
     
        var coef = 0
        var value = 0
        var currentNum = 0
        var isNeg = 1
        for (i, c) in chars.enumerated() {
            if c == "+" || c == "-" {
                value += currentNum * isNeg
                isNeg = c == "+" ? 1 : -1
                currentNum = 0
                
            }
            if "0"..."9" ~= c {
                currentNum = currentNum * 10 + Int(String(c))!
            }
            
            if c == "x" {
                if i == 0 || chars[i - 1] == "+" || chars[i - 1] == "-" {
                    currentNum = max(1, currentNum)
                }
                coef += currentNum * isNeg
                currentNum = 0
            }
            
        }
        value += currentNum * isNeg
        return (coef, value)
    }
    
    func printResult(params: Any...) {
        let result = solveEquation(params[0] as! String)
        print("640. Solve the Equation : \(result)")
    }
    
}
