//
//  1463 1로 만들기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

var n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)

if n == 1 {
    print("0")
} else {
    for i in 2...n {
        dp[i] = dp[i - 1] + 1
        
        if i % 2 == 0 {
            dp[i] = min(dp[i / 2] + 1, dp[i])
        }
        if i % 3 == 0 {
            dp[i] = min(dp[i / 3] + 1, dp[i])
        }
    }
    print(dp[n])
}
