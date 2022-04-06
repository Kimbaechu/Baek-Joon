//
//  1697 숨바꼭질.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]
let max = 100001
var arr = Array(repeating: 0, count: max)

func bfs() -> Int {
    var index = 0
    var queue = [n]

    while index < queue.count {
        let v = queue[index]
        if v == k {
            return arr[v]
        }
        index += 1
        for e in [v-1, v+1, v*2] {
            if e >= 0, e < max, arr[e] == 0, e != n {
                arr[e] = arr[v] + 1
                queue.append(e)
            }
        }
    }
    return -1
}

print(bfs())
