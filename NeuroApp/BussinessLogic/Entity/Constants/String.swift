//
//  String+errorDescription.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import Foundation

extension String {
    static let error = "Ошибка"
    
    struct Error {
        static let `default` = "Простите, что-то пошло не так. Попробуйте позже."
        static let noUser = "Простите, ваши данные утеряны."
    }
    
    struct ValidationError {
        static let wrongName = "Неправильно набрано имя"
        static let wrongAge = "Неправильно указан возраст"
        static let wrongEmail = "Неправильно указан email"
    }
    
    struct UserStatus {
        static let none = "None"
        static let negative = "Negative"
        static let positive = "Positive"
    }
    
    struct QustionaireState {
        static let begin = "BEGIN QUESTIONNAIRE"
        static let proceed = "RESUME QUESTIONNAIRE"
        static let notAvailable = "DAYS UNTIL NEXT SESSION"
    }
}
