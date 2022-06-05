//
//  1789 수들의 합.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/06/05.
//

import Foundation

let n = Int(readLine()!)!
var sum = 0
for i in 0..<200000 {
    sum += i
    if sum == n {
        print(i)
        break
    } else if sum > n {
        print(i-1)
        break
    }
}
