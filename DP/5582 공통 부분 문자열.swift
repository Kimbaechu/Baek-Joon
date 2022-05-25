//
//  5582 공통 부분 문자열.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/25.
//

import Foundation

let a = Array(readLine()!)
let b = Array(readLine()!)
var result = 0
var dp = Array(repeating: Array(repeating: 0, count: b.count + 1), count: a.count + 1)

for i in 1...a.count {
    for j in 1...b.count {
        if a[i-1] == b[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
            result = max(result, dp[i][j])
        }
    }
}
print(result)
