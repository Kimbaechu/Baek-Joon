//
//  1766 문제집.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/06.
//

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

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]

var indegree = Array(repeating: 0, count: n+1)
var arr = Array(repeating: [Int](), count: n+1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = ab[0]
    let b = ab[1]
    indegree[b] += 1
    arr[a].append(b)
}

var visited = [Int]()

for i in 1...n where indegree[i] == 0 {
    insert(i)
}

while !heap.isEmpty {
    let min = remove()!
    visited.append(min)
    for next in arr[min] {
        indegree[next] -= 1
        if indegree[next] == 0 {
            insert(next)
        }
    }
}

visited.forEach { print($0, terminator: " ") }

