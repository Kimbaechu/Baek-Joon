//
//  11057 오르막 수.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/17.
//

import Foundation

let n  = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 1001)
for i in 0 ..< 10 {
    dp[1][i] = 1
}
if n > 1 {
    for i in 2...n {
        for j in 0..<10 {
            for k in 0...j {
                dp[i][j] += dp[i-1][k] % 10007
            }
        }
    }
}

var sum = 0
for i in 0..<10 {
    sum += dp[n][i]
}
print(sum % 10007)
