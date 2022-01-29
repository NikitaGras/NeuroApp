//
//  HistoryMainHistoryMainInteractorOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol HistoryMainInteractorOutput: AnyObject {
    func update(with history: [Session])
}
