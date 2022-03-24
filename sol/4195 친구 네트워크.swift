//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/24.
//

import Foundation

//Union-Find 알고리즘

let n = Int(readLine()!)!

for _ in 0..<n {
    let m = Int(readLine()!)!
    var parent: [String: String] = [:]
    var number: [String: Int] = [:]
    
    for _ in 0..<m {
        let data = readLine()!.split(separator: " ").map { String($0) }
        let x = data[0]
        let y = data[1]
        
        if !parent.keys.contains(x) {
            parent[x] = x
            number[x] = 1
        }
        if !parent.keys.contains(y) {
            parent[y] = y
            number[y] = 1
        }
        
        union(x, y)
        print(number[find(x)]!)
    }
    
    func find(_ x: String) -> String {
        if parent[x] == x {
            return x
        } else {
            let p = find(parent[x]!)
            parent[x] = p
            return parent[x]!
        }
    }
    
    func union(_ x: String, _ y: String) {
        let x = find(x)
        let y = find(y)
        
        if x != y {
            parent[y] = x
            number[x]! += number[y]!
        }
    }
}
