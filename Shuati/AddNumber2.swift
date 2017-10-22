//
//  AddNumber2.swift
//  Shuati
//
//  Created by Yankun Jin on 5/16/17.
//  Copyright © 2017 Yankun Jin. All rights reserved.
//

import UIKit

  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }
 
class AddNumber2: NSObject {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if let h1 = l1 , let h2 = l2 {
            let len1 = countLength(h1)
            let len2 = countLength(h2)
            if len1 > len2 {
                return helper (h1, l2: h2, offset: len1 - len2)
            } else {
                return helper (h2, l2: h1, offset: len2 - len1)
            }
        } else {
            return nil
        }
    }
    
    func countLength(_ node : ListNode?) -> Int {
        if let l1 = node {
            return countLength(l1.next) + 1
        } else {
            return 0
        }
    }
    
    func helper(_ l1 : ListNode?, l2 : ListNode?, offset : Int) -> ListNode? {
        if let h1 = l1 , let h2 = l2 {
            let result = offset == 0 ? ListNode(h1.val + h2.val) : ListNode(h1.val)
            let post = offset == 0 ? helper(h1.next, l2: h2.next, offset: 0) : helper(h1.next, l2 : h2, offset: offset - 1)
            if let p = post , p.val > 9 {
                p.val = p.val % 10
                result.val += 1
            }
            result.next = post;
            return result
        } else {
            return nil
        }
    }
}
