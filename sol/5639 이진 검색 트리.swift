//
//  5639 이진 검색 트리.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/04.
//

import Foundation

var arr = [Int]()
while let t = readLine() {
    if t == "" {
        break
    }
    arr.append(Int(t)!)
}

func post(_ h: Int, _ t: Int) {
    if h >= t { return }
    let i = bs(h+1, t, arr[h])
    post(h+1, i)
    post(i, t)
    
    print(arr[h])
}

func bs(_ h: Int, _ t: Int, _ c: Int) -> Int {
    var (h, t) = (h, t)
    
    while h < t {
        let m = (h+t)/2
        if c < arr[m] {
            t = m
        } else {
            h = m+1
        }
    }
    return h
}
post(0, arr.count)
