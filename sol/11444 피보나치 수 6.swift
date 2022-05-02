//
//  11444 피보나치 수 6.swift
//  Algorithm
//
//  Created by Beomcheol Kwon on 2022/05/02.
//

import Foundation

let n = Int(readLine()!)!

func fibo(_ n: Int) -> [Int] {
    if n == 0 { return [0, 0, 0, 0] }
    if n == 1 { return [1, 1, 1, 0] }
    let a = fibo(n/2)
    let b = matrixMul(a, a)
    if n % 2 == 0 {
        return b
    } else {
        return matrixMul(b, [1, 1, 1, 0])
    }
}

func matrixMul(_ a: [Int], _ b: [Int]) -> [Int] {
    var c = [0,0,0,0]
    c[0] = (b[0]*a[0]+b[1]*a[2])%1000000007
    c[1] = (b[0]*a[1]+b[1]*a[3])%1000000007
    c[2] = (b[2]*a[0]+b[3]*a[2])%1000000007
    c[3] = (b[2]*a[1]+b[3]*a[3])%1000000007
    return c
}
print(fibo(n)[1])
