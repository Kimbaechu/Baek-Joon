//
//  9251 LCS.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/25.
//

import Foundation

let row = Array(readLine()!)
let col = Array(readLine()!)
let rCount = row.count+1
let cCount = col.count+1
var arr = Array(repeating: Array(repeating: 0, count: cCount), count: rCount)

for r in 1..<rCount {
    for c in 1..<cCount {
        if row[r-1] == col[c-1] {
            arr[r][c] = arr[r-1][c-1] + 1
        } else {
            arr[r][c] = max(arr[r][c-1], arr[r-1][c])
        }
    }
}
print(arr.last?.last ?? 0)
