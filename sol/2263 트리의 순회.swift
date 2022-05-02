//
//  2263 트리의 순회.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/02.
//

import Foundation

let n = Int(readLine()!)!
let inO = readLine()!.split(separator: " ").map { Int(String($0))! }
let postO = readLine()!.split(separator: " ").map { Int(String($0))! }
var idx = Array(repeating: 0, count: n+1)
var s = 0
inO.forEach {
    idx[$0] = s
    s += 1
}

var ans = ""
func find(_ il: Int, _ ir: Int, _ pl: Int, _ pr: Int ) {
    if il > ir {
        return
    }
    let root = postO[pr]
    ans += "\(postO[pr]) "
    let rootIndex = idx[root]
    
    find(il, rootIndex-1, pl, pl+(rootIndex-il-1))
    find(rootIndex+1, ir, pl+(rootIndex-il), pr-1)
}

find(0, n-1, 0, n-1)
print(ans)
