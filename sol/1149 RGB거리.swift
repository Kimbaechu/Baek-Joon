//
//  1149 RGB거리.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/20.
//

import Foundation

let n = Int(readLine()!)!
var cost = [0, 0, 0]
for _ in 0..<n {
    var temp = [0, 0, 0]
    let rgb = readLine()!.split { $0 == " " }.map { Int(String($0))! }

    for i in 0..<3 {
        var minCost = Int.max
        for j in 0..<3 {
            if i != j {
                minCost = min(minCost, cost[j])
            }
        }
        temp[i] = minCost + rgb[i]
    }
    cost = temp
}

print(cost.min()!)
