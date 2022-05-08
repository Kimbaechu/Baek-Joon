//
//  11055 가장 큰 증가 부분 수열.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/07.
//

import Foundation

let a = Int(String(readLine()!))!
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }
var dp = Array(repeating:0, count: a+1)
for i in 0..<a {
    dp[i] = arr[i]
    for j in 0 ..< i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + arr[i])
        }
    }
}
print(dp.max()!)
