//
//  5430 AC.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/11.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let orders = readLine()!
    let n = Int(readLine()!)!
    let arr = readLine()!.dropFirst().dropLast().split(separator: ",").map{ Int(String($0))! }

    var head = 0
    var tail = n-1
    var isReversed = false
    var isError = false

    for order in orders {
        if order == "D" {
            if head > tail {
                isError = true
                break
            }
            if isReversed {
                tail -= 1
            } else {
                head += 1
            }
        } else {
            isReversed.toggle()
        }
    }

    if isError {
        print("error")
    } else if head > tail {
        print("[]")
    } else {
        if isReversed {
            print("["+arr[head...tail].reversed().map{String($0)}.joined(separator: ",")+"]")
        } else {
            print("["+arr[head...tail].map{String($0)}.joined(separator: ",")+"]")
        }
    }
}
