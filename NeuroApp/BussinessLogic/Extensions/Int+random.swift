//
//  Int+random.swift
//  NeuroApp
//
//  Created by Nikita Gras on 01.02.2022.
//

import Foundation

extension Int {
    static func random(in range: ClosedRange<Int>, count: UInt, excluded: Int) -> [Int] {
        var nums: [Int] = []
        for _ in 0..<count {
            var excludedArr = nums
            excludedArr.append(excluded)
            let random = Int.random(in: range, exludedArr: excludedArr)
            nums.append(random)
        }
        return nums
    }
    
    static func random(in range: ClosedRange<Int>, exludedArr: [Int]) -> Int {
        let random = Int.random(in: range)
        if exludedArr.contains(random) {
            return Int.random(in: range, exludedArr: exludedArr)
        } else {
            return random
        }
    }
}
