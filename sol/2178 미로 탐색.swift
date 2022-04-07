//
//  2178 미로 탐색.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var d = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    arr[i] = readLine()!.map{Int(String($0))!}
}

func bfs() {
    var q = [(Int, Int)]()
    var index = 0
    q.append((0, 0))
    d[0][0] = 1
    visited[0][0] = true
    
    while index < q.count {
        let (x, y) = q[index]
        index += 1
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0, nx < n, ny >= 0, ny < m, !visited[nx][ny], arr[nx][ny] == 1 {
                d[nx][ny] = d[x][y] + 1
                visited[nx][ny] = true
                if nx == n-1, ny == m-1 {
                    print(d[nx][ny])
                    return
                }
                q.append((nx, ny))
                
            }
        }
    }
}
bfs()
