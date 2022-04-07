//
//  11724 연결 요소의 개수.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

var NM = readLine()!.split(separator: " ").map{Int($0)!}
var N = NM[0]
var M = NM[1]

var arr = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)

for _ in 0..<M {
    let data = readLine()!.split(separator: " ").map{Int($0)!}
    let a = data[0]
    let b = data[1]
    arr[a].append(b)
    arr[b].append(a)
}

func dfs(_ x: Int) {
    visited[x] = true
    for e in arr[x] {
        if !visited[e] {
            dfs(e)
        }
    }
}

var result = 0
for i in 1...N {
    if !visited[i] {
        result += 1
        dfs(i)
    }
}

print(result)
