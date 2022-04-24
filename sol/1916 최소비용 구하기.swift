//
//  1916 최소비용 구하기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/25.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: [(Int, Int)](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var weights = Array(repeating: Int.max, count: n+1)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[abc[0]].append((abc[1], abc[2]))
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let start = input[0]
let end = input[1]

func sol(_ node: Int) {
    if node == end {
        print(weights[end])
        return
    }
    
    visited[node] = true
    for d in graph[node] {
        weights[d.0] = min(weights[d.0], weights[node] + d.1)
    }
    
    var minW = Int.max
    var next = -1
    
    for i in 1..<weights.count {
        if !visited[i] && minW > weights[i] {
            minW = weights[i]
            next = i
        }
    }
    sol(next)
}

weights[start] = 0
sol(start)

