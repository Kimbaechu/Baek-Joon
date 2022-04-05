//
//  17626 Four Squares.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 50001)
dp[1] = 1

if n != 1 {
    for i in 2..<n+1 {
        var result = Int.max
        for j in 1..<Int(sqrt(Double(i))) + 1 {
            result = min(result, dp[i - j * j])
        }
        dp[i] = 1 + result
    }
}
print(dp[n])

