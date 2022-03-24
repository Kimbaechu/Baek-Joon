//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/23.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let target = readLine()!.split(separator: " ").map { Int(String($0))! }
    let test = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let index = target[1]
    var queue = test.enumerated().map { ($0.offset, $0.element) }
    var count = 0
    
    while true {
        if queue[0].1 == queue.map({ $0.1 }).max() {
            count += 1
            if queue[0].0 == index {
                print(count)
                break
            } else {
                queue.removeFirst()
            }
        } else {
            queue.append(queue.removeFirst())
        }
    }
}
