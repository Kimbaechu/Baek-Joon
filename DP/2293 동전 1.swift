//
//  2293 동전 1.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/17.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var coins = [Int]()

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: k+1)
dp[0] = 1

for i in coins where i <= k {
    for j in i...k {
        dp[j] += dp[j-i]
        if dp[j] > Int(pow(2.0, 31.0)) {
            dp[j] = 0
        }
    }
}

print(dp[k])


