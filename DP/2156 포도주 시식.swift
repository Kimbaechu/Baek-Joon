//
//  File.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/13.
//

import Foundation

let n = Int(readLine()!)!
var arr = [0, 0, 0]
arr[0] = Int(readLine()!)!

for _ in 1..<n {
    let a1 = Int(readLine()!)!
    let a2 = arr[2]
    
    arr[2] = max(arr[0], arr[1], arr[2])
    arr[1] = arr[0]+a1
    arr[0] = a1+a2
}

print(arr.max()!)
