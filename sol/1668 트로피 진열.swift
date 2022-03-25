//
//  1668 트로피 진열.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/26.
//

import Foundation

var n = Int(readLine()!)!
var numbers: [Int] = []
for _ in 0..<n {
    numbers.append( Int(readLine()!)!)
}

func sol(_ array: [Int]) -> Int {
    var count = 1
    var front = array[0]
    for i in 1..<array.count {
        if front < array[i] {
            count += 1
            front = array[i]
        }
    }
    return count
}

print(sol(numbers))
print(sol(numbers.reversed()))
