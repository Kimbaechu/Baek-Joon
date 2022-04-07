//
//  1992 쿼드트리.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation

var N = Int(readLine()!)!
var arr = [[Int]]()
var result = ""

for _ in 0..<N {
    arr.append(readLine()!.map{Int(String($0))!})
}

func divide(_ row: Int, _ col: Int, _ arr: [[Int]], _ size: Int) {
    if check(row, col, arr, size) {
       return
    } else {
        let newSize = size / 2
        for i in 0..<2 {
            for j in 0..<2 {
                divide(row + (newSize * i), col + (newSize * j), arr, newSize)
            }
        }
        result += ")"
    }
}

func check(_ row: Int, _ col: Int, _ arr: [[Int]], _ size: Int) -> Bool {
    let n = arr[row][col]
    for i in row..<row+size {
        for j in col..<col+size {
            if arr[i][j] != n {
                result += "("
                return false
            }
        }
    }
    result += "\(n)"
    return true
}
divide(0, 0, arr, N)
print(result)
