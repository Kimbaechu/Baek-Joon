//
//  1946 신입 사원.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/06/07.
//

import Foundation

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

let io = FileIO()
let t = io.readInt()

for _ in 0..<t {
    let n = io.readInt()
    var arr = Array(repeating: 0, count: n)

    for _ in 0..<n {
        arr[io.readInt()-1] = io.readInt()
    }

    var result = 1
    var minRank = arr[0]
    for i in 1..<n {
        if arr[i] < minRank {
            result += 1
            minRank = arr[i]
        }
    }
    print(result)
}
