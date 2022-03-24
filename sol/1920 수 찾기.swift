//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/23.
//

import Foundation

let n = Int(readLine()!)!
let set = Set(readLine()!.split(separator: " ").map { Int($0)! })
let m = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }

for i in x {
    if set.contains(i) {
        print("1")
    } else {
        print("0")
    }
}
