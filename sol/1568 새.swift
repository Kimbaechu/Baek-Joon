//
//  1568 새.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

var n = Int(readLine()!)!
var result = 0
var k = 1

while n != 0 {
    if k > n {
        k = 1
    }
    n -= k
    k += 1
    result += 1
}
print(result)
