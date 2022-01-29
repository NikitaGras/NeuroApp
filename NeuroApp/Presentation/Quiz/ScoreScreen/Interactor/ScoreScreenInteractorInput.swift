//
//  ScoreScreenScoreScreenInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol ScoreScreenInteractorInput {
    func getResult()throws -> Session
    func changeQuize(to state: Quiz.State)
}
