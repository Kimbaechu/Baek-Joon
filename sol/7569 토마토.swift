//
//  7569 토마토.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/12.
//

import Foundation

let mnh = readLine()!.split(separator: " ").map{ Int($0)! }
let m = mnh[0]
let n = mnh[1]
let h = mnh[2]

typealias Tomato = (x: Int, y: Int, z: Int, day: Int)
var q = [Tomato]()
var box = Array(repeating: Array(repeating: Array(repeating: -1, count: h), count: n), count: m)

for k in 0..<h {
    for j in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        input.enumerated().forEach {
            box[$0][j][k] = $1
            if $1 == 1 {
                q.append(($0, j, k, 0))
            }
        }
    }
}

let directions = [(1,0,0), (-1,0,0), (0,1,0), (0,-1,0), (0,0,1), (0,0,-1)]

func bfs() -> Int {
    var result = 0
    var index = 0
    while index < q.count {
        let cur = q[index]
        for d in directions {
            let nx = cur.x + d.0
            let ny = cur.y + d.1
            let nz = cur.z + d.2
            let nDay = cur.day + 1
            
            if nx >= 0, nx < m, ny >= 0, ny < n, nz >= 0, nz < h,
               box[nx][ny][nz] == 0 {
                box[nx][ny][nz] = 1
                result = max(result, nDay)
                q.append((nx, ny, nz, nDay))
            }
        }
        index += 1
    }
    
    for i in 0..<m {
        for j in 0..<n {
            for k in 0..<h {
                if box[i][j][k] == 0 {
                    result = -1
                    break
                }
            }
        }
    }
    return result
}
print(bfs())

