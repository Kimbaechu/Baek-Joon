//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/24.
//

import Foundation

let i = readLine()!.split(separator: " ").map { Int($0)! }
let N = i[0]
let X = i[1]
let Y = i[2]
var result = 0
solve(n: Int(pow(2, Double(N))), x: 0, y: 0)

func solve(n: Int, x: Int, y: Int) {
    if x == X && y == Y {
        print(result)
        return
    }
    
    if !(x <= X && X < x + n && y <= Y && Y < y + n) {
        result += n * n
        return
    }

    solve(n: n / 2, x: x, y: y)
    solve(n: n / 2, x: x, y: y + n / 2)
    solve(n: n / 2, x: x + n / 2, y: y)
    solve(n: n / 2, x: x + n / 2, y: y + n / 2)
}
