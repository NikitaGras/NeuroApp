//
//  ExportExportInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

class ExportInteractor: ExportInteractorInput {
    weak var output: ExportInteractorOutput!
    var service: QuizServiceProtocol = QuizService.shared
    
    var history: [Session] {
        return service.history
    }
}
