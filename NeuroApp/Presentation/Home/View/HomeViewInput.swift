//
//  HomeHomeViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol HomeViewInput: AnyObject {
    func setupInitialState()
    func updateStatus(with status: UserStatus)
    func updateQuestionnaireButton(with state: QuestionnaireState)
}
