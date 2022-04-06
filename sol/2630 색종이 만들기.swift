//
//  2630 색종이 만들기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

var N = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var white = 0
var blue = 0

func sol(_ arr: [[Int]], _ n: Int) {
    if n == 1 {
        if arr[0][0] == 0 {
            white += 1
        } else {
            blue += 1
        }
        return
    }
    
    let colors = arr.flatMap { $0 }
    
    if colors.filter({ $0 == 0 }).count == n*n {
        white += 1
        return
    } else if colors.filter({ $0 == 1 }).count == n*n {
        blue += 1
        return
    } else {
        sol(slice(arr, 0, n/2, 0, n/2), n/2)
        sol(slice(arr, n/2, n, 0, n/2), n/2)
        sol(slice(arr, 0, n/2, n/2, n), n/2)
        sol(slice(arr, n/2, n, n/2, n), n/2)
    }
}

func slice(_ arr: [[Int]], _ w1: Int, _ w2: Int, _ h1: Int, _ h2: Int) -> [[Int]] {
    var result = [[Int]]()
    for i in w1..<w2 {
        result.append(Array(arr[i][h1..<h2]))
    }
    return result
    
}

sol(arr, N)

print(white)
print(blue)
