//
//  main.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 1..<n {
    if arr[i] < arr[i-1]+arr[i] {
        arr[i] += arr[i-1]
    }
}
print(arr.max()!)
