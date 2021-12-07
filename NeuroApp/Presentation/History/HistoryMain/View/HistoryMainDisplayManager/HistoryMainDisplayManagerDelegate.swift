//
//  HistoryMainDisplayManagerDelegate.swift
//  NeuroApp
//
//  Created by Nikita Gras on 07.12.2021.
//

import Foundation

protocol HistoryMainDisplayManagerDelegate: AnyObject {
    func displayManager(_ displayManger: HistoryMainDisplayManager, didSelectResult result: Result)
}
