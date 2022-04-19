//
//  15663 N과 M (9).swift
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
var ans: [String] = []

func dfs(depth: Int, result: String) {
    var last = 0
    if depth == m {
        ans.append(result)
        return
    }
    
    for i in 0..<n {
        if !visited[i], last != arr[i] {
            visited[i] = true
            dfs(depth: depth + 1, result: result + "\(arr[i]) ")
            last = arr[i]
            visited[i] = false
        }
    }
}

dfs(depth: 0, result: "")
ans.forEach { print($0) }

