//
//  2579 계단 오르기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

var n = Int(readLine()!)!
var arr = [0]
var dp = [Int](repeating: 0, count: n+1)

for i in 1..<n+1 {
    let k = Int(readLine()!)!
    arr.append(k)
    
    if i == 1 {
        dp[1] = arr[1]
    } else if i == 2 {
        dp[2] = dp[1] + arr[2]
    } else if i == 3 {
        dp[3] = max(dp[1], arr[2]) + arr[3]
    } else {
        dp[i] = max(dp[i-3]+arr[i-1], dp[i-2]) + arr[i]
    }
}
print(dp[n])
