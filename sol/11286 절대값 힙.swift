//
//  11286 절대값 힙.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/08.
//

import Foundation


var heap = [(Int, Int)]()

func insert(_ num: (Int, Int)) {
    if heap.isEmpty {
        heap.append((0, 0))
    }
    heap.append(num)
    var index = heap.count-1
    while index != 1 && num < heap[index/2] {
        heap.swapAt(index, index/2)
        index /= 2
    }
}

func remove() -> (Int, Int)? {
    if heap.isEmpty || heap.count == 1 {
        return nil
    } else if heap.count == 2 {
        return heap.removeLast()
    } else {
        let min = heap[1]
        heap[1] = heap.removeLast()
        var root = 1
        
        while true {
            var left = root*2
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

var result: [Int] = []
for _ in 0..<Int(readLine()!)! {
    let x = Int(readLine()!)!
    
    if x == 0 {
        if let min = remove() {
            result.append(min.0 * min.1)
        } else {
            result.append(0)
        }
    } else if x > 0 {
        insert((x, 1))
    } else {
        insert((-x, -1))
    }
}
result.forEach { print($0) }
