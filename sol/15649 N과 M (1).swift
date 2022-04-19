//
//  15649 N과 M (1).swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/19.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var visited = Array(repeating: false, count: n)

func dfs(depth: Int, result: String) {
    if depth == m {
        print(result)
        return
    }
        
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth: depth + 1, result: result + "\(i+1) ")
            visited[i] = false
        }
    }
}

dfs(depth: 0, result: "")
