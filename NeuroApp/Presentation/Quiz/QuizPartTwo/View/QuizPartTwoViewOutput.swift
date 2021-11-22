//
//  QuizPartTwoQuizPartTwoViewOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 23/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol QuizPartTwoViewOutput {
    var selectedOption: Option? { get set }
    func viewIsReady()
    func viewDidLayout()
    func save()
}
