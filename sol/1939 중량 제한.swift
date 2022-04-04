//
//  1939 중량 제한.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/04.
//

import Foundation

struct Queue<T> {
    var left: [T] = []
    var right: [T] = []

    var last: T? {
        !left.isEmpty ? left.last : right.first
    }

    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }

    mutating func push(_ element: T) {
        right.append(element)
    }

    mutating func pop() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}


let i = readLine()!.split(separator: " ").map{ Int($0)! }
let n = i[0]
let m = i[1]

var visited: [Bool] = Array(repeating: false, count: n + 1)
var graph: [[(Int, Int)]] = Array(repeating: [(Int, Int)](), count: n + 1)
var low = 1
var high = 0

for _ in 0..<m {
    let data = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[data[0]].append((data[1], data[2]))
    graph[data[1]].append((data[0], data[2]))

    if data[2] > high {
        high = data[2]
    }
}

let ab = readLine()!.split(separator: " ").map { Int($0)! }

let start = ab[0]
let end = ab[1]

func resetVisit() {
    for i in 1...n {
        visited[i] = false
    }
}

func bfs(_ u: Int, _ w: Int) -> Bool {

    var queue = Queue<Int>()
    queue.push(u)

    while !queue.isEmpty {
        let now = queue.pop()!
        if now == end {
            return true
        }

        for (next, limit) in graph[now] {
            if !visited[next] && limit >= w {
                visited[next] = true
                queue.push(next)
            }
        }
    }
    return false
}

var mid = (low + high) / 2

while low <= high {
    var possible = false
    resetVisit()

    possible = bfs(start, mid)

    if possible {
        low = mid + 1
    } else {
        high = mid - 1
    }
    mid = (low + high) / 2
}

print(mid)

