//
//  11057 오르막 수.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/17.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: 1, count: 10)
for _ in 1..<n {
    arr[0] = 1
    for i in 1..<10 {
        arr[i] = (arr[i-1] + arr[i]) % 10007
    }
}
print(arr.reduce(0, +) % 10007)
