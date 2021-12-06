//
//  QuizPartThreeQuizPartThreeInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol QuizPartThreeInteractorInput {
    func getQuestion() -> PartThreeQuestion
    func save(userText: String)
    
    func getPriviousPartQuestionsNumber() -> Int
}
