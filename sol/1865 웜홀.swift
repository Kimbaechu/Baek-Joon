//
//  1865 웜홀.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/01.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let nmw = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m, w) = (nmw[0], nmw[1], nmw[2])
    var graph = [[(Int, Int)]](repeating: [], count: n+1)
    
    for _ in 0..<m {
        let set = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[set[0]].append((set[1], set[2]))
        graph[set[1]].append((set[0], set[2]))
    }
    
    for _ in 0..<w {
        let set = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[set[0]].append((set[1], -set[2]))
    }
    
    var isEnabled = false
    var costs = [Int](repeating: 0, count: n+1)
    
    for _ in 0..<n {
        isEnabled = false
        for dep in 1...n {
            for (dest, cost) in graph[dep] {
                if costs[dest] > costs[dep] + cost {
                    costs[dest] = costs[dep] + cost
                    isEnabled = true
                }
            }
        }
        
        if !isEnabled { break }
    }
    
    if isEnabled {
        print("YES")
    } else {
        print("NO")
    }
}
