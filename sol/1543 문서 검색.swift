//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/25.
//

import Foundation

var doc = readLine()!
let word = readLine()!
var index = doc.range(of: word)?.upperBound
var count = 0

while index != nil {
    count += 1
    doc = String(doc[index!...])
    index = doc.range(of: word)?.upperBound
}
print(count)
