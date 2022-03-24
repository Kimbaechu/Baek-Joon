//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/24.
//

import Foundation

var n = Int(readLine()!)!
var a = 0
var b = 1

while n > 0 {
    let c = b
    b = a + b
    a = c
    n -= 1
}

print(a)
