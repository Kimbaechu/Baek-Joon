//
//  1629 곱셈.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/21.
//

import Foundation

let abc = readLine()!.split(separator : " " ).map { Int($0)! }
let a = abc[0]
let b = abc[1]
let c = abc[2]

func dfs(_ i: Int) -> Int  {
    if i == 1 { return a % c }

    if i % 2 == 0 {
        let d = dfs(i/2)
        return d % c * d % c
    } else {
        let d = dfs((i-1)/2)
        return d % c * d % c * a % c
    }
}
print(dfs(b))
