//
//  15650 N과 M (2).swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/18.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

func dfs(start: Int, depth: Int, result: String) {
    if depth == m {
        print(result)
        return
    }
    
    for i in start..<n {
        dfs(start: i+1, depth: depth+1, result: result + "\(i+1) ")
    }
}

dfs(start: 0, depth: 0, result: "")
