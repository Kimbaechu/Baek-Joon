//
//  11660 구간 합 구하기 5.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/22.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var sum = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)

for i in 1...n {
    let x = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 1...n {
        sum[i][j] = x[j-1] + sum[i-1][j] + sum[i][j-1] - sum[i-1][j-1]
    }
}
for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x1 = xy[0]
    let y1 = xy[1]
    let x2 = xy[2]
    let y2 = xy[3]
    print(sum[x2][y2]-sum[x2][y1-1]-sum[x1-1][y2]+sum[x1-1][y1-1])
}
