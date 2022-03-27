//
//  11723 집합.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/27.
//

import Foundation

var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}

@inline(__always) func readStirngSum() -> Int {
    var byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    var sum = Int(byte)
    while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
    return sum - Int(byte)
}

@inline(__always) func writeByBytes(_ output: [UInt8]) {
    FileHandle.standardOutput.write(Data(bytes: output, count: output.count * MemoryLayout<UInt8>.stride))
}

var bool = Array(repeating: false, count: 21)
let full = Array(repeating: true, count: 21)
let empty = Array(repeating: false, count: 21)
var output = [UInt8]()

(1...readInt()).forEach { _ in
    switch readStirngSum() {
    case 297:
        bool[readInt()] = true
        break
    case 654:
        bool[readInt()] = false
        break
    case 510:
        output.append(bool[readInt()] ? 49 : 48)
        output.append(32)
        break
    case 642:
        bool[readInt()].toggle()
        break
    case 313:
        bool = full
        break
    default:
        bool = empty
        break
    }
}

writeByBytes(output)
