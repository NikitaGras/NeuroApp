//
//  HomeHomeInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class HomeInteractor: HomeInteractorInput {
    weak var output: HomeInteractorOutput!

    //TODO: service
    func getStatus() -> UserStatus {
        return .none
    }
    
    func getState() -> QuestionnaireState {
        return .begin
    }
}
