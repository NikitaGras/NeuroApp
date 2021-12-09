//
//  QuizPartThreeQuizPartThreeViewOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol QuizPartThreeViewOutput {
    var previousPartQuestionsCount: Int { get }
    func viewIsReady()
    func save(userText: String)
}
