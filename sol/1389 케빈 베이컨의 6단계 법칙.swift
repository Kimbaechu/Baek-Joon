//
//  1389 케빈 베이컨의 6단계 법칙.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation

let input = readLine()!.split(separator : " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var arr = Array(repeating : [Int](), count : N+1)

for _ in 0..<M {
    let line = readLine()!.split(separator : " ").map { Int(String($0))! }
    arr[line[0]].append(line[1])
    arr[line[1]].append(line[0])
}

func bfs(_ x: Int ) -> Int {
    var q = [(x, 0)]
    var visited = Array(repeating : false, count : N+1)
    var count = 0
    var index = 0
    visited[x] = true
    
    while index < q.count {
        let v = q[index]
        index += 1
        for e in arr[v.0] {
            if !visited[e] {
                visited[e] = true
                count += v.1+1
                q.append((e, v.1+1))
            }
        }
    }
    return count
}

var result = (Int.max, 0)
for i in 1...N {
    let count = bfs(i)
    if result.0 > count {
        result = (count, i)
    }
}
print(result.1)
