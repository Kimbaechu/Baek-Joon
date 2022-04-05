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

var cost = [0]
var weight = [0]

var dp = Array(repeating: 0, count: k+1)

for _ in 0..<n {
    let wv = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let w = wv[0]
    let v = wv[1]
    cost.append(v)
    weight.append(w)
}

for i in 1...n {
    for j in stride(from: k, to: 0, by: -1) {
        if j >= weight[i] {
            dp[j] = max(dp[j], dp[j-weight[i]] + cost[i])
        }
    }
}

print(dp[k])
