//
//  1991 트리 순회.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/04/05.
//

import Foundation

struct Node {
    let data: Character
    let leftNode: Character
    let rightNode: Character
}

var tree: [Character: Node] = [:]
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.map { $0 }
    tree[input[0]] = Node(data: input[0], leftNode: input[2], rightNode: input[4])
}

func preOrder(_ node: Node) {
    print(node.data, terminator: "")
    if node.leftNode != "." {
        preOrder(tree[node.leftNode]!)
    }
    if node.rightNode != "." {
        preOrder(tree[node.rightNode]!)
    }
}

func inOrder(_ node: Node) {
    if node.leftNode != "." {
        inOrder(tree[node.leftNode]!)
    }
    print(node.data, terminator: "")
    if node.rightNode != "." {
        inOrder(tree[node.rightNode]!)
    }
}

func postOrder(_ node: Node) {
    if node.leftNode != "." {
        postOrder(tree[node.leftNode]!)
    }
    if node.rightNode != "." {
        postOrder(tree[node.rightNode]!)
    }
    print(node.data, terminator: "")
}

let root = tree["A"]!
preOrder(root)
print()
inOrder(root)
print()
postOrder(root)

