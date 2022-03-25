//
//  1302 베스트셀러.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

var n = Int(readLine()!)!
var dic: [String: Int] = [:]
for _ in 0..<n {
    let book = readLine()!
    dic[book, default: 0] += 1
}
print(dic.filter { $0.value == dic.values.max() }.sorted { $0.key < $1.key }.first!.key)
