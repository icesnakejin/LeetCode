//
//  479. Largest Palindrome Product.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/1/27.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import Foundation

class LongestParlinSolution : Testable {
    func largestPalindrome(_ n: Int) -> Int {
        if n == 1 { return 9 }
        var l = 0
        var r = 0
        var m = n
        while m >= 1 {
            l = l * 10 + 9
            r = r * 10 + 9
            m -= 1
        }
        // print("l is \(l)")
        // print("r is \(r)")
        let maxNum = l * r
        let halfMaxLen = String(maxNum).characters.count / 2
        
        let minNum = (l / 10 + 1) * (r / 10 + 1)
        let halfMinLen = String(minNum).characters.count / 2
        if String(maxNum).characters.count % 2 == 0 {
            return helper(halfMaxLen, "", "", r, n)
        } else {
            var result = -1
            for i in (0...9).reversed() {
                result = helper(halfMaxLen, String(i),"", r, n)
                if result >= 0 {
                    return result
                }
            }
        }
        return 0
    }
    func helper(_ halfLen : Int, _ mid : String, _ current : String, _ r : Int, _ n: Int) -> Int {
        if current.characters.count == halfLen {
            let str = current + mid + String(current.characters.reversed())
            if let intStr = Int(str) {
                for j in (r/10 + 1...r).reversed() {
                    if intStr / j > r || j * j < intStr {
                        break
                    }
                    if intStr % j == 0 && isDigitsRight(n, intStr / j) {
                        // print("intStr is \(intStr)")
                        //  print("j is \(j)")
                        // print("intStr / j is \(intStr / j)")
                        return intStr % 1337
                    }
                }
            }
        } else {
            for i in (0...9).reversed() {
                let con = helper(halfLen, mid, current + String(i) , r, n)
                if con >= 0 {
                    return con
                }
            }
        }
        return -1
    }
    func isDigitsRight(_ n : Int, _ num : Int) -> Bool {
        var temp = num
        var cnt = 0
        while temp > 0 {
            temp /= 10
            cnt += 1
        }
        return cnt == n
    }
    func isPalin(_ s: String) -> Bool {
        let chars = Array(s.characters)
        var s = 0
        var e = chars.count - 1
        while (s < e) {
            let c1 = chars[s]
            let c2 = chars[e]
            if c1 != c2 {return false}
            s += 1
            e -= 1
        }
        return true
    }
    func printResult(params: Any...) {
        let input = params[0] as! Int
        print("479. Largest Palindrome Product result is : \(largestPalindrome(input))")
    }
}
