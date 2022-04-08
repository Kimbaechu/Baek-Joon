//
//  11403 경로찾기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation

let n = Int(readLine()!)!
var adj = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    adj[i] = data
}


for mid in 0..<n {
    for from in 0..<n {
        
        if adj[from][mid] != 0 {
            
            for to in 0..<n {
                
                if adj[mid][to] != 0 {
                    if adj[from][to] == 0 {
                        adj[from][to] = 1
                    }
                }
                
            }
            
        }
        
    }
}

for i in 0..<n {
    var result = ""
    for j in 0..<n {
        result += "\(adj[i][j]) "
    }
    
    print(result)
}
