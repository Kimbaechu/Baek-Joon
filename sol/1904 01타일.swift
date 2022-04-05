//
//  1904 01타일.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
if n > 2 {
    for i in 3..<n+1 {
        dp[i] = (dp[i-2] + dp[i-1]) % 15746
    }
}
print(dp[1])
