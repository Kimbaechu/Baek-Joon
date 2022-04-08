//
//  5525 IOIO.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation

let n = Int(readLine()!)!
let len = Int(readLine()!)!
let arr = readLine()!.map { $0 }
var oCount = 0
var result = 0
var i = 1

while i < len - 1 {
    if arr[i - 1] == "I" && arr[i] == "O" && arr[i + 1] == "I" {
        oCount += 1
        if oCount == n {
            oCount -= 1
            result += 1
        }
        i += 2
    } else {
        oCount = 0
        i += 1
    }
}
print(result)
