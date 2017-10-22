//
//  TestableProtocal.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/9/29.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

protocol Testable {
    func printResult(params: Any...)
}

extension Testable {
    func printResult(params: Any...) {
        print("nothing is tested")
    }
}
