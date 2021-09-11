//
//  Quiz.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

struct Quiz: Codable {
    var state: QuestionnaireState = .begin
    var userStatus: UserStatus = .none
}
