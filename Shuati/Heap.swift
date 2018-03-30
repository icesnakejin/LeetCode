//
//  Heap.swift
//  Shuati
//
//  Created by Yankun Jin on 2018/2/19.
//  Copyright © 2018年 Yankun Jin. All rights reserved.
//

import UIKit

struct Heap<Element> : Testable {
    var elements : [Element]
    var isPriorityTo : (Element, Element) -> Bool
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func size() -> Int {
        return elements.count
    }
    
    func peek() -> Element? {
        if !elements.isEmpty {
            return elements[0];
        }
        return nil
    }
    
    mutating func poll() -> Element? {
        if size() > 0 {
            let result = elements[0]
            swap(ind1: 0, ind2: size() - 1)
            elements.remove(at: elements.count - 1)
            
            if size() > 0 {
                siftDown(0)
            }
            
            return result
        }
        return nil
    }
    
    mutating func offer(_ e : Element) {
        elements.append(e)
        siftUp(elements.count - 1)
    }
    
    private func leftChild(index : Int)->Element? {
        if index * 2 + 1 < elements.count {
            return elements[index * 2 + 1]
        }
        return nil
    }
    
    private func rightChild(index : Int)->Element? {
        if index * 2 + 2 < elements.count {
            return elements[index * 2 + 2]
        }
        return nil
    }
    
    private func parent(index : Int) -> Element? {
        if index > 0  {
            return elements[(index - 1) / 2]
        }
        return nil
    }
    
    private mutating func swap(ind1 : Int, ind2 : Int) {
        let temp = elements[ind1]
        elements[ind1] = elements[ind2]
        elements[ind2] = temp
    }
    
    private mutating func siftDown(_ index: Int) {
        var temp = index
      
        while temp < size()  {
            
            var nextIndex = temp
            if let rc = rightChild(index: temp),
                isPriorityTo(rc, elements[temp]){
                swap(ind1: temp, ind2: 2 * temp + 2)
                nextIndex = 2 * temp + 2
               
            }
            
            if let lc = leftChild(index: temp),
                isPriorityTo(lc, elements[temp]) {
                swap(ind1: temp, ind2: 2 * temp + 1)
                nextIndex = 2 * temp + 1
                
            }
            
            if nextIndex == temp { break }
            temp = nextIndex
        }
    }
    
    private mutating func siftUp(_ index: Int) {
        var temp = index
        while temp > 0 {
            if let p = parent(index: temp),
                isPriorityTo(elements[temp], p){
                swap(ind1: temp, ind2: (temp - 1) / 2)
                temp = (temp - 1) / 2
            } else {
                break
            }
        }
    }
    
    mutating func printResult(params: Any...) {
        let _ = params[0] as! [Int]
        while !elements.isEmpty {
            print("peek result is : \(poll()!)")
        }
        
    }
}


