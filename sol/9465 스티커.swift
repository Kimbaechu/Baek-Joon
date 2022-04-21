//
//  9465 스티커.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/22.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    arr.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
    arr.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
    if n == 1 {
        print(max(arr[0][0], arr[1][0]))
        continue
    }
    var sum = Array(repeating: Array(repeating: 0, count: n), count: 2)
    sum[0][0] = arr[0][0]
    sum[1][0] = arr[1][0]
    sum[0][1] = sum[1][0] + arr[0][1]
    sum[1][1] = sum[0][0] + arr[1][1]
    for i in 2..<n {
        sum[0][i] = max(sum[1][i-1], sum[1][i-2]) + arr[0][i]
        sum[1][i] = max(sum[0][i-1], sum[0][i-2]) + arr[1][i]
    }
    print(max(sum[0][n-1], sum[1][n-1]))
}
