//
//  main.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

let n = Int(readLine()!)!
var cranes = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var boxes = readLine()!.split(separator: " ").map { Int($0)! }

if cranes.max()! < boxes.max()! {
    print(-1)
} else {
    var positions = Array(repeating: 0, count: n)
    var checked = Array(repeating: false, count: m)
    
    cranes.sort(by: >)
    boxes.sort(by: >)
    
    var result = 0
    var count = 0
    
    while true {
        if count == m {
            break
        } else {
            for i in 0..<n {
                while positions[i] < m {
                    if !checked[positions[i]] && cranes[i] >= boxes[positions[i]] {
                        checked[positions[i]] = true
                        positions[i] += 1
                        count += 1
                        break
                    }
                    positions[i] += 1
                }
            }
            result += 1
        }
    }
    print(result)
}
