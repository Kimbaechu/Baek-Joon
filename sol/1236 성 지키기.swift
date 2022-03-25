//
//  1236 성 지키기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var box: [[Character]] = []
var row = Array(repeating: 1, count: n)
var column = Array(repeating: 1, count: m)

for i in 0..<n {
    box.append(readLine()!.map{$0})
    for j in 0..<m {
        if box[i][j] == "X" {
            row[i] = 0
            column[j] = 0
        }
    }
}

print(max(row.reduce(0, +), column.reduce(0, +)))
