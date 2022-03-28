//
//  17219 비밀번호 찾기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/28.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
var dic: [String: String] = [:]
for _ in 0..<nm[0] {
    let line = readLine()!.split(separator: " ").map { String($0) }
    dic[line[0]] = line[1]
}
for _ in 0..<nm[1] {
    print(dic[readLine()!]!)
}
