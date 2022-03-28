//
//  2012 등수 매기기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/28.
//

import Foundation

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()
var result = 0
for i in 0..<n {
    result += abs(i+1 - arr[i])
}
print(result)
