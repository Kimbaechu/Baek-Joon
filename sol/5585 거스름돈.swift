//
//  5585 거스름돈.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/28.
//

import Foundation

var n = 1000 - Int(readLine()!)!
var count = 0
for i in [500, 100, 50, 10, 5, 1] {
    count += n / i
    n %= i
}
print(count)
