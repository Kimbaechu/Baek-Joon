//
//  1918 후위 표기식.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/01.
//

import Foundation

let input = Array(readLine()!)
var result = ""
var stack = [Character]()

for c in input {
    if c.isUppercase {
        result += String(c)
    } else {
        switch c {
        case "(":
            stack.append(c)
        case "*", "/":
            while !stack.isEmpty && (stack.last == "*" || stack.last == "/") {
                result += String(stack.removeLast())
            }
            stack.append(c)
        case "+", "-":
            while !stack.isEmpty && stack.last != "(" {
                result += String(stack.removeLast())
            }
            stack.append(c)
        case ")":
            while !stack.isEmpty && stack.last != "(" {
                result += String(stack.removeLast())
            }
            stack.removeLast()
        default:
            break
        }
    }
}

while !stack.isEmpty {
    result += String(stack.removeLast())
}

print(result)
