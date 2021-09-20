//
//  PreviewPreviewInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol PreviewInteractorInput {
    var quiz: Quiz { get }
    func registerObserver()
    func changeQuiz(with state: Quiz.State)
}
