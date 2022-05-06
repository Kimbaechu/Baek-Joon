//
//  12851 숨바꼭질 2.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/06.
//

import Foundation

let t = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (t[0], t[1])
var sec = Array(repeating: -1, count: 100001)
var cnt = Array(repeating: 0, count: 100001)

func bfs(_ x: Int) {
    var queue = [x]
    var idx = 0
    sec[x] = 0
    cnt[x] = 1

    while queue.count > idx {
        let v = queue[idx]
        idx += 1

        for nx in [v-1, v+1, v*2] {
            if nx >= 0 && nx <= 100000 {
                if sec[nx] == -1 {
                    sec[nx] = sec[v] + 1
                    cnt[nx] = cnt[v]
                    queue.append(nx)
                } else if sec[nx] == sec[v] + 1 {
                    cnt[nx] += cnt[v]
                }
            }
        }
    }
}

bfs(n)
print(sec[k])
print(cnt[k])
