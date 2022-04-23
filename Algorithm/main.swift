//
//  main.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/03/25.
//

import Foundation

struct Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        
        while index > 0 , sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func remove() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let result = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            let children = [leftChild, rightChild]
                .filter{$0 < nodes.count && sort(nodes[$0], nodes[index])}
                .sorted{sort(nodes[$0], nodes[$1])}
            
            if children.isEmpty {
                break
            }
            
            nodes.swapAt(index, children[0])
            index = children[0]
        }
        
        return result
    }
}

var heap = [Data]()

func insert(_ num: Data) {
    if heap.isEmpty {
        heap.append(Data(cost: Int.max, node: -1))
    }
    heap.append(num)
    var index = heap.count-1
    while index != 1 && num < heap[index/2] {
        heap.swapAt(index, index/2)
        index /= 2
    }
}

func remove() -> Data? {
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


struct Data: Comparable {
    let cost: Int
    let node: Int
    
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let ve = readLine()!.split(separator: " ").map { Int($0)! }
var (v, e) = (ve[0], ve[1])
let k = Int(readLine()!)!

var graph = Array(repeating: [(Int,Int)](), count: v+1)

for _ in 0..<e {
    let uvw = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u].append((v, w))
}

func dijkstra(start: Int) -> [Int] {
    var totalCost = Array(repeating: Int.max, count: v+1)
    totalCost[start] = 0

    insert(Data(cost: 0, node: start))
    
    while heap.count > 1 {
        let current = remove()!
        let (node, cost) = (current.node, current.cost)
        
        if totalCost[node] >= cost {
            for (aNode, aCost) in graph[node] {
                let nCost = cost + aCost
                if nCost < totalCost[aNode] {
                    totalCost[aNode] = nCost
                    insert(Data(cost: nCost, node: aNode))
                }
            }
        }
    }
    
    return totalCost
}

let result = dijkstra(start: k)
for i in 1..<result.count {
    print(result[i] == Int.max ? "INF" : result[i])
}
