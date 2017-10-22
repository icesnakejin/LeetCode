//
//  Stack.swift
//  Shuati
//
//  Created by Yankun Jin on 5/14/17.
//  Copyright © 2017 Yankun Jin. All rights reserved.
//

import Foundation

struct Stack<Element> {
    fileprivate var array : [Element] = [Element]()
    var hm = [Int:Int]()
    mutating func push(_ element : Element) -> Void {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
  
}
