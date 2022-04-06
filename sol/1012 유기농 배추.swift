//
//  1012 유기농 배추.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0]
    let n = mnk[1]
    let k = mnk[2]
    
    var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for _ in 0..<k {
        let s = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr[s[1]][s[0]] = 1
    }
    
    func dfs(_ x: Int, _ y: Int) {
        visited[x][y] = true
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            if arr[nx][ny] != 0 && !visited[nx][ny] {
                dfs(nx, ny)
            }
        }
    }
    
    var result = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if arr[i][j] != 0 && !visited[i][j] {
                dfs(i, j)
                result += 1
            }
        }
    }
    print(result)
}

