//
//  2212 센서.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/29.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

if k >= n {
    print(0)
} else {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    var distances: [Int] = []
    for i in 1..<n {
        distances.append(arr[i] - arr[i - 1])
    }
    distances.sort()
    
    var result = 0
    //n - 1 - (k - 1)
    for i in 0..<n - k {
        result += distances[i]
    }
    print(result)
}
