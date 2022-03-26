//
//  2110 공유기 설치.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let c = input[1]
var array: [Int] = []

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

array.sort()

var head = 0
var tail = array.last! - array[0]
var result = 0

while head <= tail {
    let m = (head + tail) / 2
    var count = 1
    var prev = array[0]
    
    for value in array {
        if value >= prev + m {
            prev = value
            count += 1
        }
    }

    if count >= c {
        head = m + 1
        result = max(result, m)
    } else {
        tail = m - 1
    }
}

print(result)



