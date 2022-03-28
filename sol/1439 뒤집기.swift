//
//  1439 뒤집기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/28.
//

import Foundation

var s = readLine()!.map { $0 }
var count0 = 0
var count1 = 0
if s[0] == "1" {
    count0 += 1
} else {
    count1 += 1
}
for i in 0..<s.count-1 {
    if s[i] != s[i+1] {
        if s[i+1] == "1" {
            count0 += 1
        } else {
            count1 += 1
        }
    }
}
print(min(count0, count1))
