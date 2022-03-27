//
//  1764 듣보잡.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/27.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var set1: Set<String> = []
var set2: Set<String> = []

for _ in 0..<input[0] {
    set1.insert(readLine()!)
}

for _ in 0..<input[1] {
    set2.insert(readLine()!)
}

let result = set1.intersection(set2).sorted()
print(result.count)
result.forEach { print($0) }
