//
//  15666 N과 M (12).swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/20.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let m = nm[1]
let arr = Array(Set(readLine()!.split(separator: " ").map { Int(String($0))! })).sorted()
let n = arr.count

func dfs(start: Int, depth: Int, result: String) {
    if depth == m {
        print(result)
        return
    }
    
    for i in start..<n {
        dfs(start: i, depth: depth+1, result: result + "\(arr[i]) ")
    }
}

dfs(start: 0, depth: 0, result: "")
