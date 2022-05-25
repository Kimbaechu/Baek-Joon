//
//  14425 문자열 집합.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var S = Set<String>()
var M = [String]()

for _ in 0..<nm[0] {
    S.insert(readLine()!)
}

for _ in 0..<nm[1] {
    M.append(readLine()!)
}

var count = 0
for m in M {
    if S.contains(m) {
        count += 1
    }
}

print(count)
