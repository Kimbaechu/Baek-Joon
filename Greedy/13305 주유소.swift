//
//  13305 주유소.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/26.
//

import Foundation

let n = Int(readLine()!)!
let load = readLine()!.split(separator: " ").map { Int(String($0))! }
let cost = readLine()!.split(separator: " ").map { Int(String($0))! }
var sum = cost[0]*load[0]
var m = cost[0]

for i in 1..<n-1 {
    m = min(m, cost[i])
    sum += m * load[i]
}
print(sum)
