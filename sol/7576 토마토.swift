//
//  7576 토마토.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

var mn = readLine()!.split(separator: " ").map{Int($0)!}
var m = mn[0]
var n = mn[1]
var box = [[Int]]()
var q = [(Int, Int)]()
let dx = [-1, 1, 0 , 0]
let dy = [0, 0, -1, 1]

for _ in 0..<n {
    box.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func bfs() {
    var index = 0
    
    while index < q.count {
        let (x, y) = q[index]
        index += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if !(nx < 0 || ny < 0 || nx >= n || ny >= m) {
                if box[nx][ny] == 0 {
                    q.append((nx, ny))
                    box[nx][ny] = box[x][y] + 1
                }
            }
        }
    }
}

for x in 0..<n {
    for y in 0..<m {
        if box[x][y] == 1 {
            q.append((x, y))
        }
    }
}

bfs()

var result = 0
for e in box.flatMap({ $0 }) {
    if e == 0 {
        result = 0
        break
    } else {
        result = max(e, result)
    }
}
print(result-1)
