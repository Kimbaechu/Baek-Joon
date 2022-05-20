//
//  1212 8진수 2진수.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/20.
//

import Foundation

let n = readLine()!.map { Int(String($0))! }
var result = ""
let arr = ["000", "001", "010", "011", "100", "101", "110", "111"]

for i in n {
    result += arr[i]
}

if let i = result.firstIndex(of: "1") {
    print(result[i..<result.endIndex])
} else {
    print("0")
}
