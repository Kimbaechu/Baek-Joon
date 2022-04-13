//
//  9091 DSLR.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/13.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = ab[0]
    let b = ab[1]
    
    let dslr: [Character] = ["D", "S", "L", "R"]
    var visited = Array(repeating: false, count: 10000)
    
    var queue: [(Int, Int)] = [(a, 0)]
    var index = 0
    visited[a] = true
    
    while true {
        let v = queue[index]
        let newA = v.0
        let newC = v.1
        
        index += 1
        if newA == b {
            let a = String(newC).map { dslr[Int(String($0))!-1] }
            print(String(a))
            break
        }
        var na = 0
        for i in 0..<4 {
            let c = dslr[i]
            if c == "D" {
                na = newA * 2 % 10000
            } else if c == "S" {
                na = newA == 0 ? 9999 : newA-1
            } else if c == "L" {
                na = (newA % 1000) * 10 + newA / 1000
            } else if c == "R" {
                na = (newA % 10) * 1000 + newA / 10
            }
            
            if !visited[na] {
                visited[na] = true
                queue.append((na, newC*10+i+1))
            }
        }
    }
}
