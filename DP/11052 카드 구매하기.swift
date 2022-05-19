//
//  11052 카드 구매하기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/19.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 0, count: n+1)

for i in 1..<n+1 {
    for j in 1..<i+1 {
        dp[i] = max(dp[i-j]+arr[j-1], dp[i])
    }
}
print(dp[n])
