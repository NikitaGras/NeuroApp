//
//  UserStatusServiceObserver.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14.07.2021.
//

import Foundation

protocol UserStatusServiceObserver {
    func update(_ userStatus: UserStatus)
    func update(_ questionnaireState: QuestionnaireState)
}
