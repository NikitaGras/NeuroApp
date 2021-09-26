//
//  PreviewBaseInfoPreviewBaseInfoInteractorInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

import Foundation

protocol PreviewBaseInfoInteractorInput {
    func changeQuizStateToProceed()
    func getQuizState() -> Quiz.State
}
