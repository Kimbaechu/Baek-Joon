//
//  11404 플로이드.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/29.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = abc[0]
    let b = abc[1]
    let c = abc[2]
    
    graph[a][b] = min(graph[a][b], c)
}

for k in 1...n {
    for from in 1...n {
        for to in 1...n {
            if from != to, graph[from][k] != Int.max && graph[k][to] != Int.max {
                graph[from][to] = min(graph[from][to], graph[from][k] + graph[k][to])
            }
        }
    }
}

for i in 1...n {
    for j in 1...n {
        print(graph[i][j] == Int.max ? 0 : graph[i][j], terminator: " ")
    }
    print()
}
