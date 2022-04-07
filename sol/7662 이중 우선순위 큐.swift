//
//  7662 이중 우선순위 큐.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/07.
//

import Foundation

struct Heap {
    var heap = [(Int, Int)]()

    var isEmpty: Bool {
        heap.isEmpty
    }
    
    mutating func insert(_ x: (Int, Int)) {
        heap.append(x)
        var i = heap.count-1
        while i != 0, x < heap[(i-1)/2] {
            heap.swapAt(i, (i-1)/2)
            i = (i-1)/2
        }
    }

    mutating func remove() -> (Int, Int)? {
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
}

for _ in 0..<Int(readLine()!)! {
    var minHeap = Heap()
    var maxHeap = Heap()
    var visited = Array(repeating: false, count: 1000001)

    for i in 0..<Int(readLine()!)! {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let cmd = input[0]
        let v = Int(input[1])!

        if cmd == "I" {
            minHeap.insert((v, i))
            maxHeap.insert((-v, i))
            visited[i] = true
        } else {
            if v > 0 {
                removeMaxHeap()
                maxHeap.remove().map { visited[$0.1] = false }
            } else {
                removeMinHeap()
                minHeap.remove().map { visited[$0.1] = false }
            }
        }
    }
    removeMinHeap()
    removeMaxHeap()

    func removeMaxHeap() {
        while !maxHeap.isEmpty && !visited[maxHeap.heap.first!.1] {
            _ = maxHeap.remove()
        }
    }
    
    func removeMinHeap() {
        while !minHeap.isEmpty && !visited[minHeap.heap.first!.1] {
            _ = minHeap.remove()
        }
    }
    
    if maxHeap.isEmpty {
        print("EMPTY")
    } else {
        print(-maxHeap.remove()!.0, minHeap.remove()!.0)
    }
}
