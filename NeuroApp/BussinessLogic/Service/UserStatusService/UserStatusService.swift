//
//  UserStatusService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 14.07.2021.
//

import Foundation

class UserStatusService: UserStatusServiceProtocol {
    static let shared = UserStatusService()
    var userStatus: UserStatus = .none
    var questionnaireState: QuestionnaireState = .begin
    
    private init() {
        
    }
    
    func addObserver(_ observer: UserStatusServiceObserver) {
        
    }
    
    func removeObserver(_ observer: UserStatusServiceObserver) {
        
    }
    
    func notifyObservers() {
        
    }
}
