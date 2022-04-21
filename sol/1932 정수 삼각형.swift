//
//  1932 정수 삼각형.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/21.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n)

for _ in 0..<n {
    let nums = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    var temp = arr
    for i in 0..<nums.count {
        if i == 0 {
            temp[i] = nums[i] + arr[0]
        } else {
            temp[i] = nums[i] + max(arr[i], arr[i-1])
        }
    }
    arr = temp
}
print(arr.max()!)
