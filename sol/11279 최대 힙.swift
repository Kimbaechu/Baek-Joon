//
//  11279 최대 힙.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

var heap = [Int]()

func insert(_ x: Int) {
    heap.append(x)
    var i = heap.count-1
    while i != 0, x < heap[(i-1)/2] {
        heap.swapAt(i, (i-1)/2)
        i = (i-1)/2
    }
}

func remove() -> Int? {
    if heap.isEmpty {
        return nil
    } else if heap.count == 1 {
        return heap.removeLast()
    } else {
        let min = heap[0]
        heap[0] = heap.removeLast()
        var root = 0
        
        while true {
            var left = root*2+1
            let right = left+1
            if right <= heap.count-1 && heap[left] > heap[right] {
                left += 1
            }
            if left > heap.count-1 || heap[root] < heap[left] {
                break
            }
            heap.swapAt(root, left)
            root = left
        }
        
        return min
    }
}

let n = Int(readLine()!)!
var result = [Int]()

for _ in 0..<n {
    let x = Int(("-"+readLine()!))!
    
    if x == 0 {
        if let min = remove() {
            result.append(min)
        } else {
            result.append(0)
        }
    } else {
        insert(x)
    }
}
result.forEach { print(-$0) }
