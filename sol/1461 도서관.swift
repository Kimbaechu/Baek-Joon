//
//  1461 도서관.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/29.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let books = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var n = nm[0]
let k = nm[1]

var positive: [Int] = []
var negative: [Int] = []

let large = max(books.max()!, -books.min()!)

for i in 0..<n {
    if books[i] < 0 {
        negative.append(-books[i])
    } else {
        positive.append(books[i])
    }
}
negative.sort()

func sol(arr: [Int]) -> Int {
    var result = 0
    var arr = arr
    while !arr.isEmpty {
        result += arr.last!
        
        for _ in 0..<k {
            _ = arr.popLast()
        }
    }
    return result
}
let distance = sol(arr: positive) + sol(arr: negative)
print(distance * 2 - large)

