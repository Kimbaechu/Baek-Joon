//
//  15654 N과 M (5).swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/20.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var visited = Array(repeating: false, count: n)

func dfs(depth: Int, result: String) {
    if depth == m {
        print(result)
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth: depth + 1, result: result + "\(arr[i]) ")
            visited[i] = false
        }
    }
}

dfs(depth: 0, result: "")
