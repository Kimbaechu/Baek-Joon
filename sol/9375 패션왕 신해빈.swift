//
//  9375 패션왕 신해빈.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var dic = [String: Int]()
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { String($0) }
        dic[line[1], default: 1] += 1
    }
    print(dic.reduce(1) { $0 * $1.value }-1)
}
