//
//  11656 접미사 배열.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/22.
//

import Foundation

let S = readLine()!
var arr = [String]()
for i in S.indices {
    arr.append(String(S[i..<S.endIndex]))
}
arr.sorted().forEach { print($0) }
