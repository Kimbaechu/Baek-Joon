//
//  2250 트리의 높이와 너비.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/05.
//

import Foundation

struct Node {
    var parent = -1
    var data: Int
    var leftNode: Int
    var rightNode: Int
}

func inOrder(_ node: Node, level: Int) {
    levelDepth = max(levelDepth, level)
    
    if node.leftNode != -1, node.data != -1 {
        inOrder(tree[node.leftNode]!, level: level + 1)
    }
    
    levelMin[level] = min(levelMin[level], x)
    levelMax[level] = max(levelMax[level], x)
    x += 1
    
    if node.rightNode != -1, node.data != -1 {
        inOrder(tree[node.rightNode]!, level: level + 1)
    }
}

let n = Int(readLine()!)!
var tree: [Int: Node] = [:]
var root = -1
var x = 1
var levelDepth = 1
var levelMin = [n]
var levelMax = [0]

for i in 1..<n + 1 {
    tree[i] = Node(data: i, leftNode: -1, rightNode: -1)
    levelMin.append(n)
    levelMax.append(0)
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let data = input[0]
    let leftNode = input[1]
    let rightNode = input[2]
    tree[data]?.leftNode = leftNode
    tree[data]?.rightNode = rightNode
    
    if leftNode != -1 {
        tree[leftNode]?.parent = data
    }
    if rightNode != -1 {
        tree[rightNode]?.parent = data
    }
}

for i in 1..<n + 1 {
    if tree[i]?.parent == -1 {
        root = i
    }
    
}

inOrder(tree[root]!, level: 1)

var resultLevel = 1
var resultWidth = levelMax[1] - levelMin[1] + 1
for i in 2..<levelDepth + 1 {
    let width = levelMax[i] - levelMin[i] + 1
    if resultWidth < width {
        resultLevel = i
        resultWidth = width
    }
}

print(resultLevel, resultWidth)

