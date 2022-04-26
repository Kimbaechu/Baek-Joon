//
//  13549 숨바꼭질 3.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/26.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]

let maxNum = 100001
var counts = Array(repeating: Int.max, count: maxNum)

func bfs() -> Int {
    var idx = 0
    var q = [n]
    counts[n] = 0
    
    while idx < q.count {
        let v = q[idx]
        idx += 1
        
        if v == k {
            return counts[v]
        }
        
        if v-1 >= 0, counts[v]+1 < counts[v-1] {
            counts[v-1] = counts[v] + 1
            q.append(v-1)
        }
        
        if v+1 < maxNum, counts[v]+1 < counts[v+1] {
            counts[v+1] = counts[v] + 1
            q.append(v+1)
        }
        
        if v*2 < maxNum, counts[v] < counts[v*2] {
            counts[v*2] = counts[v]
            q.append(v*2)   
        }
    }
    return -1
}
print(bfs())
