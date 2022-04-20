//
//  11725 트리의 부모 찾기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/20.
//

import Foundation

let n = Int(readLine()!)!
var adj = Array(repeating: [Int](), count: n+1)
for _ in 0..<n-1 {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = ab[0]
    let b = ab[1]
    adj[a].append(b)
    adj[b].append(a)
}
var visited = Array(repeating: false, count: n+1)
var parent = Array(repeating: -1, count: n+1)

func dfs(_ i: Int) {
    visited[i] = true
    
    for next in adj[i] {
        if !visited[next] {
            parent[next] = i
            dfs(next)
        }
    }
}

dfs(1)

for i in 2...n {
    print(parent[i])
}
