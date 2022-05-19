//
//  2193 이친수.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/19.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: 0, count: 2), count: 91)
arr[1][0] = 0
arr[1][1] = 1
arr[2][0] = 1
arr[2][1] = 0
if n > 2 {
    for i in 3...n {
        arr[i][0] = arr[i-1][0]+arr[i-1][1]
        arr[i][1] = arr[i-1][0]
    }
}
print(arr[n][0]+arr[n][1])
