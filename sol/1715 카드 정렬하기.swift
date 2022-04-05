//
//  1715 카드 정렬하기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

var heap = [Int]()

func insert(_ num: Int) {
    if heap.isEmpty {
        heap.append(-1)
    }
    heap.append(num)
    var i = heap.count-1
    while i != 1, num < heap[i/2] {
        heap.swapAt(i, i/2)
        i /= 2
    }
}

func remove() -> Int? {
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

let n = Int(readLine()!)!
var result = 0
for _ in 0..<n {
    insert(Int(readLine()!)!)
}

while heap.count != 2 {
    let a = remove() ?? 0
    let b = remove() ?? 0
    let sum = a + b
    result += sum
    insert(sum)
}
print(result)
