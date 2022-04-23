//
//  16953 A->B.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/23.
//

import Foundation

let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
var (a, b) = (ab[0], ab[1])
var cnt = 1

while a < b {
    if b % 2 == 0 {
        b /= 2
    } else if b%10 == 1 {
        b /= 10
    } else {
        break
    }
    cnt += 1
}

if a == b {
    print(cnt)
} else {
    print(-1)
}
