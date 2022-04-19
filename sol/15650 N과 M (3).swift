//
//  15650 N과 M (3).swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/19.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

func dfs(depth: Int, result: String) {
    if depth == m {
        print(result)
        return
    }
    
    for i in 0..<n {
        dfs(depth: depth+1, result: result + "\(i+1) ")
    }
}

dfs(depth: 0, result: "")
