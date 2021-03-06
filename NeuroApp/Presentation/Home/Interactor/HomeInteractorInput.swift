//
//  HomeHomeInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol HomeInteractorInput {
    var quiz: Quiz { get }
    
    func initialized()
    
    func getFinishTime() -> TimeInterval
    func startNewQuiz()
}
