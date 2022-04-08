//
//  2667 단지번호붙이기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()

for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    arr.append(line)
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var count = 0

func dfs(_ x: Int, _ y: Int) {
    count += 1
    visited[x][y] = true
        
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if nx >= 0, nx < n, ny >= 0, ny < n, arr[nx][ny] == 1, !visited[nx][ny] {
            dfs(nx, ny)
        }
    }
}

var nums = [Int]()
for i in 0..<n {
    for j in 0..<n {
        if arr[i][j] == 1, !visited[i][j] {
            count = 0
            dfs(i, j)
            nums.append(count)
        }
    }
}

print(nums.count)
nums.sorted().forEach { print($0) }
