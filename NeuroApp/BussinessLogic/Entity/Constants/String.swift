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
    
    struct Preview {
        static let begin = "Please answer the next few questions as quiqly as you can and to the best of your ability. The questionaire will consist of 3 parts: Self-Efficacy, Short-Answer and Long-Answer questions"
        static let partOneTitle = "Part 1: Self Efficacy"
        static let partOneInfo = "The following questions are designed to help us get a better understanding of any symptoms you might be experiencing in the areas of attention, memmory, organization and thinking. Please try to be objective in your answers."
        static let partTwoTitle = "Part 2: Short Answer"
        static let partTwoInfo = "The following questions are designed to test you using a few simple short-answer questions. Please try to answer these questions quickly and correctly."
        static let partThreeTitle = "Part 3: Long Answer"
        static let partThreeInfo = "The following questions are designed to test you using a few long-answer question. Please try to provide detailed medium-sized answers. You might find the dictating feature in your keyboard helpful."
    }
}
