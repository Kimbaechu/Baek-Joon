//
//  12865 평범한 배낭.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nk[0]
let k = nk[1]

var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)

for i in 1..<n+1 {
    let wv = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let w = wv[0]
    let v = wv[1]

    for j in 1..<k+1 {
        if j < w {
            dp[i][j] = dp[i-1][j]
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-w]+v)
        }
    }
}
print(dp[n][k])
