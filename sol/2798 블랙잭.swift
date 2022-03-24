//
//  블랙잭.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let data = readLine()!.split(separator: " ").map { Int($0)! }

var count = data.count
var result = 0

for i in 0..<count {
    for j in i+1..<count {
        for k in j+1..<count {
            let sum = data[i] + data[j] + data[k]
            if sum <= input[1] {
                result = max(result, sum)
            }
        }
    }
}

print(result)
