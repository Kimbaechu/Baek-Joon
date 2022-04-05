//
//  11053 가장 긴 증가하는 부분 수열.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 1, count: n)
for i in 1..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}
print(dp.max()!)
