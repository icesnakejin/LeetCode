//
//  672. Bulb Switcher II.swift
//  Shuati
//
//  Created by Yankun Jin on 2017/10/24.
//  Copyright © 2017年 Yankun Jin. All rights reserved.
//

import Foundation

class Builb_Switch2_Solution {
    func flipLights(_ n: Int, _ m: Int) -> Int {
        if m == 0 {return 1}
        if n == 1 {return 2}
        if n == 2 && m == 1 {return 3}
        if n == 2 {return 4}
        if m == 1 {return 4}
        if m == 2 {return 7}
        return 8
    }
    
    // 非常傻逼的数学题。只要看前面四盏灯，后面的都是以4为单位重复，然后第四盏灯其实又只于第一盏灯决定（一样 or 取反），所以只有第一盏灯变了，第四盏灯才会变。所以当n >= 3，m >= 3,就只有八种情况(枚举前三盏灯，000....1111). 其他情况都当做special case处理。真是他妈傻逼。
}
