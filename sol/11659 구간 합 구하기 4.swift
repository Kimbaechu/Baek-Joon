//
//  11659 구간 합 구하기 4.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var sumArr = Array(repeating: 0, count: n+1)
sumArr[0] = 0
sumArr[1] = arr[0]
for i in 0..<n {
    sumArr[i+1] = arr[i] + sumArr[i]
}

for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(sumArr[ij[1]] - sumArr[ij[0]-1])
}

