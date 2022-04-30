//
//  1167 트리의 지름.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/30.
//

import Foundation

let n = Int(readLine()!)!
var graph = Array(repeating: [(node: Int, d: Int)](), count: n+1)

for _ in 0..<n {
    let line = readLine()!.split(separator : " ").map { Int(String($0))! }
    
    for i in 0..<line.count/2 - 1 {
        graph[line[0]].append((line[i*2+1], line[i*2+2]))
    }
}

var visited = Array(repeating: false, count: n+1)

var r = (node: 0, d: 0)
func dfs(_ node: Int, _ distance: Int) {
    visited[node]  = true
    if distance > r.d {
        r = (node, distance)
    }
    for n in graph[node] {
        if !visited[n.node] {
            dfs(n.node, distance + n.d)
        }
    }
}

dfs(1, 0)
let far = r.node

r = (0, 0)
visited = Array(repeating: false, count: n+1)
dfs(far, 0)

print(r.d)
