//
//  1715 카드 정렬하기.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

import Foundation

var heap = [Int]()

func insert(_ num: Int) {
    heap.append(num)
    var i = heap.count-1
    while i != 0, num < heap[(i - 1)/2] {
        heap.swapAt(i, (i - 1)/2)
        i = (i - 1)/2
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
            var left = root*2 + 1
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

while heap.count != 1 {
    let a = remove() ?? 0
    let b = remove() ?? 0
    let sum = a + b
    result += sum
    insert(sum)
}
print(result)
