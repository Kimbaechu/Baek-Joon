//
//  15650 N과 M (2).swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/18.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }

func makeSeries(_ n: Int, _ m: Int, _ start: Int, _ result: [Int]) {
    if m == 0 {
        result.forEach { print($0, terminator: " ") }
        print()
        return
    }
    
    for i in start...(n - m + 1) {
        var tmp = result
        tmp.append(i)
        makeSeries(n, m - 1, i + 1, tmp)
    }
}

makeSeries(nm[0], nm[1], 1, [])
