//
//  1260 DFS와 BFS.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]
var graph = Array(repeating: Array(repeating: 0, count: 0), count: n+1)

for _ in 0..<m {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x = data[0]
    let y = data[1]
    graph[x].append(y)
    graph[y].append(x)
}

for i in 0..<n+1 {
    graph[i].sort()
}

var visited = Array(repeating: false, count: n+1)
dfs(v)
print()
visited = Array(repeating: false, count: n+1)
bfs(v)

func dfs(_ v: Int) {
    print(v, terminator: " ")
    visited[v] = true

    for e in graph[v] {
        if !visited[e] {
            dfs(e)
        }
    }
}

func bfs(_ v: Int) {
    var index = 0
    var queue = [v]
    visited[v] = true

    while index < queue.count {
        let v = queue[index]
        print(v, terminator: " ")
        index += 1
        for e in graph[v] {
            if !visited[e] {
                visited[e] = true
                queue.append(e)
            }
        }
    }
}
