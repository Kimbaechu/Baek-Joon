//
//  16928 뱀과 사다리 게임.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var dict = [Int: Int]()
for _ in 0..<n+m {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    dict[xy[0]] = xy[1]
}

var queue: [(cnt: Int, num: Int)] = [(0, 1)]
var index = 0
var visited = Array(repeating: false , count: 101)
let dice = [1, 2, 3, 4, 5, 6]

while true {
    let v = queue[index]
    index += 1
    let num = v.num
    if num == 100 {
        print(v.cnt)
        break
    }
    for i in dice {
        let nn = num + i
        if nn <= 100 {
            let j = dict[nn] ?? nn
            if !visited[j] {
                visited[j] = true
                queue.append((v.cnt + 1, j))
            }
        }
    }
}
