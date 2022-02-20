//
//  ExportExportPresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

class ExportPresenter: ExportModuleInput, ExportViewOutput, ExportInteractorOutput {
    weak var view: ExportViewInput!
    var interactor: ExportInteractorInput!
    var router: ExportRouterInput!
    
    var csvFactory = CSVFactory()

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func prepareCsvFile() {
        do {
            guard !interactor.history.isEmpty else {
                throw SystemError.custom(String.Error.noDataForShare)
            }
            let csvFile = try csvFactory.createCSV(from: interactor.history)
            view.export(csvFile: csvFile)
        } catch {
            view.show(error, handler: nil)
        }
        
    }
}
