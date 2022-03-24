//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/25.
//

import Foundation

for _ in 0..<Int(readLine()!)! {
    var list: [[String]] = []
    let n = Int(readLine()!)!
    recursive(array: [], n: n-1)
    
    let numbers = Array(1...n)
    
    for op in list {
        var str = ""
        for i in 0..<n-1 {
            str += String(numbers[i]) + op[i]
        }
        str += String(numbers.last!)
        if eval(str: str) == 0 {
            print(str)
        }
    }
   
    func recursive(array: [String], n: Int) {
        var array = array
        if array.count == n {
            list.append(array)
            return
        }
        array.append(" ")
        recursive(array: array, n: n)
        _ = array.popLast()
        
        array.append("+")
        recursive(array: array, n: n)
        _ = array.popLast()
        
        array.append("-")
        recursive(array: array, n: n)
        _ = array.popLast()
    }
print("")
}

func eval(str: String) -> Int {
    let x = str.replacingOccurrences(of: " ", with: "")
    
    var cal: [Character] = ["+"]
    var num: [Int] = []
    for c in x {
        if !c.isNumber {
            cal.append(c)
        }
    }
    
    let y = x.components(separatedBy: ["+", "-"])
    for c in y {
        Int(c).map { num.append($0) }
    }
    
    var result = 0
    for i in 0..<cal.count {
        if cal[i] == "+" {
            result += num[i]
        } else {
            result -= num[i]
        }
    }
    
    return result
}
