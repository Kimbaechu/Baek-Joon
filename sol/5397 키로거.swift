//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/23.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let data = readLine()!
    
    var leftStack: [String] = []
    var rightStack: [String] = []
    
    for i in data {
        if i == "-" {
            _ = leftStack.popLast()
        } else if i == "<" {
            leftStack.popLast().map { rightStack.append($0) }
        } else if i == ">" {
            rightStack.popLast().map { leftStack.append($0) }
        } else {
            leftStack.append(String(i))
        }
    }
    leftStack.forEach { print($0, terminator: "") }
    rightStack.reversed().forEach { print($0, terminator: "") }
    print("")
}
