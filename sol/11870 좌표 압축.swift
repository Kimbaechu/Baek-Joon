//
//  11870 좌표 압축.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/30.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
let setArr = Set(arr).sorted()
var dic: [Int: Int] = [:]
var count = 0
for i in setArr {
    dic[i] = count
    count += 1
}

arr.map { dic[$0]! }.forEach { print($0, terminator: " ") }
