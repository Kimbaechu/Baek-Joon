//
//  17413 단어 뒤집기 2.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/21.
//

import Foundation

let S = readLine()!
var stack = [Character]()
var reversed = false
var closed = false
var temp = [Character]()

for c in S {
    if c == "<" || closed {
        useTemp()
        stack.append(c)
        if c == ">" {
            closed = false
        } else {
            closed = true
        }
    } else if c == " " {
       useTemp()
        stack.append(c)
    } else {
        temp.append(c)
        reversed = true
    }
}
useTemp()
func useTemp() {
    if !temp.isEmpty {
        stack.append(contentsOf: temp.reversed())
        temp = []
        reversed = false
    }
}
print(String(stack))

