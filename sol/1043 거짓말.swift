//
//  1043 거짓말.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/08.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
var m = nm[1]
var parent = [0]
for i in 1...n {
    parent.append(i)
}

func get(_ x: Int) -> Int {
    if parent[x] == x { return x }
    return get(parent[x])
}

func union(_ x: Int, _ y: Int) {
    let px = get(x)
    let py = get(y)
    
    if px < py {
        parent[py] = px
    } else {
        parent[px] = py
    }
}

func find(_ x: Int, _ y: Int) -> Bool {
    return get(x) == get(y)
}

let known = readLine()!.split(separator: " ").map { Int(String($0))! }
var parties: [[Int]] = []
for _ in 0..<m {
    let p = readLine()!.split(separator: " ").map { Int(String($0))! }
    parties.append(p)
    for i in 1...p[0] {
        union(p[1], p[i])
    }
}

let kCount = known[0]
if kCount == 0 {
    print(m)
} else {
    for i in 1...kCount {
        union(known[1], known[i])
    }
    
    for p in parties {
        if find(known[1], p[1]) {
            m -= 1
        }
    }
    print(m)
}
