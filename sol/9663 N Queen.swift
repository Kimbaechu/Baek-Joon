//
//  9663 N Queen.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/09.
//

import Foundation

//let n = Int(readLine()!)!
//var row = Array(repeating: 0, count: n)
//var result = 0
//
//func check(_ x: Int) -> Bool {
//    for i in 0..<x {
//        if row[x] == row[i] {
//            return false
//        }
//        if abs(row[x] - row[i]) == x - i {
//            return false
//        }
//    }
//    return true
//}
//
//func dfs(_ x: Int) {
//    if x == n {
//        result += 1
//    } else {
//        for i in 0..<n {
//            row[x] = i
//            if check(x) {
//                dfs(x+1)
//            }
//        }
//    }
//}
//dfs(0)
//print(result)

let n: Int = Int(readLine()!)!
var queen: [Int] = []
var count: Int = 0

var x: Int = 0
var y: Int = 0

func isSafe(_ x: Int, _ y: Int) -> Bool {
    for i in 0..<y {
        if x == queen[i] || y - i == x - queen[i] || y - i == queen[i] - x {
            return false
        }
    }
    return true
}

while y >= 0 {
    if y == n {
        count += queen[0] < n / 2 ? 2 : 1
        y -= 1
        x = queen.removeLast() + 1
    } else if y == 0 && x > (n - 1) / 2 {
        break
    } else if x == n {
        y -= 1
        x = queen.removeLast() + 1
    } else if isSafe(x, y) {
        queen.append(x)
        x = 0
        y += 1
    } else {
        x += 1
    }
}

print(count)
