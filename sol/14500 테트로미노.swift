//
//  14500 테트로미노.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/17.
//

import Foundation

let nm = readLine()!.split(separator : " " ).map{Int($0)!}
let n = nm[0], m = nm[1]
var arr = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input)
}

var result = 0
var tetrominos: [[(y: Int, x:Int)]] = [
    [(0, 0), (1, 0), (2, 0), (3, 0)],
    [(0, 0), (0, 1), (0, 2), (0, 3)],
    [(0, 0), (0, 1), (1, 0), (1, 1)],
    [(0, 1), (1, 0), (1, 1), (1, 2)],
    [(0, 0), (1, 0), (1, 1), (2, 0)],
    [(0, 0), (0, 1), (0, 2), (1, 1)],
    [(0, 1), (1, 0), (1, 1), (2, 1)],
    [(0, 0), (1, 0), (2, 0), (2, 1)],
    [(0, 0), (1, 0), (0, 1), (0, 2)],
    [(0, 0), (0, 1), (1, 1), (2, 1)],
    [(0, 2), (1, 0), (1, 1), (1, 2)],
    [(0, 0), (0, 1), (1, 0), (2, 0)],
    [(0, 0), (0, 1), (0, 2), (1, 2)],
    [(0, 1), (1, 1), (2, 1), (2, 0)],
    [(0, 0), (1, 0), (1, 1), (1, 2)],
    [(0, 1), (1, 0), (1, 1), (2, 0)],
    [(0, 0), (0, 1), (1, 1), (1, 2)],
    [(0, 0), (1, 0), (1, 1), (2, 1)],
    [(0, 1), (0, 2), (1, 0), (1, 1)],
]

for r in arr.indices {
    for c in arr[r].indices {
        result = max(calculate((r, c)), result)
    }
}

func calculate(_ point: (y: Int, x: Int)) -> Int {
    var maxSum = 0
    
    for t in tetrominos {
        var sum = 0
        
        for (y, x) in t {
            let ny = point.y + y
            let nx = point.x + x
            
            guard ny >= 0, ny < n, nx >= 0, nx < m else {
                continue
            }
            sum += arr[ny][nx]
        }
        maxSum = max(sum, maxSum)
    }
    return maxSum
}

print(result)
