//
//  HistoryMainHistoryMainViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol HistoryMainViewInput: AnyObject {
    func setupInitialState()
    func setup(with history: [Session])
    func showEmptyHistory()
}
