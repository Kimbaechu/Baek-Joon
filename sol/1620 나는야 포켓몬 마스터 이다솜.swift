//
//  1620 나는야 포켓몬 마스터 이다솜.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/30.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
var names: [String] = []
var book: [String: Int] = [:]

for i in 0..<nm[0] {
    let name = readLine()!
    names.append(name)
    book[name] = i + 1
}

for _ in 0..<nm[1] {
    let q = readLine()!
    if let num = Int(q) {
        print(names[num - 1])
    } else {
        print(book[q]!)
    }
}
