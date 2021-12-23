//
//  AverageHistoryDisplayMangerDelegate.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23.12.2021.
//

import Foundation

protocol AverageHistoryDisplayManagerDelegate {
    func didSelectPartOneRow(_ displayManager: AverageHistoryDisplayManager)
    func didSelectPartTwoRow(_ displayManager: AverageHistoryDisplayManager)
    func didSelectPartThreeRow(_ displayManager: AverageHistoryDisplayManager)
}
