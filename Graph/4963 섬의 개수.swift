//
//  4963 섬의 개수.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/06/22.
//

import Foundation

while let l = readLine(), l != "0 0" {
    let wh = l.split(separator: " ").map { Int(String($0))! }
    let (w, h) = (wh[0], wh[1])
    var arr = [[Int]]()
    
    for _ in 0..<h {
        arr.append(readLine()!.split(separator: " ").map { Int(String($0))!} )
    }
    
    var res = 0
    let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
    let dy = [-1, 0, 1, -1, 1, -1, 0, 1]
    func s(_ r: Int, _ c: Int) {
        let (x, y) = (r, c)
        
        for i in 0..<8 {
            let (nx, ny) = (x+dx[i], y+dy[i])
            if (0..<h).contains(nx) && (0..<w).contains(ny) && arr[nx][ny] == 1 {
                arr[nx][ny] = 0
                s(nx, ny)
            }
        }
    }
    
    for j in 0..<h {
        for i in 0..<w {
            if arr[j][i] == 1 {
                arr[j][i] = 0
                s(j, i)
                res += 1
            }
        }
    }
    print(res)
}
