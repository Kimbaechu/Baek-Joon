//
//  14502 연구소.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/09.
//

import Foundation

typealias P = (x: Int, y: Int)
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
let map = (0..<n).reduce(into: [Int]()) { (result, _) in
    result.append(contentsOf: readLine()!.split(separator: " ").map { Int(String($0))! })
}

var virus = 
var virusPoints = map.enumerated().compactMap { $0.element == 2 ? ($0.offset/m, $0.offset%m) : nil }

let dir = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var result = 0

func dfs(_ visited: inout [Int], _ point: P) {
    visited[point.x*m + point.y] = 2

    dir.forEach {
        let nPoint: P = (point.x + $0.0, point.y + $0.1)
        if 0..<n ~= nPoint.x && 0..<m ~= nPoint.y {
            let v = visited[nPoint.x*m + nPoint.y]
            if v == 0 {
                dfs(&visited, nPoint)
            }
        }
    }
}

let end = map.endIndex
for i in 0..<end {
    for j in (i+1)..<end {
        for k in (j+1)..<end {
            var visited = map
            if visited[i] == 0 && visited[j] == 0 && visited[k] == 0 {
                visited[i] = 1
                visited[j] = 1
                visited[k] = 1

                virusPoints.forEach { dfs(&visited, $0) }
                result = max(result, visited.filter { $0 == 0 }.count)

            }
        }
    }
}
print(result)
