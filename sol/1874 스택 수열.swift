//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/22.
//

//import Foundation

let n = Int(readLine()!)!

var count = 1
var stack: [Int] = []
var result: [String] = []
var flag = true
for _ in 0..<n {
    let data = Int(readLine()!)!
    while count <= data {
        stack.append(count)
        count += 1
        result.append("+")
    }
    if stack.last == data {
        stack.removeLast()
        result.append("-")
    } else {
        flag = false
        break
    }
}
if flag {
    result.forEach { print($0) }
} else {
    print("NO")
}
