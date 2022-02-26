//
//  Double+round.swift
//  NeuroApp
//
//  Created by Nikita Gras on 26.02.2022.
//

import Foundation

extension Double {
    func round(_ digitCount: Int) -> Double {
        let multiplier: Double = pow(10, Double(digitCount))
        return (self * multiplier).rounded() / multiplier
    }
}
