//
//  main.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

let plus = readLine()!.split(separator: "-").map { String($0) }
var sum = [Int]()
for str in plus {
    sum.append(str.split(separator: "+").map { Int(String($0))! }.reduce(0, +))
}
print(sum.reduce(0, -) + sum[0]*2)
