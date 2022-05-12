//
//  5052 전화번호 목록.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/12.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var words = [String]()
    var flag = true

    for _ in 0..<n {
        words.append(readLine()!)
    }
    words.sort()

    for i in 0..<n-1 {
        if words[i+1].hasPrefix(words[i]) {
            flag = false
            break
        }
    }
    print(flag ? "YES" : "NO")
}
