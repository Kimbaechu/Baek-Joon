//
//  2606 바이러스.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var arr = Array(repeating: Array(repeating: 0, count: 0), count: n+1)
for _ in 0..<k {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let x = data[0]
    let y = data[1]
    arr[x].append(y)
    arr[y].append(x)
}

var visited = Array(repeating: false, count: n+1)

func dfs(_ v: Int) {
    visited[v] = true

    for e in arr[v] {
        if !visited[e] {
            dfs(e)
        }
    }
}
dfs(1)
print(visited.filter { $0 == true }.count - 1)
