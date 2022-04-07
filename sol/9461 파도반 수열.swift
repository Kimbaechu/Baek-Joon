//
//  9461 파도반 수열.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 101)
    dp[0] = 1
    dp[1] = 1
    dp[2] = 1
    dp[3] = 2
    if n > 3 {
        for i in 4..<n+1 {
            dp[i] = dp[i-3] + dp[i-2]
        }
    }
    print(dp[n-1])
}
