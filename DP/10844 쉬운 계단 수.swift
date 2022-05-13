//
//  10844 쉬운 계단 수.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/13.
//

import Foundation

let n = Int(readLine()!)!
var dp = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
let m = 1000000000
for _ in 1..<n {
    let pre = dp
    dp[0] = pre[1]
    for j in 1...8 {
        dp[j] = (pre[j-1] + pre[j+1]) % m
    }
    dp[9] = pre[8]
}

print(dp.reduce(0, +) % m)
