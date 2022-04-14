//
//  main.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

let n = Int(readLine()!)!
var arr: [[Character]] = []
for _ in 0..<n {
    let line = readLine()!.map { $0 }
    arr.append(line)
}
let dx = [-1, 1, 0 , 0]
let dy = [0, 0, -1, 1]

var c1 = 0
var c2 = 0

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var q = [(Int, Int)]()
var index = 0

for i in 0..<n {
    for j in 0..<n {
        q = []
        index = 0
        if !visited[i][j] {
            visited[i][j] = true
            q.append((i, j))
            bfs(i: i, j: j, blind: true)
        }
    }
}
visited = Array(repeating: Array(repeating: false, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        q = []
        index = 0
        if !visited[i][j] {
            
            bfs(i: i, j: j, blind: false)
        }
    }
}

print(c2, c1)

func bfs(i: Int, j: Int, blind: Bool) {
    visited[i][j] = true
    q.append((i, j))
    let color = arr[i][j]
    
    while index < q.count {
        let (x, y) = q[index]
        index += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0, ny >= 0, nx < n, ny < n {
                if !visited[nx][ny] {
                    if check(color: color, nextColor: arr[nx][ny], blind: blind) {
                        q.append((nx, ny))
                        visited[nx][ny] = true
                    }
                }
            }
        }
    }
    if blind {
        c1 += 1
    } else {
        c2 += 1
    }
}
func check(color: Character, nextColor: Character, blind: Bool) -> Bool {
    if blind {
        if color == "R" || color == "G" {
            return nextColor == "R" || nextColor == "G"
        } else {
            return nextColor == "B"
        }
    } else {
        return color == nextColor
    }
}
