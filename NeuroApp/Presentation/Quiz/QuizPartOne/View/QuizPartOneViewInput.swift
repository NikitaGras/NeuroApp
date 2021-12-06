//
//  QuizPartOneQuizPartOneViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/10/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol QuizPartOneViewInput: AnyObject, ViewInput {
    func setupInitialState()
    func show(_ question: PartOneQuestion)
    
    func setupProgressBar(viewsNumber: Int, currentIndex: Int, startValue: Int)
    func setupProgressViewStack(with quiz: Quiz)
    
    func moveProgressbar()
}
