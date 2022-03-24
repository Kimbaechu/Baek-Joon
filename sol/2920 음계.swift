//
//  main.swift
//  Algorithm
//
//  Created by KwonBeomcheol on 2022/03/22.
//

import Foundation

let nums = readLine()!.split(separator: " ").map { Int($0)! }

if nums.sorted(by: <) == nums {
    print("ascending")
} else if nums.sorted(by: >) == nums {
    print("descending")
} else {
    print("mixed")
}
