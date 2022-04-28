//
//  2206 벽 부수고 이동하기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/28.
//

import Foundation

struct Node {
    let x: Int
    let y: Int
    let wall: Int
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.map { Int(String($0))!})
}
var dist = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n)

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func bfs() {
    var q = [Node]()
    var index = 0
    q.append(Node(x: 0, y: 0, wall: 0))
    dist[0][0][0] = 1

    while index < q.count {
        let v = q[index]
        let (x, y, wall) = (v.x, v.y, v.wall)
        index += 1
        
        if x == n-1 && y == m-1 {
            print(dist[x][y][wall])
            return
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0, nx < n, ny >= 0, ny < m {
                if map[nx][ny] == 0, dist[nx][ny][wall] == 0 {
                    dist[nx][ny][wall] = dist[x][y][wall] + 1
                    q.append(Node(x: nx, y: ny, wall: wall))
                } else if map[nx][ny] == 1, wall == 0, dist[nx][ny][wall+1] == 0 {
                    dist[nx][ny][wall+1] = dist[x][y][wall] + 1
                    q.append(Node(x: nx, y: ny, wall: wall+1))
                }
            }
        }
        
    }
    print(-1)
}

bfs()
